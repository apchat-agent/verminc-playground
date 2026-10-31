import { compileAndRunRetrying, compileOnlyRetrying, formatSource } from "./runner.js?v=08f9418e";

let compiler;
let files;
self.onmessage = async ({ data }) => {
  try {
    if (data.type === "init") {
      compiler = await WebAssembly.compile(data.compiler);
      files = data.files;
      const formatted = await formatSource(compiler, { formatter: data.formatter, source: "", files });
      if (formatted.exitCode !== 0) throw new Error(formatted.stderr);
      self.postMessage({ type: "ready" });
    } else if (data.type === "run") {
      if (data.graphics) {
        const compiled = await compileOnlyRetrying(compiler, { source: data.source, files });
        if (compiled.result.exitCode !== 0) {
          self.postMessage({ type: "graphics", result: compiled.result });
        } else {
          const wasm = compiled.program.buffer.slice(
            compiled.program.byteOffset,
            compiled.program.byteOffset + compiled.program.byteLength,
          );
          self.postMessage({ type: "graphics", result: compiled.result, wasm }, [wasm]);
        }
        return;
      }
      const result = await compileAndRunRetrying(compiler, {
        source: data.source,
        args: data.args,
        files,
      });
      self.postMessage({ type: "result", result });
    } else if (data.type === "format") {
      const result = await formatSource(compiler, {
        formatter: data.formatter, source: data.source, files,
      });
      self.postMessage({ type: "result", action: "format", result });
    }
  } catch (error) {
    self.postMessage({
      type: "error",
      message: `Playground host: ${error.message}`,
    });
  }
};
