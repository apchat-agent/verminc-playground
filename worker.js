import { compileAndRunRetrying, warmUp } from "./runner.js";

let compiler;
let files;
self.onmessage = async ({ data }) => {
  try {
    if (data.type === "init") {
      compiler = await WebAssembly.compile(data.compiler);
      files = data.files;
      await warmUp(compiler, files, data.warmup ?? []);
      self.postMessage({ type: "ready" });
    } else if (data.type === "run") {
      const result = await compileAndRunRetrying(compiler, {
        source: data.source,
        args: data.args,
        files,
      });
      self.postMessage({ type: "result", result });
    }
  } catch (error) {
    self.postMessage({
      type: "error",
      message: `Playground host: ${error.message}`,
    });
  }
};
