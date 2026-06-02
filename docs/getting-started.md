# Getting Started with LLMs on AMD Hardware

This guide is for people who are new to local or self-hosted LLMs on AMD systems.

## Start with the Basic Question

Before choosing a stack, decide what you actually need:

| Goal | Good First Option |
| --- | --- |
| Try a small model locally with minimum friction | CPU-only `llama.cpp` or `Ollama` |
| Use your AMD GPU for local inference | `llama.cpp` with Vulkan or ROCm/HIP, depending on support |
| Build a local API server | `Ollama`, `llama.cpp` server, or `vLLM` |
| Use Python for custom inference code | `PyTorch ROCm` |
| Run throughput-oriented serving | `vLLM` |

## Key Concepts

### CPU inference

The model runs on the CPU. This is usually the broadest compatibility path and the safest way to confirm that a model file, prompt format, and runtime all work.

### GPU inference

The model runs partly or mostly on the GPU. This can improve throughput and latency, but it increases setup complexity and support constraints.

### ROCm

ROCm is AMD's software stack for GPU-accelerated computing. In practice, it matters when you want frameworks such as PyTorch or engines such as vLLM to use AMD acceleration on supported systems. ROCm support is highly dependent on operating system, driver, hardware generation, and release compatibility, so always check upstream matrices before installing.

### Vulkan

Vulkan is a graphics and compute API that some inference tools can use as a backend. For AMD users, Vulkan can be useful when you want GPU acceleration but do not want to depend on ROCm, or when ROCm is not mature on a given machine.

### HIP

HIP is AMD's portability layer for GPU programming. When a project says it has a HIP backend, that usually means it has an AMD-oriented GPU path tied to ROCm tooling.

### GGUF models

GGUF is a model format commonly used with `llama.cpp` and related local inference tools. It is especially common for quantized local models.

### Quantization

Quantization reduces model precision to shrink memory use and often speed up inference. Lower-bit formats can make a model small enough to fit in VRAM or RAM, but they may trade away some quality or accuracy.

### VRAM vs system RAM

- `VRAM` is memory attached to the GPU.
- `System RAM` is normal system memory attached to the CPU.

Some AMD platforms, especially APUs and unified-memory designs, blur the boundary in practice, but the runtime still needs enough accessible memory to hold model weights, context, and working buffers.

### Local inference

The model runs on your own machine rather than a remote cloud service. This is useful for privacy, offline work, and experimentation.

### Server inference

The model is exposed through a local or remote server process so other apps can call it over HTTP or another interface.

### Model serving APIs

These are the endpoints applications talk to. Examples include:

- OpenAI-compatible APIs from `vLLM`
- local HTTP APIs from `llama.cpp`
- Ollama's REST API

## Beginner Paths

| Path | Who It Fits | Suggested First Steps |
| --- | --- | --- |
| Easiest local setup | New users who want a working local model first | Start with CPU inference. Validate the model, prompt, and workflow before touching drivers. |
| More advanced GPU setup | Users with supported Radeon or Ryzen AI hardware | Check ROCm or Vulkan support first, then move to `llama.cpp`, `Ollama`, or `PyTorch ROCm`. |
| Server or API setup | Developers integrating local models into apps | Use `Ollama`, `llama.cpp` server, or `vLLM`, depending on scale and latency goals. |
| Benchmark-oriented setup | Contributors who want reproducible comparisons | Freeze commands, prompt settings, model versions, and environment details before collecting results. |

## Suggested First Route

### 1. CPU-first validation

- Pick a small GGUF model.
- Run it on the CPU first.
- Confirm prompts, outputs, and tokenization are behaving as expected.

This avoids confusing model issues with GPU setup issues.

### 2. Move to GPU acceleration

Choose one of these paths:

- `Vulkan` if your target tool supports it and you want a relatively self-contained GPU path
- `ROCm/HIP` if you need frameworks or runtimes that explicitly depend on AMD's compute stack

### 3. Add API serving

If you want other applications to call your model:

- use `Ollama` for simple local APIs
- use `llama.cpp` server for lightweight GGUF serving
- use `vLLM` for more serious batching and higher-throughput serving

### 4. Benchmark only after the stack is stable

Benchmarking before the environment is stable often produces misleading results. Use the scripts and template in `benchmarks/` so your report is easier to reproduce.

## Common Planning Questions

| Question | Why It Matters |
| --- | --- |
| Is my hardware officially supported by the stack I want? | Support can differ sharply between CPU, Vulkan, ROCm, Linux, Windows, and WSL. |
| Do I need GGUF, Transformers, or a served API? | This often determines the best runtime faster than raw hardware specs do. |
| Am I optimizing for simplicity or throughput? | `Ollama` and `llama.cpp` are often simpler; `vLLM` is often better for serving workloads. |
| How much memory do I really have available? | Memory limits often matter more than raw compute for local LLM use. |

## Official Sources Referenced

- AMD Gemma 4 on AMD processors and GPUs:
  https://www.amd.com/en/developer/resources/technical-articles/2026/day-0-support-for-gemma-4-on-amd-processors-and-gpus.html
- AMD Lemonade technical article:
  https://www.amd.com/en/developer/resources/technical-articles/2026/lemonade-for-local-ai.html
- AMD ROCm on Radeon and Ryzen:
  https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/

## TODO

- Add a model-size planning table once enough verified community reports exist.
- Add separate starter paths for Linux, Windows, and WSL with source-backed validation.
