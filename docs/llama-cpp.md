# llama.cpp on AMD

`llama.cpp` is one of the most practical entry points for local LLM inference on AMD hardware, especially when you want to run GGUF models locally with a small operational footprint.

## When To Use llama.cpp

Use it when you want:

- local inference without a large serving stack
- GGUF model support
- CPU-only testing
- a lightweight local server
- Vulkan or HIP-backed experimentation on AMD hardware

## CPU Backend

The CPU backend is the safest first step.

Use it when:

- you are validating a new model file
- you want broad compatibility
- you want to isolate prompt or model issues before testing GPU paths

Generic example:

```bash
llama-cli -m /path/to/model.gguf -p "Explain what ROCm is in simple terms."
```

## Vulkan Backend

The Vulkan backend is useful when:

- you want GPU inference on supported graphics stacks
- you prefer a path that does not depend on a full ROCm framework install

Treat Vulkan support as tool-specific and system-specific. Validate it on your exact machine.

## ROCm / HIP Backend

The HIP backend is the AMD-oriented GPU path tied to ROCm tooling.

Use it when:

- you want AMD GPU acceleration in `llama.cpp`
- your hardware and OS are supported by the ROCm path you are using

Be careful not to assume that a successful ROCm install automatically means every `llama.cpp` build or model configuration will behave well.

## GGUF Models

GGUF is the model format most people associate with `llama.cpp`. It is commonly used for local inference because it works well with quantized models and lightweight deployment workflows.

## Quantization

Quantization helps local AMD users fit models into available memory.

General rule:

- lower-bit quantization usually reduces memory use
- lower-bit quantization can also reduce quality or alter behavior

This repository does not assume one quantization is universally best. Report the exact quantization when sharing results.

## Common Command Examples

CLI inference:

```bash
llama-cli -m /path/to/model.gguf -n 256 -p "Write a short summary of Vulkan vs ROCm."
```

Conversation mode:

```bash
llama-cli -m /path/to/model.gguf -cnv
```

OpenAI-like local server:

```bash
llama-server -m /path/to/model.gguf --port 8080
```

## Benchmarking Notes

- Keep the model file identical across runs.
- Record quantization, context size, prompt, and backend.
- Separate warmup runs from measured runs.
- Record CPU threads and any GPU offload parameters.

## Troubleshooting Notes

- If GPU inference fails, retry on CPU first.
- If a model loads but behaves badly, confirm you used a matching chat template or prompt format.
- If performance is unexpectedly low, verify that the intended backend is actually active.
- If the runtime crashes during load, check memory pressure before assuming a backend bug.

## Sources

- AMD Gemma 4 technical article:
  https://www.amd.com/en/developer/resources/technical-articles/2026/day-0-support-for-gemma-4-on-amd-processors-and-gpus.html
- llama.cpp repository:
  https://github.com/ggml-org/llama.cpp

## TODO

- Add source-backed build notes for Vulkan and HIP once exact upstream commands are pinned for this repository.
- Add verified command examples for specific AMD GPUs and APUs.
