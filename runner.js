import { runWasi } from "./wasi.js";

// The browser Worker and Deno acceptance tests use this exact compile/run path.
export async function compileAndRun(
  compiler,
  { source, args = [], files = {} },
) {
  const sourcePath = "/workspace/main.mc";
  const outputPath = "/workspace/program.wasm";
  const inputs = { ...files, [sourcePath]: source };
  delete inputs[outputPath];
  const compiled = await runWasi(compiler, {
    args: [
      "/workspace/compiler",
      "build",
      sourcePath,
      "--backend",
      "native",
      "--target",
      "wasm",
      "-o",
      outputPath,
    ],
    files: inputs,
  });
  if (compiled.exitCode !== 0) {
    return {
      phase: "compile",
      stdout: compiled.stdout,
      stderr: compiled.stderr,
      exitCode: compiled.exitCode,
    };
  }
  const program = compiled.files[outputPath];
  if (!program) {
    return {
      phase: "compile",
      stdout: compiled.stdout,
      stderr: compiled.stderr +
        "Playground: compiler produced no output module.\n",
      exitCode: 1,
    };
  }
  // Each execution has its own filesystem, descriptors and memory, even on rerun.
  const executed = await runWasi(program, {
    args: ["program", ...args],
    files,
  });
  return {
    phase: "run",
    stdout: executed.stdout,
    stderr: executed.stderr,
    exitCode: executed.exitCode,
  };
}
