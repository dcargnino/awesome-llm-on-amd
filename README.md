# awesome-llm-on-amd

![Status: Draft](https://img.shields.io/badge/status-draft-lightgrey)
![Contributions: Welcome](https://img.shields.io/badge/contributions-welcome-blue)
![Benchmarks: Community Submitted](https://img.shields.io/badge/benchmarks-community--submitted-lightgrey)
![Project Progress: 30%](https://img.shields.io/badge/project%20progress-30%25-orange)

Community-curated guides, benchmarks, videos, and real-world experiences for running LLMs on AMD hardware with ROCm, Vulkan, llama.cpp, vLLM, Ollama, and PyTorch.

## Project Progress

`[###.......] 30%`

This percentage is a rough maintainer estimate for the repository's current maturity and will change as more verified guides, benchmarks, and community reports are added.

## Goals

- Collect practical, source-backed information about running LLMs on AMD CPUs, APUs, and GPUs.
- Separate official documentation from community reports and experimental findings.
- Make local inference, model serving, benchmarking, and troubleshooting easier to reproduce.
- Provide contribution templates so new reports are easier to compare.

## Who This Repository Is For

- Developers running local LLMs on AMD desktops, laptops, workstations, or servers
- Researchers comparing inference stacks on AMD hardware
- Tinkerers trying ROCm, Vulkan, GGUF, or OpenAI-compatible local APIs
- Contributors who want to share benchmarks, setup notes, or failure cases

## Quick Start

1. Start with [Getting Started](docs/getting-started.md).
2. Check the current [Hardware Compatibility Tracker](docs/hardware-compatibility.md).
3. Pick a stack using the table below.
4. Validate your environment with the checklists in:
   - [ROCm Installation](docs/rocm-installation.md)
   - [llama.cpp](docs/llama-cpp.md)
   - [vLLM](docs/vllm.md)
   - [Ollama](docs/ollama.md)
   - [PyTorch ROCm](docs/pytorch-rocm.md)
5. Submit results using the templates in [templates/](templates/).

## Covered AMD Hardware

- Ryzen desktop and mobile CPUs
- Ryzen AI, Ryzen AI Max, and other AMD APUs
- Radeon consumer GPUs
- Radeon PRO GPUs
- AMD Instinct accelerators
- Other AMD platforms with relevant LLM workflows

## Covered Software Stacks

- `llama.cpp`
- `vLLM`
- `Ollama`
- `PyTorch ROCm`
- ROCm runtime and tooling
- Vulkan-based inference paths
- CPU-only inference paths

## Which Stack Should I Use?

| Stack | Best Use Case | Difficulty | Typical Hardware | Notes and Limitations |
| --- | --- | --- | --- | --- |
| `llama.cpp` | Local inference, GGUF models, lightweight APIs, offline experimentation | Low to Medium | Ryzen CPUs, Ryzen APUs, Radeon GPUs | Usually the easiest path for GGUF models. Backend choice matters: CPU is broadest, Vulkan can be a fallback, HIP/ROCm needs more validation per device. |
| `vLLM` | Server inference, batching, throughput-focused APIs, multi-user serving | Medium to High | Radeon GPUs, Instinct GPUs, some ROCm-supported Ryzen platforms | Best when you care about serving efficiency more than one-click simplicity. Hardware and ROCm support move quickly, so always confirm current upstream support. |
| `Ollama` | Fast local setup, model pulls, simple REST API | Low | CPU-only systems, supported Linux AMD GPU systems | Great for quick testing. AMD GPU usage depends on the package and driver/runtime path you install. |
| `PyTorch ROCm` | Framework-based inference, experiments, fine-tuning, custom code | Medium | Radeon GPUs, Instinct GPUs, ROCm-supported Ryzen platforms | Flexible but less turnkey than Ollama or llama.cpp. Matching PyTorch, ROCm, OS, and hardware support is essential. |
| `Vulkan backend` | GPU inference when ROCm is unavailable, undesired, or immature on a given machine | Medium | Radeon GPUs, some APUs, cross-vendor Linux/Windows systems | Often practical for llama.cpp-style local inference. Feature depth and performance characteristics differ from ROCm. |
| `CPU-only inference` | Maximum compatibility, small models, first validation pass | Low | Any modern Ryzen CPU | Slow for larger models, but useful for confirming model format, prompts, and basic functionality before GPU tuning. |

## Documentation Map

| Topic | Link |
| --- | --- |
| New user overview | [docs/getting-started.md](docs/getting-started.md) |
| Hardware tracking | [docs/hardware-compatibility.md](docs/hardware-compatibility.md) |
| ROCm setup notes | [docs/rocm-installation.md](docs/rocm-installation.md) |
| Vulkan backend guide | [docs/vulkan-backend.md](docs/vulkan-backend.md) |
| llama.cpp guide | [docs/llama-cpp.md](docs/llama-cpp.md) |
| vLLM guide | [docs/vllm.md](docs/vllm.md) |
| Ollama guide | [docs/ollama.md](docs/ollama.md) |
| PyTorch ROCm guide | [docs/pytorch-rocm.md](docs/pytorch-rocm.md) |
| Troubleshooting | [docs/troubleshooting.md](docs/troubleshooting.md) |
| Glossary | [docs/glossary.md](docs/glossary.md) |
| Benchmarking | [benchmarks/README.md](benchmarks/README.md) |
| Community reports | [community/](community/) |
| Resource index | [resources/](resources/) |

## Source Status

This repository intentionally distinguishes between:

- `Officially documented`: vendor or upstream project documentation
- `Community reported`: user reports, issue threads, independent guides
- `Experimental`: early workflows, preview support, or incomplete validation
- `TODO`: areas where more testing or source coverage is needed

## How To Contribute

Read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request. The most useful contributions include:

- reproducible setup guides
- benchmark reports with exact commands
- hardware compatibility confirmations
- troubleshooting fixes
- links to videos, repos, and official docs
- corrections when a page drifts out of date

## Disclaimer

Compatibility, stability, and performance vary by hardware generation, operating system, driver, runtime, model size, quantization, and backend. A setup that works on one Radeon GPU, Ryzen APU, or ROCm release may fail on another. This repository does not treat anecdotal success as universal compatibility.

## Initial Official Sources

- AMD technical article on Gemma 4 support across AMD processors and GPUs:
  https://www.amd.com/en/developer/resources/technical-articles/2026/day-0-support-for-gemma-4-on-amd-processors-and-gpus.html
- AMD technical article on Lemonade, a unified local AI API:
  https://www.amd.com/en/developer/resources/technical-articles/2026/lemonade-for-local-ai.html
- AMD product page for Ryzen AI Max+ 395:
  https://www.amd.com/en/products/processors/laptop/ryzen/ai-300-series/amd-ryzen-ai-max-plus-395.html

More detailed classifications and summaries live in [resources/official-docs.md](resources/official-docs.md) and [resources/blogs.md](resources/blogs.md).
