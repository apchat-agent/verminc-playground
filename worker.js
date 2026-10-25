import { compileAndRunRetrying, formatSource, warmUp } from "./runner.js?v=de9f3fc";

let compiler;
let files;
self.onmessage = async ({ data }) => {
  try {
    if (data.type === "init") {
      compiler = await WebAssembly.compile(data.compiler);
      files = data.files;
      await warmUp(compiler, files, data.warmup ?? []);
      const formatted = await formatSource(compiler, { formatter: data.formatter, source: "", files });
      if (formatted.exitCode !== 0) throw new Error(formatted.stderr);
      self.postMessage({ type: "ready" });
    } else if (data.type === "run") {
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
