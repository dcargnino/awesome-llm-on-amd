# PyTorch ROCm

PyTorch ROCm is the most flexible path in this repository for people who want to write custom Python code, test models programmatically, or move beyond turnkey local apps.

## What PyTorch ROCm Is Useful For

- custom inference code
- evaluation pipelines
- fine-tuning experiments
- framework-level debugging
- integration with the wider Python ML ecosystem

## Installation Verification Checklist

After installation, verify all of the following:

```bash
python -c "import torch; print(torch.__version__)"
python -c "import torch; print(torch.version.hip)"
python -c "import torch; print(torch.cuda.is_available())"
```

Why this matters:

- `torch.__version__` confirms the package you installed
- `torch.version.hip` helps confirm ROCm-related build information
- `torch.cuda.is_available()` is still the common runtime check, even on ROCm builds

## Inference vs Training Notes

Inference use cases:

- model testing
- embeddings
- custom evaluation
- integration into Python services

Training or fine-tuning use cases:

- full training loops
- adapters or LoRA workflows
- data pipeline experiments

The exact support picture depends on the model family, memory budget, operators used, and current ROCm release.

## Common Issues

- ROCm installed, but PyTorch cannot see the GPU
- wrong wheel or wrong compute platform selected
- unsupported OS or hardware
- container and host mismatch
- memory pressure that looks like a runtime bug

## Practical Advice

- Use the official PyTorch selector or official ROCm wheel instructions.
- Match the PyTorch build to the supported ROCm platform for your system.
- Confirm device visibility with ROCm tooling before blaming PyTorch.
- Record exact install commands in any benchmark or troubleshooting report.

## Official Sources

- PyTorch local install selector:
  https://pytorch.org/get-started/locally/
- PyTorch previous versions page:
  https://pytorch.org/get-started/previous-versions/
- ROCm installation docs:
  https://rocm.docs.amd.com/projects/install-on-linux/en/latest/
- ROCm on Radeon and Ryzen docs:
  https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/

## TODO

- Add source-backed verification examples for Radeon, Ryzen APU, and Instinct classes separately.
- Add a short section comparing framework-first workflows versus `llama.cpp` and `Ollama`.
