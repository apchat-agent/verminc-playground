// An in-memory WASI preview1 host shared by the browser and Deno tests.
const encoder = new TextEncoder();
const decoder = new TextDecoder();
const E = {
  ACCES: 2,
  BADF: 8,
  EXIST: 20,
  FAULT: 21,
  INVAL: 28,
  ISDIR: 31,
  NOENT: 44,
  NOTDIR: 54,
  NOSYS: 52,
  NOTCAPABLE: 76,
};
class WasiError {
  constructor(errno) {
    this.errno = errno;
  }
}
class ProcessExit {
  constructor(code) {
    this.code = code >>> 0;
  }
}
const bytes = (value) =>
  typeof value === "string" ? encoder.encode(value) : new Uint8Array(value);

export class WasiHost {
  constructor({ args = [], files = {}, stdin = "", root = "/workspace" } = {}) {
    if (
      !root.startsWith("/") || root.includes("\0") ||
      root.split("/").includes("..")
    ) {
      throw new Error("WASI root must be an absolute directory");
    }
    this.root = "/" +
      root.split("/").filter((part) => part && part !== ".").join("/");
    this.args = args.map((arg) => encoder.encode(String(arg) + "\0"));
    this.files = new Map();
    this.directories = new Set([this.root]);
    for (const [name, value] of Object.entries(files)) {
      const relative = name.startsWith("/") ? this.relative(name) : name;
      const path = this.resolve(relative, false);
      if (path === this.root) {
        throw new Error("WASI file cannot replace the root directory");
      }
      this.files.set(path, bytes(value).slice());
      let parent = path.slice(0, path.lastIndexOf("/")) || "/";
      while (parent !== this.root) {
        this.directories.add(parent);
        parent = parent.slice(0, parent.lastIndexOf("/")) || "/";
      }
    }
    this.fds = new Map([
      [0, { data: bytes(stdin).slice(), position: 0, read: true }],
      [1, { stream: "stdout", write: true }],
      [2, { stream: "stderr", write: true }],
      [3, { directory: true }],
    ]);
    this.nextFd = 4;
    this.stdout = [];
    this.stderr = [];
    this.exitCode = 0;
    const calls = {};
    for (
      const name of [
        "fd_write",
        "fd_read",
        "fd_close",
        "path_open",
        "args_sizes_get",
        "args_get",
        "fd_prestat_get",
        "fd_prestat_dir_name",
        "path_filestat_get",
        "path_readlink",
        "environ_sizes_get",
        "environ_get",
        "clock_time_get",
      ]
    ) {
      calls[name] = (...args) => {
        try {
          return this[name](...args);
        } catch (error) {
          if (error instanceof WasiError) return error.errno;
          throw error;
        }
      };
    }
    calls.proc_exit = (code) => {
      throw new ProcessExit(code);
    };
    this.imports = new Proxy(calls, {
      get: (target, name) =>
        Object.hasOwn(target, name) ? target[name] : () => E.NOSYS,
    });
  }

  setMemory(memory) {
    this.memory = memory;
  }
  range(pointer, length) {
    pointer >>>= 0;
    if (
      !Number.isInteger(length) || length < 0 || !this.memory ||
      pointer + length > this.memory.buffer.byteLength
    ) {
      throw new WasiError(E.FAULT);
    }
    return new Uint8Array(this.memory.buffer, pointer, length);
  }
  view(pointer, length) {
    this.range(pointer, length);
    return new DataView(this.memory.buffer, pointer >>> 0, length);
  }
  u32(pointer, value) {
    this.view(pointer, 4).setUint32(0, value, true);
  }
  descriptor(fd) {
    const entry = this.fds.get(fd);
    if (!entry) throw new WasiError(E.BADF);
    return entry;
  }
  preopen(fd) {
    if (!this.descriptor(fd).directory) throw new WasiError(E.NOTDIR);
  }
  relative(path) {
    if (this.root === "/") return path.slice(1);
    if (path === this.root) return ".";
    if (!path.startsWith(this.root + "/")) throw new WasiError(E.NOTCAPABLE);
    return path.slice(this.root.length + 1);
  }
  resolve(path, checkParents = true) {
    if (!path || path.includes("\0")) throw new WasiError(E.INVAL);
    if (path.startsWith("/")) throw new WasiError(E.NOTCAPABLE);
    const parts = [];
    for (const part of path.split("/")) {
      // Each separator traverses the preceding component, even before
      // '.', '..' or the end of the path.
      if (checkParents && parts.length) {
        const parent = this.root === "/"
          ? "/" + parts.join("/")
          : this.root + "/" + parts.join("/");
        if (!this.directories.has(parent)) {
          throw new WasiError(this.files.has(parent) ? E.NOTDIR : E.NOENT);
        }
      }
      if (!part || part === ".") continue;
      if (part === "..") {
        if (!parts.length) throw new WasiError(E.NOTCAPABLE);
        parts.pop();
      } else {
        parts.push(part);
      }
    }
    return parts.length
      ? (this.root === "/" ? "" : this.root) + "/" + parts.join("/")
      : this.root;
  }
  path(fd, pointer, length) {
    this.preopen(fd);
    return this.resolve(decoder.decode(this.range(pointer, length)));
  }
  vectors(pointer, count, output) {
    this.range(output, 4);
    const view = this.view(pointer, (count >>> 0) * 8);
    const vectors = [];
    for (let i = 0; i < (count >>> 0); i++) {
      vectors.push(
        this.range(
          view.getUint32(i * 8, true),
          view.getUint32(i * 8 + 4, true),
        ),
      );
    }
    return vectors;
  }

  args_sizes_get(count, size) {
    this.range(count, 4);
    this.range(size, 4);
    this.u32(count, this.args.length);
    this.u32(size, this.args.reduce((sum, arg) => sum + arg.length, 0));
    return 0;
  }
  args_get(pointers, buffer) {
    this.range(pointers, this.args.length * 4);
    this.range(buffer, this.args.reduce((sum, arg) => sum + arg.length, 0));
    for (let i = 0; i < this.args.length; i++) {
      this.u32(pointers + i * 4, buffer);
      this.range(buffer, this.args[i].length).set(this.args[i]);
      buffer += this.args[i].length;
    }
    return 0;
  }
  environ_sizes_get(count, size) {
    this.range(count, 4);
    this.range(size, 4);
    this.u32(count, 0);
    this.u32(size, 0);
    return 0;
  }
  environ_get() {
    return 0;
  }
  clock_time_get(clock, _precision, result) {
    if (clock !== 0 && clock !== 1) return E.NOSYS;
    const now = clock === 0
      ? BigInt(Date.now()) * 1000000n
      : BigInt(Math.floor(performance.now() * 1000000));
    this.view(result, 8).setBigUint64(0, now, true);
    return 0;
  }
  fd_prestat_get(fd, result) {
    if (fd !== 3 || !this.fds.has(fd)) return E.BADF;
    this.range(result, 8).fill(0);
    this.u32(result + 4, encoder.encode(this.root).length);
    return 0;
  }
  fd_prestat_dir_name(fd, result, length) {
    if (fd !== 3 || !this.fds.has(fd)) return E.BADF;
    const name = encoder.encode(this.root);
    if ((length >>> 0) < name.length) return E.INVAL;
    this.range(result, name.length).set(name);
    return 0;
  }
  path_filestat_get(fd, flags, pointer, length, result) {
    this.range(result, 64);
    if (flags & ~1) return E.INVAL;
    const path = this.path(fd, pointer, length);
    const directory = this.directories.has(path);
    if (!directory && !this.files.has(path)) return E.NOENT;
    this.range(result, 64).fill(0);
    const view = this.view(result, 64);
    view.setUint8(16, directory ? 3 : 4);
    view.setBigUint64(24, 1n, true);
    view.setBigUint64(
      32,
      BigInt(directory ? 0 : this.files.get(path).length),
      true,
    );
    return 0;
  }
  path_readlink(fd, pointer, length, _buffer, _capacity, _used) {
    const path = this.path(fd, pointer, length);
    return this.files.has(path) || this.directories.has(path)
      ? E.INVAL
      : E.NOENT;
  }
  path_open(
    fd,
    lookupFlags,
    pointer,
    length,
    oflags,
    rights,
    _inheriting,
    fdflags,
    result,
  ) {
    this.range(result, 4);
    const path = this.path(fd, pointer, length);
    if (lookupFlags & ~1 || oflags & ~15) return E.INVAL;
    if (fdflags & ~1) return E.NOSYS;
    const read = (BigInt(rights) & 2n) !== 0n;
    const write = (BigInt(rights) & 64n) !== 0n;
    if (oflags & 2) return this.directories.has(path) ? E.NOSYS : E.NOTDIR;
    if (this.directories.has(path)) return E.ISDIR;
    if ((oflags & 5) === 5 && this.files.has(path)) return E.EXIST;
    if ((oflags & 8) && !write) return E.NOTCAPABLE;
    if (!this.files.has(path)) {
      if (!(oflags & 1)) return E.NOENT;
      if (!write) return E.NOTCAPABLE;
      this.files.set(path, new Uint8Array());
    }
    if (oflags & 8) this.files.set(path, new Uint8Array());
    const opened = this.nextFd++;
    this.fds.set(opened, {
      path,
      position: 0,
      read,
      write,
      append: !!(fdflags & 1),
    });
    this.u32(result, opened);
    return 0;
  }
  fd_close(fd) {
    this.descriptor(fd);
    this.fds.delete(fd);
    return 0;
  }
  fd_read(fd, pointer, count, result) {
    const entry = this.descriptor(fd);
    if (!entry.read) return E.ACCES;
    const vectors = this.vectors(pointer, count, result);
    const data = entry.path ? this.files.get(entry.path) : entry.data;
    let total = 0;
    for (const vector of vectors) {
      const chunk = data.subarray(
        entry.position,
        entry.position + vector.length,
      );
      vector.set(chunk);
      entry.position += chunk.length;
      total += chunk.length;
      if (chunk.length < vector.length) break;
    }
    this.u32(result, total);
    return 0;
  }
  fd_write(fd, pointer, count, result) {
    const entry = this.descriptor(fd);
    if (!entry.write) return E.ACCES;
    const vectors = this.vectors(pointer, count, result);
    let total = 0;
    for (const vector of vectors) {
      const chunk = vector.slice();
      if (entry.stream) this[entry.stream].push(chunk);
      else {
        const old = this.files.get(entry.path);
        if (entry.append) entry.position = old.length;
        const data = new Uint8Array(
          Math.max(old.length, entry.position + chunk.length),
        );
        data.set(old);
        data.set(chunk, entry.position);
        this.files.set(entry.path, data);
        entry.position += chunk.length;
      }
      total += chunk.length;
    }
    this.u32(result, total);
    return 0;
  }
  failure(error) {
    if (error instanceof ProcessExit) this.exitCode = error.code;
    else {
      this.exitCode = 1;
      this.stderr.push(
        encoder.encode(
          `WASI runtime error: ${error?.message || String(error)}\n`,
        ),
      );
    }
    return this.result();
  }
  result() {
    const text = (chunks) => {
      const joined = new Uint8Array(
        chunks.reduce((sum, chunk) => sum + chunk.length, 0),
      );
      let offset = 0;
      for (const chunk of chunks) {
        joined.set(chunk, offset);
        offset += chunk.length;
      }
      return decoder.decode(joined);
    };
    return {
      stdout: text(this.stdout),
      stderr: text(this.stderr),
      exitCode: this.exitCode,
      files: Object.fromEntries(
        [...this.files].map(([name, data]) => [name, data.slice()]),
      ),
    };
  }
  run(instance) {
    instance = instance.instance || instance;
    try {
      if (instance.exports.memory) this.setMemory(instance.exports.memory);
      if (typeof instance.exports._start !== "function") {
        throw new Error("module does not export _start");
      }
      instance.exports._start();
      return this.result();
    } catch (error) {
      return this.failure(error);
    }
  }
}

export async function runWasi(bytesOrModule, options = {}) {
  const host = new WasiHost(options);
  try {
    const instantiated = await WebAssembly.instantiate(bytesOrModule, {
      wasi_snapshot_preview1: host.imports,
    });
    return host.run(instantiated.instance || instantiated);
  } catch (error) {
    return host.failure(error);
  }
}
