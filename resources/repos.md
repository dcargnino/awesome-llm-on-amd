# Relevant Repositories

| Repository Name | Owner | Topic | Stack | Relevance | Link | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| `llama.cpp` | ggml-org | Local LLM inference in C/C++ | GGUF, CPU, Vulkan, HIP/ROCm | Important for lightweight local inference and AMD backend experimentation | https://github.com/ggml-org/llama.cpp | Primary upstream repo for many local GGUF workflows. |
| `vLLM` | vllm-project | High-throughput LLM serving | Python, server inference, OpenAI-compatible APIs | Important for AMD serving workflows that care about batching and API serving | https://github.com/vllm-project/vllm | Check docs for current AMD/ROCm support details. |
| `Ollama` | ollama | Local model management and API | Local inference and API serving | Good for low-friction local testing and developer workflows | https://github.com/ollama/ollama | Hardware behavior depends on package path and host support. |
| `PyTorch` | pytorch | ML framework | PyTorch ROCm | Central for custom inference and training workflows on AMD | https://github.com/pytorch/pytorch | Prefer official install docs for binaries and version selection. |
| `ROCm` | ROCm | AMD compute software stack | ROCm | Core software foundation for many AMD GPU ML workflows | https://github.com/ROCm/ROCm | Repository alone is not a support matrix; use the docs too. |
