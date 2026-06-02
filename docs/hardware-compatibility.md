# Hardware Compatibility Tracker

This page is a cautious tracker for tested or referenced AMD hardware. It is intentionally conservative.

## Status Labels

- `Officially documented`
- `Community reported`
- `Needs verification`
- `Experimental`
- `Not tested`

## How to Use This Page

- `Officially documented` means the source explicitly documents support or use.
- `Community reported` means a user report exists, but the maintainers have not independently verified it.
- `Needs verification` means the hardware is mentioned, but the exact stack or success path is still unclear.
- `Experimental` means support exists in preview form, nightly builds, or incomplete workflows.
- `Not tested` means the table is only reserving a slot.

## Ryzen CPUs

| Hardware | Type | Memory / VRAM | Tested Stack | Status | Source | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Ryzen desktop CPUs | CPU | Varies | CPU-only inference, `llama.cpp` | Needs verification | Repository scope | Broadly relevant, but this repository does not yet include verified benchmark reports. |
| Ryzen mobile CPUs | CPU | Varies | CPU-only inference, `llama.cpp` | Needs verification | Repository scope | Add reports with exact laptop SKU, cooling profile, and RAM size. |

## Ryzen AI / Ryzen AI Max / APUs

| Hardware | Type | Memory / VRAM | Tested Stack | Status | Source | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Ryzen AI Max+ 395 | APU / AI PC processor | Platform-dependent shared memory; NPU up to 50 TOPS per AMD product page | Product capability reference, ROCm-on-Ryzen planning | Officially documented | AMD product page; ROCm compatibility matrix | Product page documents AI engine capability. Stack-specific LLM validation still depends on OS and software path. |
| Ryzen AI and Ryzen AI Max processors | APU family | Unified memory platform | `llama.cpp`, LM Studio-style local deployment | Needs verification | AMD Gemma 4 article | AMD explicitly mentions deployment on supported Ryzen AI and Ryzen AI Max hardware, but exact supported SKUs and OS combinations are not listed in that article. |
| Select Ryzen APUs in ROCm documentation | APU family | Unified memory | PyTorch ROCm, `vLLM`, `llama.cpp` guides | Officially documented | ROCm on Radeon and Ryzen docs | Check the current compatibility matrix before treating a specific SKU as supported. |

## Radeon Consumer GPUs

| Hardware | Type | Memory / VRAM | Tested Stack | Status | Source | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Radeon consumer GPUs, unspecified | dGPU | Varies | Gemma 4 via `llama.cpp` and LM Studio-style workflow | Needs verification | AMD Gemma 4 article | The article names Radeon and Radeon PRO graphics cards generally, not a per-SKU support list. |
| Radeon 9000 and select 7000 series | dGPU | Varies | PyTorch ROCm, TensorFlow, JAX, `vLLM`, `llama.cpp` | Officially documented | ROCm on Radeon and Ryzen docs | Current support is version-sensitive. Validate against the latest matrix before documenting a specific board. |

## AMD Instinct GPUs

| Hardware | Type | Memory / VRAM | Tested Stack | Status | Source | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| AMD Instinct GPUs | Data center GPU | Varies | ROCm, PyTorch ROCm, `vLLM` | Needs verification | Repository scope | Add exact MI-series reports with OS, ROCm release, and model details. |

## Other AMD Platforms

| Hardware | Type | Memory / VRAM | Tested Stack | Status | Source | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| WSL ROCm paths for supported Radeon and Ryzen hardware | OS/runtime platform | Host-dependent | PyTorch ROCm | Experimental | ROCm on Radeon and Ryzen WSL docs | Treat as fast-moving. Confirm driver and runtime pairing carefully. |
| NPU-focused local AI stacks | Endpoint AI platform | Platform-dependent | Lemonade, Ryzen AI software | Experimental | AMD Lemonade article | Relevant to local AI workflows, but not yet enough to make broad LLM compatibility claims here. |

## Contribution Notes

Please include the following when you add or update a row:

- exact hardware SKU
- OS and version
- kernel if relevant
- driver/runtime version
- stack and backend
- model and quantization
- exact result status
- source link

## Official Sources Referenced

- AMD Gemma 4 on AMD processors and GPUs:
  https://www.amd.com/en/developer/resources/technical-articles/2026/day-0-support-for-gemma-4-on-amd-processors-and-gpus.html
- AMD Ryzen AI Max+ 395 product page:
  https://www.amd.com/en/products/processors/laptop/ryzen/ai-300-series/amd-ryzen-ai-max-plus-395.html
- ROCm on Radeon and Ryzen:
  https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/

## TODO

- Add exact Radeon SKUs from verified benchmark reports.
- Add confirmed Instinct entries from official ROCm or vLLM deployment guides.
- Add Windows and Linux distinctions per row once enough reports are collected.
