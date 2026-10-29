// A small WebGL2 host for the Wasm seam in playground/lib/sokol_all.mc.
// The module's import signatures are recorded in tmp/GFX-IMPORTS.md.  Any
// measured call that this triangle host does not implement fails by name.
import { WasiHost } from "../wasi.js?v=51683fe";

const asNumber = (value) => typeof value === "bigint" ? Number(value) : value;
const asUnsigned = (value) => Number(BigInt.asUintN(32, BigInt(value)));

function floatBits(value, bits) {
  const buffer = new ArrayBuffer(bits / 8);
  const view = new DataView(buffer);
  if (bits === 32) view.setFloat32(0, value, true);
  else view.setFloat64(0, value, true);
  return bits === 32 ? BigInt(view.getUint32(0, true)) : view.getBigUint64(0, true);
}

export function createGraphicsHost(canvas) {
  const gl = canvas.getContext("webgl2", {
    alpha: false,
    antialias: false,
    depth: true,
    preserveDrawingBuffer: true,
  });
  if (!gl) throw new Error("WebGL 2 is unavailable in this browser");

  const objects = new Map();
  const nextObject = new Map();
  let memory;
  let instance;
  let heap = 32 * 1024 * 1024;
  let raf = 0;
  let quit = false;
  let hostOutput = "";
  let lastPointer = { x: 0, y: 0 };

  const number = asNumber;
  const u32 = asUnsigned;
  const view = (pointer, length) => {
    const p = Number(pointer) >>> 0;
    if (!memory || p + length > memory.buffer.byteLength) {
      throw new RangeError(`WebGL host memory range ${p}+${length} is outside Wasm memory`);
    }
    return new DataView(memory.buffer, p, length);
  };
  const readBytes = (pointer, length) =>
    new Uint8Array(memory.buffer, Number(pointer) >>> 0, Number(length)).slice();
  const readCString = (pointer, length = 1 << 20) => {
    const p = Number(pointer) >>> 0;
    const bytes = new Uint8Array(memory.buffer, p, Math.min(length, memory.buffer.byteLength - p));
    const end = bytes.indexOf(0);
    return new TextDecoder().decode(bytes.subarray(0, end < 0 ? bytes.length : end));
  };
  const storeU32 = (pointer, value) => view(pointer, 4).setUint32(0, Number(value) >>> 0, true);
  const storeI32 = (pointer, value) => view(pointer, 4).setInt32(0, Number(value) | 0, true);
  const storeF32 = (pointer, value) => view(pointer, 4).setFloat32(0, value, true);
  const readU32s = (pointer, count) => {
    const result = [];
    for (let i = 0; i < Number(count); i++) result.push(view(Number(pointer) + i * 4, 4).getUint32(0, true));
    return result;
  };
  const readI32s = (pointer, count) => {
    const result = [];
    for (let i = 0; i < Number(count); i++) result.push(view(Number(pointer) + i * 4, 4).getInt32(0, true));
    return result;
  };
  const readF32s = (pointer, count) => {
    const result = [];
    for (let i = 0; i < Number(count); i++) result.push(view(Number(pointer) + i * 4, 4).getFloat32(0, true));
    return result;
  };
  const saveBytes = (pointer, data, capacity) => {
    const p = Number(pointer) >>> 0;
    const size = Math.max(0, Math.min(Number(capacity), data.length));
    new Uint8Array(memory.buffer, p, size).set(data.subarray(0, size));
  };
  const cStringPointer = (text) => {
    const data = new TextEncoder().encode(`${text}\0`);
    const p = malloc(BigInt(data.length));
    new Uint8Array(memory.buffer, p, data.length).set(data);
    return p;
  };
  const lookup = (kind, id) => objects.get(kind)?.get(Number(id)) ?? null;
  const remember = (kind, value) => {
    const id = (nextObject.get(kind) ?? 0) + 1;
    nextObject.set(kind, id);
    if (!objects.has(kind)) objects.set(kind, new Map());
    objects.get(kind).set(id, value);
    return id;
  };
  const forget = (kind, id) => objects.get(kind)?.delete(Number(id));
  const makeMany = (kind, make, count, pointer) => {
    for (let i = 0; i < Number(count); i++) storeU32(Number(pointer) + i * 4, remember(kind, make()));
  };
  const deleteMany = (kind, destroy, count, pointer) => {
    for (const id of readU32s(pointer, count)) {
      const object = lookup(kind, id);
      if (object) destroy(object);
      forget(kind, id);
    }
  };
  const ensureMemory = (end) => {
    if (end <= memory.buffer.byteLength) return;
    memory.grow(Math.ceil((end - memory.buffer.byteLength) / 65536));
  };
  function malloc(size) {
    const n = Math.max(1, Math.ceil(Number(size) / 8) * 8);
    const start = heap;
    heap += n;
    ensureMemory(heap + 8);
    return start;
  }

  const glImports = {
    glActiveTexture: (a) => gl.activeTexture(number(a)),
    glAttachShader: (p, s) => gl.attachShader(lookup("program", p), lookup("shader", s)),
    glBindBuffer: (target, id) => gl.bindBuffer(number(target), lookup("buffer", id)),
    glBindBufferBase: (target, index, id) => gl.bindBufferBase(number(target), number(index), lookup("buffer", id)),
    glBindBufferRange: (target, index, id, offset, size) => gl.bindBufferRange(number(target), number(index), lookup("buffer", id), number(offset), number(size)),
    glBindFramebuffer: (target, id) => gl.bindFramebuffer(number(target), lookup("framebuffer", id)),
    glBindRenderbuffer: (target, id) => gl.bindRenderbuffer(number(target), lookup("renderbuffer", id)),
    glBindSampler: (unit, id) => gl.bindSampler(number(unit), lookup("sampler", id)),
    glBindTexture: (target, id) => gl.bindTexture(number(target), lookup("texture", id)),
    glBindVertexArray: (id) => gl.bindVertexArray(lookup("vertexArray", id)),
    glBlendColor: (...args) => gl.blendColor(...args),
    glBlendEquationSeparate: (a, b) => gl.blendEquationSeparate(number(a), number(b)),
    glBlendFuncSeparate: (...args) => gl.blendFuncSeparate(...args.map(number)),
    glBlitFramebuffer: (...args) => gl.blitFramebuffer(...args.map(number)),
    glBufferData: (target, size, pointer, usage) => {
      const length = Number(size);
      gl.bufferData(number(target), Number(pointer) === 0 ? length : readBytes(pointer, length), number(usage));
    },
    glBufferSubData: (target, offset, size, pointer) => gl.bufferSubData(number(target), Number(offset), readBytes(pointer, size)),
    glCheckFramebufferStatus: (target) => BigInt(gl.checkFramebufferStatus(number(target))),
    glClearBufferfi: (buffer, drawbuffer, depth, stencil) => gl.clearBufferfi(number(buffer), number(drawbuffer), depth, number(stencil)),
    glClearBufferfv: (buffer, drawbuffer, pointer) => gl.clearBufferfv(number(buffer), number(drawbuffer), readF32s(pointer, number(buffer) === gl.COLOR ? 4 : 1)),
    glClearBufferiv: (buffer, drawbuffer, pointer) => gl.clearBufferiv(number(buffer), number(drawbuffer), readI32s(pointer, number(buffer) === gl.COLOR ? 4 : 1)),
    glColorMask: (r, g, b, a) => gl.colorMask(!!number(r), !!number(g), !!number(b), !!number(a)),
    glCompressedTexSubImage2D: (target, level, x, y, width, height, format, imageSize, pointer) =>
      gl.compressedTexSubImage2D(number(target), number(level), number(x), number(y), number(width), number(height), number(format), readBytes(pointer, number(imageSize))),
    glCompressedTexSubImage3D: (target, level, x, y, z, width, height, depth, format, imageSize, pointer) =>
      gl.compressedTexSubImage3D(number(target), number(level), number(x), number(y), number(z), number(width), number(height), number(depth), number(format), readBytes(pointer, number(imageSize))),
    glCompileShader: (id) => gl.compileShader(lookup("shader", id)),
    glCreateProgram: () => BigInt(remember("program", gl.createProgram())),
    glCreateShader: (type) => BigInt(remember("shader", gl.createShader(number(type)))),
    glCullFace: (a) => gl.cullFace(number(a)),
    glDeleteBuffers: (n, p) => deleteMany("buffer", (x) => gl.deleteBuffer(x), n, p),
    glDeleteFramebuffers: (n, p) => deleteMany("framebuffer", (x) => gl.deleteFramebuffer(x), n, p),
    glDeleteProgram: (id) => { const x = lookup("program", id); if (x) gl.deleteProgram(x); forget("program", id); },
    glDeleteRenderbuffers: (n, p) => deleteMany("renderbuffer", (x) => gl.deleteRenderbuffer(x), n, p),
    glDeleteSamplers: (n, p) => deleteMany("sampler", (x) => gl.deleteSampler(x), n, p),
    glDeleteShader: (id) => { const x = lookup("shader", id); if (x) gl.deleteShader(x); forget("shader", id); },
    glDeleteTextures: (n, p) => deleteMany("texture", (x) => gl.deleteTexture(x), n, p),
    glDeleteVertexArrays: (n, p) => deleteMany("vertexArray", (x) => gl.deleteVertexArray(x), n, p),
    glDepthFunc: (a) => gl.depthFunc(number(a)),
    glDepthMask: (a) => gl.depthMask(!!number(a)),
    glDisable: (a) => gl.disable(number(a)),
    glDisableVertexAttribArray: (a) => gl.disableVertexAttribArray(number(a)),
    glDrawArrays: (mode, first, count) => gl.drawArrays(number(mode), number(first), number(count)),
    glDrawArraysInstanced: (mode, first, count, instances) => gl.drawArraysInstanced(number(mode), number(first), number(count), number(instances)),
    glDrawBuffers: (n, p) => gl.drawBuffers(readU32s(p, n)),
    glDrawElements: (mode, count, type, offset) => gl.drawElements(number(mode), number(count), number(type), Number(offset)),
    glDrawElementsInstanced: (mode, count, type, offset, instances) => gl.drawElementsInstanced(number(mode), number(count), number(type), Number(offset), number(instances)),
    glEnable: (a) => gl.enable(number(a)),
    glEnableVertexAttribArray: (a) => gl.enableVertexAttribArray(number(a)),
    glFramebufferRenderbuffer: (target, attachment, renderbufferTarget, id) => gl.framebufferRenderbuffer(number(target), number(attachment), number(renderbufferTarget), lookup("renderbuffer", id)),
    glFramebufferTexture2D: (target, attachment, textarget, id, level) => gl.framebufferTexture2D(number(target), number(attachment), number(textarget), lookup("texture", id), number(level)),
    glFramebufferTextureLayer: (target, attachment, id, level, layer) => gl.framebufferTextureLayer(number(target), number(attachment), lookup("texture", id), number(level), number(layer)),
    glFrontFace: (a) => gl.frontFace(number(a)),
    glGenBuffers: (n, p) => makeMany("buffer", () => gl.createBuffer(), n, p),
    glGenFramebuffers: (n, p) => makeMany("framebuffer", () => gl.createFramebuffer(), n, p),
    glGenRenderbuffers: (n, p) => makeMany("renderbuffer", () => gl.createRenderbuffer(), n, p),
    glGenSamplers: (n, p) => makeMany("sampler", () => gl.createSampler(), n, p),
    glGenTextures: (n, p) => makeMany("texture", () => gl.createTexture(), n, p),
    glGenVertexArrays: (n, p) => makeMany("vertexArray", () => gl.createVertexArray(), n, p),
    glGetAttribLocation: (program, name) => gl.getAttribLocation(lookup("program", program), readCString(name)),
    glGetError: () => BigInt(gl.getError()),
    glGetIntegerv: (pname, pointer) => {
      const key = number(pname);
      const known = new Map([
        [0x821B, 3], [0x821C, 0], [0x821D, gl.getSupportedExtensions()?.length ?? 0],
        [0x0D33, gl.getParameter(gl.MAX_TEXTURE_SIZE)], [0x8869, gl.getParameter(gl.MAX_VERTEX_ATTRIBS)],
        [0x8B4D, gl.getParameter(gl.MAX_COMBINED_TEXTURE_IMAGE_UNITS)], [0x8824, gl.getParameter(gl.MAX_DRAW_BUFFERS)],
        [0x88FF, gl.getParameter(gl.MAX_ARRAY_TEXTURE_LAYERS)], [0x8073, gl.getParameter(gl.MAX_3D_TEXTURE_SIZE)],
      ]);
      const value = known.has(key) ? known.get(key) : gl.getParameter(key);
      storeI32(pointer, typeof value === "number" ? value : 0);
    },
    glGetProgramInfoLog: (id, capacity, lengthPointer, output) => {
      const text = gl.getProgramInfoLog(lookup("program", id)) ?? "";
      const data = new TextEncoder().encode(text + "\0");
      saveBytes(output, data, capacity);
      if (Number(lengthPointer)) storeI32(lengthPointer, Math.min(text.length, Math.max(0, Number(capacity) - 1)));
    },
    glGetProgramiv: (id, pname, output) => {
      const program = lookup("program", id);
      const key = number(pname);
      const value = key === gl.INFO_LOG_LENGTH
        ? (gl.getProgramInfoLog(program)?.length ?? 0) + 1
        : gl.getProgramParameter(program, key);
      storeI32(output, typeof value === "boolean" ? Number(value) : (value ?? 0));
    },
    glGetShaderInfoLog: (id, capacity, lengthPointer, output) => {
      const text = gl.getShaderInfoLog(lookup("shader", id)) ?? "";
      const data = new TextEncoder().encode(text + "\0");
      saveBytes(output, data, capacity);
      if (Number(lengthPointer)) storeI32(lengthPointer, Math.min(text.length, Math.max(0, Number(capacity) - 1)));
    },
    glGetShaderiv: (id, pname, output) => {
      const shader = lookup("shader", id);
      const key = number(pname);
      const value = key === gl.INFO_LOG_LENGTH
        ? (gl.getShaderInfoLog(shader)?.length ?? 0) + 1
        : gl.getShaderParameter(shader, key);
      storeI32(output, typeof value === "boolean" ? Number(value) : (value ?? 0));
    },
    glGetStringi: (pname, index) => {
      if (number(pname) !== gl.EXTENSIONS) return 0;
      const extensions = gl.getSupportedExtensions() ?? [];
      const value = extensions[number(index)];
      return value === undefined ? 0 : cStringPointer(value);
    },
    glGetUniformLocation: (program, name) => {
      const location = gl.getUniformLocation(lookup("program", program), readCString(name));
      return location === null ? -1 : remember("uniform", location);
    },
    glInvalidateFramebuffer: (target, count, attachments) => gl.invalidateFramebuffer(number(target), readU32s(attachments, count)),
    glLinkProgram: (id) => gl.linkProgram(lookup("program", id)),
    glPixelStorei: (pname, param) => gl.pixelStorei(number(pname), number(param)),
    glPolygonOffset: (factor, units) => gl.polygonOffset(factor, units),
    glReadBuffer: (a) => gl.readBuffer(number(a)),
    glRenderbufferStorageMultisample: (target, samples, format, width, height) =>
      gl.renderbufferStorageMultisample(number(target), number(samples), number(format), number(width), number(height)),
    glSamplerParameterf: (id, pname, param) => gl.samplerParameterf(lookup("sampler", id), number(pname), param),
    glSamplerParameteri: (id, pname, param) => gl.samplerParameteri(lookup("sampler", id), number(pname), number(param)),
    glScissor: (...args) => gl.scissor(...args.map(number)),
    glShaderSource: (shader, count, strings, lengths) => {
      const parts = [];
      for (let i = 0; i < number(count); i++) {
        const pointer = view(Number(strings) + i * 4, 4).getUint32(0, true);
        const length = Number(lengths) ? view(Number(lengths) + i * 4, 4).getInt32(0, true) : -1;
        parts.push(readCString(pointer, length >= 0 ? length : 1 << 20));
      }
      gl.shaderSource(lookup("shader", shader), parts.join(""));
    },
    glStencilFunc: (a, b, c) => gl.stencilFunc(number(a), number(b), number(c)),
    glStencilFuncSeparate: (a, b, c, d) => gl.stencilFuncSeparate(number(a), number(b), number(c), number(d)),
    glStencilMask: (a) => gl.stencilMask(number(a)),
    glStencilOp: (...args) => gl.stencilOp(...args.map(number)),
    glStencilOpSeparate: (...args) => gl.stencilOpSeparate(...args.map(number)),
    glTexStorage2D: (...args) => gl.texStorage2D(...args.map(number)),
    glTexStorage3D: (...args) => gl.texStorage3D(...args.map(number)),
    glTexSubImage2D: (target, level, x, y, width, height, format, type, pointer) => {
      const unpackBuffer = gl.getParameter(gl.PIXEL_UNPACK_BUFFER_BINDING);
      const data = unpackBuffer
        ? Number(pointer)
        : readBytes(pointer, Math.max(0, number(width) * number(height) * 4));
      gl.texSubImage2D(number(target), number(level), number(x), number(y), number(width), number(height), number(format), number(type), data);
    },
    glTexSubImage3D: (target, level, x, y, z, width, height, depth, format, type, pointer) => {
      const unpackBuffer = gl.getParameter(gl.PIXEL_UNPACK_BUFFER_BINDING);
      const data = unpackBuffer
        ? Number(pointer)
        : readBytes(pointer, Math.max(0, number(width) * number(height) * number(depth) * 4));
      gl.texSubImage3D(number(target), number(level), number(x), number(y), number(z), number(width), number(height), number(depth), number(format), number(type), data);
    },
    glUseProgram: (id) => gl.useProgram(lookup("program", id)),
    glUniform1i: (location, value) => gl.uniform1i(lookup("uniform", location), number(value)),
    glUniform1fv: (location, count, p) => gl.uniform1fv(lookup("uniform", location), readF32s(p, number(count))),
    glUniform2fv: (location, count, p) => gl.uniform2fv(lookup("uniform", location), readF32s(p, number(count) * 2)),
    glUniform3fv: (location, count, p) => gl.uniform3fv(lookup("uniform", location), readF32s(p, number(count) * 3)),
    glUniform4fv: (location, count, p) => gl.uniform4fv(lookup("uniform", location), readF32s(p, number(count) * 4)),
    glUniform1iv: (location, count, p) => gl.uniform1iv(lookup("uniform", location), readI32s(p, number(count))),
    glUniform2iv: (location, count, p) => gl.uniform2iv(lookup("uniform", location), readI32s(p, number(count) * 2)),
    glUniform3iv: (location, count, p) => gl.uniform3iv(lookup("uniform", location), readI32s(p, number(count) * 3)),
    glUniform4iv: (location, count, p) => gl.uniform4iv(lookup("uniform", location), readI32s(p, number(count) * 4)),
    glUniformMatrix4fv: (location, count, transpose, p) => gl.uniformMatrix4fv(lookup("uniform", location), !!number(transpose), readF32s(p, number(count) * 16)),
    glVertexAttribDivisor: (index, divisor) => gl.vertexAttribDivisor(number(index), number(divisor)),
    glVertexAttribIPointer: (index, size, type, stride, offset) => gl.vertexAttribIPointer(number(index), number(size), number(type), number(stride), Number(offset)),
    glVertexAttribPointer: (index, size, type, normalized, stride, offset) => gl.vertexAttribPointer(number(index), number(size), number(type), !!number(normalized), number(stride), Number(offset)),
    glViewport: (...args) => gl.viewport(...args.map(number)),
  };
  const glNamespace = new Proxy(glImports, {
    get(target, name) {
      if (Object.hasOwn(target, name)) return target[name];
      return () => { throw new Error(`not implemented in verminc host: ${String(name)}`); };
    },
  });
  const wasi = new WasiHost();

  const dpi = () => Math.max(1, window.devicePixelRatio || 1);
  const resize = () => {
    const ratio = dpi();
    const width = Math.max(1, Math.round((canvas.clientWidth || canvas.width || 256) * ratio));
    const height = Math.max(1, Math.round((canvas.clientHeight || canvas.height || 256) * ratio));
    if (canvas.width !== width || canvas.height !== height) {
      canvas.width = width;
      canvas.height = height;
      instance?.exports._sapp_wasm_event_resized?.(BigInt(width), BigInt(height));
    }
  };
  const sapp = {
    sapp_host_width: () => canvas.width,
    sapp_host_height: () => canvas.height,
    sapp_host_dpi: () => Math.round(dpi() * 1000),
    sapp_host_request_quit: () => { quit = true; if (raf) cancelAnimationFrame(raf); },
    sapp_host_quit_pending: () => Number(quit),
    sapp_host_log: (pointer, length) => { hostOutput += readCString(pointer, number(length)); },
  };
  const env = {
    clock: () => BigInt(Math.floor(performance.now() * 1e6)),
    write: (fd, pointer, length) => {
      const text = new TextDecoder().decode(readBytes(pointer, number(length)));
      hostOutput += text;
      if (number(fd) === 2) console.warn(text);
      else if (number(fd) === 1) console.log(text);
      return BigInt(number(length));
    },
    __sys_exit: (code) => { quit = true; return BigInt.asIntN(64, BigInt(code)); },
  };
  const imports = {
    env,
    gl: glNamespace,
    sapp,
    wasi_snapshot_preview1: wasi.imports,
    "libSystem.B.dylib": {
      malloc: (size) => malloc(size),
      free: () => {},
    },
  };

  const modifiers = (event) => {
    let bits = (event.shiftKey ? 1 : 0) | (event.ctrlKey ? 2 : 0)
      | (event.altKey ? 4 : 0) | (event.metaKey ? 8 : 0);
    if (event.buttons & 1) bits |= 256;
    if (event.buttons & 2) bits |= 512;
    if (event.buttons & 4) bits |= 1024;
    return BigInt(bits);
  };
  function sendMouseMove(event) {
    if (!instance) return;
    const rect = canvas.getBoundingClientRect();
    const x = (event.clientX - rect.left) * canvas.width / rect.width;
    const y = (event.clientY - rect.top) * canvas.height / rect.height;
    const args = instance.exports._sapp_wasm_event_mouse_move;
    args?.(floatBits(x, 32), floatBits(y, 32), floatBits(event.movementX || x - lastPointer.x, 32), floatBits(event.movementY || y - lastPointer.y, 32), modifiers(event));
    lastPointer = { x, y };
  }
  const onMove = (event) => sendMouseMove(event);
  const mouseButton = (button) => button === 2 ? 1 : button === 1 ? 2 : button === 0 ? 0 : 256;
  const onDown = (event) => {
    canvas.focus();
    sendMouseMove(event);
    instance?.exports._sapp_wasm_event_mouse_button?.(1n, BigInt(mouseButton(event.button)), floatBits(lastPointer.x, 32), floatBits(lastPointer.y, 32), modifiers(event));
  };
  const onUp = (event) => instance?.exports._sapp_wasm_event_mouse_button?.(0n, BigInt(mouseButton(event.button)), floatBits(lastPointer.x, 32), floatBits(lastPointer.y, 32), modifiers(event));
  const onWheel = (event) => {
    event.preventDefault();
    const scale = event.deltaMode === WheelEvent.DOM_DELTA_LINE ? 1 / 40
      : event.deltaMode === WheelEvent.DOM_DELTA_PAGE ? 1 : 1 / 100;
    instance?.exports._sapp_wasm_event_mouse_scroll?.(floatBits(event.deltaX * scale, 32), floatBits(event.deltaY * scale, 32), modifiers(event));
  };
  const onEnter = (event) => instance?.exports._sapp_wasm_event_mouse_enter_leave?.(1n, modifiers(event));
  const onLeave = (event) => instance?.exports._sapp_wasm_event_mouse_enter_leave?.(0n, modifiers(event));
  const keyCodeByCode = {
    Space: 32, Quote: 39, Comma: 44, Minus: 45, Period: 46, Slash: 47,
    Semicolon: 59, Equal: 61, BracketLeft: 91, Backslash: 92,
    BracketRight: 93, Backquote: 96, IntlBackslash: 161, IntlRo: 162,
    Escape: 256, Enter: 257, Tab: 258, Backspace: 259, Insert: 260,
    Delete: 261, ArrowRight: 262, ArrowLeft: 263, ArrowDown: 264,
    ArrowUp: 265, PageUp: 266, PageDown: 267, Home: 268, End: 269,
    CapsLock: 280, ScrollLock: 281, NumLock: 282, PrintScreen: 283, Pause: 284,
    NumpadDecimal: 330, NumpadDivide: 331, NumpadMultiply: 332,
    NumpadSubtract: 333, NumpadAdd: 334, NumpadEnter: 335, NumpadEqual: 336,
    ShiftLeft: 340, ControlLeft: 341, AltLeft: 342, MetaLeft: 343,
    ShiftRight: 344, ControlRight: 345, AltRight: 346, MetaRight: 347,
    ContextMenu: 348,
    ...Object.fromEntries(Array.from({length: 10}, (_, i) => [`Digit${i}`, 48 + i])),
    ...Object.fromEntries(Array.from({length: 26}, (_, i) => [`Key${String.fromCharCode(65 + i)}`, 65 + i])),
    ...Object.fromEntries(Array.from({length: 25}, (_, i) => [`F${i + 1}`, 290 + i])),
    ...Object.fromEntries(Array.from({length: 10}, (_, i) => [`Numpad${i}`, 320 + i])),
  };
  const keyCodeByKey = {
    Escape: 256, Enter: 257, Tab: 258, Backspace: 259, Insert: 260,
    Delete: 261, ArrowRight: 262, ArrowLeft: 263, ArrowDown: 264,
    ArrowUp: 265, PageUp: 266, PageDown: 267, Home: 268, End: 269,
    CapsLock: 280, ScrollLock: 281, NumLock: 282, PrintScreen: 283, Pause: 284,
    Shift: 340, Control: 341, Alt: 342, Meta: 343, ContextMenu: 348,
    " ": 32, "'": 39, ",": 44, "-": 45, ".": 46, "/": 47,
    ";": 59, "=": 61, "[": 91, "\\": 92, "]": 93, "`": 96,
  };
  const keyCode = (event) => keyCodeByCode[event.code] ?? keyCodeByKey[event.key]
    ?? (Array.from(event.key).length === 1 && event.key.codePointAt(0) <= 0x7f
      ? event.key.toUpperCase().charCodeAt(0) : 0);
  const onKeyDown = (event) => {
    event.preventDefault();
    instance?.exports._sapp_wasm_event_key?.(1n, BigInt(keyCode(event)), modifiers(event), BigInt(Number(event.repeat)));
    const altGraph = event.getModifierState?.("AltGraph") === true;
    if (Array.from(event.key).length === 1 && !event.ctrlKey && !event.metaKey && (!event.altKey || altGraph)) {
      instance?.exports._sapp_wasm_event_char?.(BigInt(event.key.codePointAt(0)), modifiers(event), BigInt(Number(event.repeat)));
    }
  };
  const onKeyUp = (event) => {
    event.preventDefault();
    instance?.exports._sapp_wasm_event_key?.(0n, BigInt(keyCode(event)), modifiers(event), BigInt(Number(event.repeat)));
  };
  canvas.addEventListener("mousemove", onMove);
  canvas.addEventListener("mousedown", onDown);
  canvas.addEventListener("mouseup", onUp);
  canvas.addEventListener("wheel", onWheel, { passive: false });
  canvas.addEventListener("mouseenter", onEnter);
  canvas.addEventListener("mouseleave", onLeave);
  canvas.addEventListener("keydown", onKeyDown);
  canvas.addEventListener("keyup", onKeyUp);
  window.addEventListener("resize", resize);

  return {
    canvas,
    gl,
    imports,
    get output() { return hostOutput; },
    async run(bytes) {
      resize();
      const result = await WebAssembly.instantiate(bytes, imports);
      instance = result.instance || result;
      memory = instance.exports.memory;
      if (!memory) throw new Error("graphics module does not export memory");
      // Keep host-owned allocations away from the compiler's 16 MiB stack and heap base.
      ensureMemory(heap + 8);
      const wasiResult = wasi.run(instance);
      if (wasiResult.exitCode !== 0) {
        throw new Error(`graphics module exited with status ${wasiResult.exitCode}: ${wasiResult.stderr}`);
      }
      if (typeof instance.exports._sapp_wasm_frame !== "function") {
        throw new Error("graphics module does not export _sapp_wasm_frame");
      }
      resize();
      const frame = (time) => {
        if (quit || !instance) return;
        try {
          instance.exports._sapp_wasm_frame(floatBits(time, 64));
        } catch (error) {
          quit = true;
          throw error;
        }
        if (!quit) raf = requestAnimationFrame(frame);
      };
      raf = requestAnimationFrame(frame);
      return instance;
    },
    dispose() {
      quit = true;
      if (raf) cancelAnimationFrame(raf);
      canvas.removeEventListener("mousemove", onMove);
      canvas.removeEventListener("mousedown", onDown);
      canvas.removeEventListener("mouseup", onUp);
      canvas.removeEventListener("wheel", onWheel);
      canvas.removeEventListener("mouseenter", onEnter);
      canvas.removeEventListener("mouseleave", onLeave);
      canvas.removeEventListener("keydown", onKeyDown);
      canvas.removeEventListener("keyup", onKeyUp);
      window.removeEventListener("resize", resize);
    },
  };
}
