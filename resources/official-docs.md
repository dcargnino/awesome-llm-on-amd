# Official Documentation and Official AMD Sources

This page catalogs the initial official sources used to seed the repository.

## Source Inventory

| Title | Source Organization | Classification | Topic | Summary | Target Audience | Repository Relevance | Hardware Mentioned | Software Stack Mentioned | Limitations or Uncertainty | Suggested Target File | Link |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Day 0 Support for Gemma 4 on AMD Processors and GPUs | AMD | Blog/article | Gemma 4 deployment on AMD hardware | AMD outlines how Gemma 4 can be approached across AMD processors and GPUs, including a local path through `llama.cpp` and LM Studio-style tooling. | Developers evaluating local or deployed Gemma workflows on AMD hardware | Useful for repository framing, AMD hardware coverage notes, and local-inference positioning | Ryzen AI, Ryzen AI Max, Radeon, Radeon PRO, AMD processors and GPUs broadly | `llama.cpp`, LM Studio, AMD drivers, server deployment themes | High-level article, not a compatibility matrix. It does not provide a per-SKU validation table. | `README.md`, `docs/hardware-compatibility.md`, `docs/llama-cpp.md`, `resources/blogs.md` | https://www.amd.com/en/developer/resources/technical-articles/2026/day-0-support-for-gemma-4-on-amd-processors-and-gpus.html |
| Lemonade by AMD: A Unified API for Local AI Developers | AMD | Blog/article | Unified local AI API | AMD presents Lemonade as a unified layer for local AI development that can route work across multiple engines and accelerators. | Developers interested in local AI app architecture and AMD endpoint AI direction | Useful for future local API coverage, AMD ecosystem tracking, and "what is AMD building around local AI" context | Ryzen and Radeon products broadly | Lemonade, `llama.cpp`, `ryzenai`, `whisper.cpp`, other local engines | Not a setup guide for ROCm, vLLM, or benchmarking. Support claims are architectural and directional. | `docs/getting-started.md`, `resources/blogs.md`, `resources/official-docs.md` | https://www.amd.com/en/developer/resources/technical-articles/2026/lemonade-for-local-ai.html |
| AMD Ryzen AI Max+ 395 | AMD | Official documentation | Product specifications | AMD lists platform capabilities for the Ryzen AI Max+ 395, including AI engine information that is relevant when scoping endpoint AI hardware. | Buyers, developers, and maintainers documenting hardware categories | Useful for cautious hardware inventory entries and README hardware coverage context | Ryzen AI Max+ 395 | Product capability reference, Ryzen AI platform context | Product specs do not automatically prove runtime-level LLM compatibility across OS and backend combinations. | `docs/hardware-compatibility.md`, `README.md` | https://www.amd.com/en/products/processors/laptop/ryzen/ai-300-series/amd-ryzen-ai-max-plus-395.html |

## Notes

- The two AMD technical articles are official AMD-authored sources, but their classification here remains `Blog/article` because they are narrative technical articles rather than versioned support manuals.
- The Ryzen AI Max+ 395 page is treated as `Official documentation` because it is a product specification page.

## Additional Official Upstream References

These were used to make the repository more actionable without inventing setup details:

- ROCm installation docs:
  https://rocm.docs.amd.com/projects/install-on-linux/en/latest/
- ROCm on Radeon and Ryzen:
  https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/
- PyTorch local install docs:
  https://pytorch.org/get-started/locally/
- vLLM docs:
  https://docs.vllm.ai/en/latest/
- Ollama docs:
  https://docs.ollama.com/
