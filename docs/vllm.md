# vLLM on AMD

`vLLM` is a serving-oriented runtime. It is a strong choice when you want an API server, batching, and better throughput characteristics than a simple single-user local runner.

## When To Use vLLM

Use `vLLM` when you want:

- server inference
- multi-request batching
- OpenAI-compatible APIs
- a runtime designed around throughput and serving efficiency

It is usually not the easiest first-time local setup.

## Server Inference

`vLLM` is built around serving models over HTTP rather than just running a one-off prompt locally.

Generic example:

```bash
vllm serve /path/to/model --api-key local-token
```

## Batching

Batching lets the server combine work from multiple requests. This is one of the reasons `vLLM` is often chosen for application serving rather than casual local experimentation.

## Throughput

Throughput matters more than a single prompt demo when:

- multiple users share a server
- your application sends many requests
- you care about utilization and queue behavior

This repository does not publish throughput claims without reproducible benchmark metadata.

## OpenAI-Compatible APIs

Upstream `vLLM` documents an OpenAI-compatible server interface. That makes it easier to test local serving with existing OpenAI-style clients.

## AMD / ROCm Notes

- `vLLM` documents AMD ROCm as a supported hardware platform.
- Actual support depends on the version, GPU class, PyTorch/ROCm pairing, and install method.
- Always validate the current installation guide and hardware compatibility notes before assuming a given Radeon, Ryzen APU, or Instinct setup will work.

## Docker Notes

- Docker can simplify reproducibility, but it does not bypass host support requirements.
- Record the exact image tag, ROCm release, and container launch flags in benchmark reports.
- Confirm host GPU access before assuming the container is the problem.

## Benchmark Considerations

When benchmarking `vLLM`, record:

- model name and revision
- dtype or quantization path if relevant
- batch behavior
- concurrency level
- prompt length and output length
- context settings
- exact launch command

## Limitations and Known Uncertainty

- AMD support details can shift across releases.
- Some tutorials on the web reflect older ROCm paths.
- Container success does not guarantee stable long-running service behavior.
- Consumer GPU, APU, and data center GPU results should not be mixed casually.

## Sources

- vLLM installation docs:
  https://docs.vllm.ai/en/latest/getting_started/installation/
- vLLM OpenAI-compatible server docs:
  https://docs.vllm.ai/en/stable/serving/openai_compatible_server.html
- ROCm on Radeon and Ryzen docs:
  https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/

## TODO

- Add source-backed AMD hardware examples by class: Radeon, Ryzen APU, Instinct.
- Add a compatibility note comparing Docker, source builds, and wheel-based installs where available.
