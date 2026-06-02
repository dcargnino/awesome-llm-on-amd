# Troubleshooting

Use this page as a checklist-first guide. It is intentionally conservative and avoids assuming a single root cause.

## ROCm Does Not Detect the GPU

**Symptoms**

- `rocminfo` shows no usable device
- `rocm-smi` fails or reports no GPU
- PyTorch ROCm cannot see a device

**Possible causes**

- unsupported GPU or OS
- incomplete driver/runtime install
- wrong install path for Radeon vs Ryzen vs Instinct

**What to check**

- current support matrix
- OS and kernel
- exact hardware SKU
- whether the intended install guide matched your platform family

**Possible fixes**

- reinstall using the correct current guide
- update to a supported OS/kernel combination
- validate user permissions and groups

**Relevant links**

- https://rocm.docs.amd.com/projects/install-on-linux/en/latest/
- https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/

## Driver / Runtime Mismatch

**Symptoms**

- install succeeds but user-space tools fail
- a framework imports but crashes on first GPU call

**Possible causes**

- mixed package versions
- stale install instructions
- mismatched host and container expectations

**What to check**

- exact ROCm release
- exact driver package source
- container tag versus host stack

**Possible fixes**

- align the full stack to a documented release path
- avoid mixing unrelated install guides

**Relevant links**

- https://rocm.docs.amd.com/projects/install-on-linux/en/latest/reference/system-requirements.html

## Out of Memory

**Symptoms**

- model load fails
- runtime exits during prompt processing
- severe swapping or system instability

**Possible causes**

- model too large
- context too large
- insufficient VRAM or shared memory
- fragmentation or competing processes

**What to check**

- model size
- quantization
- context size
- background GPU and RAM usage

**Possible fixes**

- use a smaller model
- use a lower-memory quantization
- reduce context or batch size

## Low Performance

**Symptoms**

- much lower tokens per second than expected
- poor utilization
- long warmup

**Possible causes**

- CPU fallback
- non-optimized backend
- insufficient batch or context tuning
- thermal or power limits

**What to check**

- whether the intended backend is actually active
- CPU, GPU, and memory usage during inference
- clocks, thermals, and power state if tooling is available

**Possible fixes**

- compare CPU-only and GPU-backed runs
- reduce competing system load
- retest with a smaller model to isolate the bottleneck

## CPU Fallback

**Symptoms**

- the workload runs, but GPU usage stays low or absent
- latency looks similar to a CPU-only path

**Possible causes**

- backend not enabled
- unsupported operator path
- runtime silently chose a safer device

**What to check**

- startup logs
- build flags or package variant
- framework device visibility

**Possible fixes**

- reinstall or rebuild with the intended backend
- validate the backend with a smaller known-good test

## Docker Device Permission Issues

**Symptoms**

- the host sees the GPU, but the container does not
- containerized runtime reports missing device access

**Possible causes**

- missing device mappings
- wrong container image
- host permissions or groups not exposed into the container

**What to check**

- launch command
- documented container requirements
- host-side ROCm visibility before container launch

**Possible fixes**

- use the upstream documented container path
- verify the host first, then the container

## Model Loading Failures

**Symptoms**

- model file rejected
- tokenizer or template mismatch
- crash during initialization

**Possible causes**

- unsupported file format
- incomplete download
- runtime/model mismatch

**What to check**

- file format
- model integrity
- runtime support for that model family

**Possible fixes**

- retry with a known-good model
- confirm the runtime supports that format

## Quantization Confusion

**Symptoms**

- model fits in one runtime but not another
- outputs degrade unexpectedly

**Possible causes**

- misunderstanding the quantization format
- assuming all quants behave the same

**What to check**

- exact quantization name
- intended runtime support
- memory expectations

**Possible fixes**

- document the exact quantization
- compare against a less aggressive quantization

## Unsupported Hardware

**Symptoms**

- repeated install failure
- partial functionality only
- unsupported-device warnings

**Possible causes**

- hardware outside current official scope
- older community guide no longer matches current support

**What to check**

- current official matrices
- whether the claim came from official docs or community reports

**Possible fixes**

- switch to CPU-only or Vulkan if appropriate
- wait for upstream support instead of forcing the setup

## Thermal or Power Throttling

**Symptoms**

- performance starts strong then declines
- clocks drop under sustained load

**Possible causes**

- laptop cooling limits
- power profile constraints
- chassis or airflow limits

**What to check**

- sustained clocks
- temperatures
- system power mode

**Possible fixes**

- improve cooling
- retest on AC power with a stable power profile
- compare short and long benchmark runs

## Sources

- ROCm installation docs:
  https://rocm.docs.amd.com/projects/install-on-linux/en/latest/
- ROCm on Radeon and Ryzen docs:
  https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/
- Ollama Linux docs:
  https://docs.ollama.com/linux
- vLLM docs:
  https://docs.vllm.ai/en/latest/getting_started/installation/

## TODO

- Add source-linked issue entries for specific GPUs and OS combinations.
- Add a "collect logs before filing an issue" checklist.
