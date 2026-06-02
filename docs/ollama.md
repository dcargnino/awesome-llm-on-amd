# Ollama on AMD

`Ollama` is a good fit when you want a simple local model manager and API with minimal day-to-day operational overhead.

## When To Use Ollama

Use it when you want:

- easy local model pulls and runs
- a simple local REST API
- a lower-friction developer experience than a manual runtime stack

## Ease of Use

Compared with more manual runtimes, `Ollama` often reduces setup friction by standardizing:

- model download and storage
- local server behavior
- API access

## Local Model Management

Common tasks include:

```bash
ollama list
ollama run <model>
ollama show <model>
```

## API Usage

Start the server:

```bash
ollama serve
```

Example API call:

```bash
curl http://localhost:11434/api/generate -d "{\"model\":\"<model>\",\"prompt\":\"Hello\"}"
```

## AMD-Specific Checks

If you want AMD GPU acceleration on Linux:

- confirm you installed the AMD or ROCm-related package path documented by Ollama
- confirm your AMD driver/runtime path is current
- confirm the host GPU is visible through AMD tooling before debugging Ollama itself

The Ollama Linux docs explicitly mention an additional ROCm package for AMD GPU setups and recommend current Linux drivers for Radeon GPU support.

## Limitations

- Ease of use does not guarantee broad hardware compatibility.
- A model that runs through `Ollama` may still be limited by VRAM or shared memory.
- Feature depth for benchmarking and advanced serving is more limited than specialized serving stacks.

## Recommended Tests To Run

1. Verify `ollama -v`.
2. Start `ollama serve`.
3. Run a small model first.
4. Check whether the intended device path is actually active.
5. Record logs and system details before moving to larger models.

## Sources

- Ollama Linux documentation:
  https://docs.ollama.com/linux
- Ollama main documentation:
  https://docs.ollama.com/
- AMD Gemma 4 article, which references LM Studio and open local deployment workflows on AMD hardware:
  https://www.amd.com/en/developer/resources/technical-articles/2026/day-0-support-for-gemma-4-on-amd-processors-and-gpus.html

## TODO

- Add a source-backed AMD troubleshooting matrix once community submissions arrive.
- Add verified examples for Linux AMD GPU setups by hardware class.
