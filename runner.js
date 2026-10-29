import { runWasi } from "./wasi.js?v=80f3a88";

// The browser Worker and Deno acceptance tests use this exact compile/run path.
export async function compileAndRun(
  compiler,
  { source, args = [], files = {}, stdin = "", sourcePath = "/workspace/main.mc" },
) {
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
    stdin,
  });
  return {
    phase: "run",
    stdout: executed.stdout,
    stderr: executed.stderr,
    exitCode: executed.exitCode,
  };
}

// Graphics programs need their compiled module in the page thread, where the
// canvas and WebGL2 context live. Keep the text runner's compile/run path intact.
export async function compileOnly(compiler, { source, files = {}, sourcePath = "/workspace/main.mc" }) {
  const outputPath = "/workspace/program.wasm";
  const inputs = { ...files, [sourcePath]: source };
  delete inputs[outputPath];
  const compiled = await runWasi(compiler, {
    args: ["/workspace/compiler", "build", sourcePath, "--backend", "native", "--target", "wasm", "-o", outputPath],
    files: inputs,
  });
  if (compiled.exitCode !== 0) return { result: { phase: "compile", stdout: compiled.stdout, stderr: compiled.stderr, exitCode: compiled.exitCode } };
  const program = compiled.files[outputPath];
  if (!program) return { result: { phase: "compile", stdout: compiled.stdout, stderr: compiled.stderr + "Playground: compiler produced no output module.\n", exitCode: 1 } };
  return { result: { phase: "compile", stdout: compiled.stdout, stderr: compiled.stderr, exitCode: 0 }, program };
}

export async function compileOnlyRetrying(compiler, request, { retries = 8, delayMs = 100 } = {}) {
  let compiled = await compileOnly(compiler, request);
  for (let attempt = 1; attempt <= retries && isCompilerStackOverflow(compiled.result); attempt++) {
    await pause(delayMs * attempt);
    compiled = await compileOnly(compiler, request);
  }
  return compiled;
}

// Browsers first run a module in a baseline tier (Safari: an interpreter) whose stack frames are larger than
// optimized code, and a Worker's stack is small. Since the wasm backend shares locals between IR slots, every
// bundled example and the formatter compile at a 130 KB Liftoff-only stack with no warm-up, so the page no
// longer warms up on the examples. The retry stays as a safety net: the compiler is deterministic, so a
// compile that overflowed is retried once the engine may have tiered up; a user program that overflows
// while running is not.
const STACK_OVERFLOW = /maximum call stack size exceeded|too much recursion/i;
const pause = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

export function isCompilerStackOverflow(result) {
  return result.phase === "compile" && STACK_OVERFLOW.test(result.stderr);
}

export async function compileAndRunRetrying(compiler, request, { retries = 8, delayMs = 100 } = {}) {
  let result = await compileAndRun(compiler, request);
  for (let attempt = 1; attempt <= retries && isCompilerStackOverflow(result); attempt++) {
    await pause(delayMs * attempt);
    result = await compileAndRun(compiler, request);
  }
  return result;
}

// Formatting is an ordinary minc program, compiled from the editable source.
// Its location keeps the formatter's own relative parser imports valid.
export async function formatSource(compiler, { formatter, source, files = {} }) {
  return await compileAndRunRetrying(compiler, {
    source: formatter,
    sourcePath: "/workspace/tools/fmt.mc",
    stdin: source,
    files,
  });
}
