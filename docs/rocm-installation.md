# ROCm Installation Notes

This page is a practical structure for planning and validating a ROCm setup for LLM workloads on AMD hardware.

## Important Scope Note

ROCm support is highly version-sensitive. Do not blindly follow stale blog posts or pinned commands without checking the current support matrix first.

## Pre-Install Checklist

- Confirm the exact hardware SKU.
- Confirm the target OS and kernel.
- Confirm whether your workflow is for Radeon, Ryzen APU, or Instinct.
- Decide whether you need framework support, command-line inference, Docker, or all three.
- Check whether the stack you want actually requires ROCm. Some local inference paths can use CPU or Vulkan instead.

## Supported OS Considerations

- ROCm support is primarily Linux-first.
- Some Radeon and Ryzen workflows now exist for Windows and WSL in the Radeon/Ryzen docs, but support scope differs from Linux.
- Supported operating systems and kernel requirements change over time, so treat the current ROCm support matrix as the source of truth.

## GPU and Platform Support Considerations

- Not every Radeon GPU is supported in every ROCm release.
- ROCm documentation now separates general Linux installation from Radeon and Ryzen-specific guidance.
- Ryzen APU support has additional prerequisites and may require an inbox-driver-oriented path rather than a discrete GPU-style install.

## Driver and Runtime Compatibility Notes

- Match the ROCm release, driver path, OS version, and hardware family.
- For Radeon and Ryzen systems, prefer the dedicated Radeon/Ryzen documentation instead of generic Instinct-oriented ROCm instructions.
- If using PyTorch, also confirm the matching ROCm build in the PyTorch selector or wheel index.

## Verification Commands

Use these after installation, depending on what is installed:

```bash
rocminfo
rocm-smi
```

```bash
python -c "import torch; print(torch.__version__); print(torch.version.hip); print(torch.cuda.is_available())"
```

What these checks tell you:

- `rocminfo` checks whether ROCm user-space sees AMD compute devices.
- `rocm-smi` helps confirm GPU visibility and health information.
- the Python check helps confirm whether a ROCm-enabled PyTorch build is actually usable from user space.

## Docker Notes

- Containers do not remove the need for host compatibility.
- Verify host driver support first.
- Prefer official vendor or upstream images when available.
- Record the exact image tag in benchmark reports.

## Common Failure Points

- unsupported OS or kernel
- unsupported GPU generation
- driver/runtime mismatch
- missing user permissions for device access
- stale instructions from old ROCm releases
- assuming Radeon, Ryzen APU, and Instinct installs are interchangeable

## Suggested Validation Flow

1. Confirm the hardware and OS are in a current matrix.
2. Install the recommended ROCm path for your platform family.
3. Run `rocminfo` and `rocm-smi`.
4. Verify a minimal PyTorch or runtime-specific inference test.
5. Only then move on to model-serving tools such as `vLLM` or application runtimes such as `Ollama`.

## Official Links

- ROCm installation for Linux:
  https://rocm.docs.amd.com/projects/install-on-linux/en/latest/
- ROCm system requirements:
  https://rocm.docs.amd.com/projects/install-on-linux/en/latest/reference/system-requirements.html
- Use ROCm on Radeon and Ryzen:
  https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/

## TODO

- Add an OS-by-OS matrix once there are enough verified reports in this repository.
- Add a short Instinct-specific subsection with source-backed container notes.
