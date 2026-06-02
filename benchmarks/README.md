# Benchmarking Philosophy

This repository accepts benchmarks, but only when they are reproducible enough to be useful.

## Reproducibility Rules

- Report exact hardware.
- Report OS, kernel, driver, and runtime details.
- Report model name and revision if known.
- Report quantization or dtype.
- Report the exact command.
- Report prompt, context, and generation settings.
- Report whether the run was cold, warm, or mixed.

## Why Benchmark Comparisons Can Be Misleading

Benchmark results are often distorted by differences in:

- model quantization
- prompt length
- context size
- warmup behavior
- clock, thermal, or power limits
- backend selection
- CPU thread count
- memory pressure

Two reports that both claim "tokens per second" may still be measuring different things.

## Required Metadata

Every benchmark submission should include:

- hardware
- memory or VRAM
- operating system
- kernel if relevant
- driver/runtime versions
- stack and backend
- model and quantization
- exact command
- prompt configuration
- context size
- raw output

## What Metrics To Report

Report what the runtime actually exposes. Common examples:

- tokens per second
- prompt processing speed
- time to first token
- latency per request
- total completion time
- peak memory or VRAM observations

If your tool does not emit a metric directly, say so instead of estimating it.

## How To Submit a Benchmark

1. Copy [template.md](template.md).
2. Fill in every field you can verify.
3. Attach raw output.
4. Label uncertainty clearly.
5. Open a pull request or issue.

## Recommended Validation Flow

- confirm the environment is stable
- run a small sanity-check model first
- run at least one warmup pass if the runtime has heavy initialization
- keep model and prompt fixed across comparisons

## TODO

- Add benchmark normalization notes for comparing server inference and single-user CLI inference.
