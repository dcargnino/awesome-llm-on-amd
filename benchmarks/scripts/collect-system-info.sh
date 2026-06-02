#!/usr/bin/env bash

# Collects useful system information for benchmark reports.
# This script is read-only: it does not install packages, edit files, or change system settings.

set -u

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

section() {
  printf '\n== %s ==\n' "$1"
}

section "Timestamp"
date 2>/dev/null || true

section "Operating System"
if [ -f /etc/os-release ]; then
  cat /etc/os-release
elif command_exists lsb_release; then
  lsb_release -a
else
  echo "OS information command not found."
fi

section "Kernel"
if command_exists uname; then
  uname -a
else
  echo "uname not found."
fi

section "CPU"
if command_exists lscpu; then
  lscpu
else
  echo "lscpu not found."
fi

section "Memory"
if command_exists free; then
  free -h
else
  echo "free not found."
fi

section "GPU"
if command_exists lspci; then
  lspci | grep -Ei 'vga|3d|display|amd|ati' || true
else
  echo "lspci not found."
fi

section "ROCm"
if command_exists rocminfo; then
  rocminfo || true
else
  echo "rocminfo not found."
fi

if command_exists rocm-smi; then
  section "ROCm SMI"
  rocm-smi || true
else
  echo "rocm-smi not found."
fi

section "Vulkan"
if command_exists vulkaninfo; then
  vulkaninfo --summary || vulkaninfo || true
else
  echo "vulkaninfo not found."
fi

section "Python"
if command_exists python3; then
  python3 --version
elif command_exists python; then
  python --version
else
  echo "Python not found."
fi

section "PyTorch ROCm Check"
if command_exists python3; then
  python3 - <<'PY'
try:
    import torch
    print("torch_version=", torch.__version__)
    print("torch_version_hip=", getattr(torch.version, "hip", None))
    print("torch_cuda_available=", torch.cuda.is_available())
except Exception as exc:
    print("PyTorch check failed:", exc)
PY
elif command_exists python; then
  python - <<'PY'
try:
    import torch
    print("torch_version=", torch.__version__)
    print("torch_version_hip=", getattr(torch.version, "hip", None))
    print("torch_cuda_available=", torch.cuda.is_available())
except Exception as exc:
    print("PyTorch check failed:", exc)
PY
else
  echo "Python not found."
fi
