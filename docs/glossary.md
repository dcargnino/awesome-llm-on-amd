# Glossary

## LLM

Large Language Model. A model trained to process and generate language, often used for chat, coding, summarization, and retrieval-related tasks.

## Inference

Running a model to produce outputs from inputs. In this repository, inference usually means generating text locally or through a self-hosted server.

## Fine-tuning

Training a pre-existing model further on new data so it adapts to a new style, task, or domain.

## Quantization

Reducing model precision to lower memory use and often improve inference efficiency. The tradeoff can be reduced output quality or different behavior.

## GGUF

A model file format commonly used by `llama.cpp` and related local inference tools.

## ROCm

AMD's software stack for GPU-accelerated computing and machine learning.

## HIP

AMD's GPU programming portability layer, often referenced when a project has an AMD GPU backend.

## Vulkan

A graphics and compute API that some local inference tools use as a GPU backend.

## VRAM

Memory attached to the GPU.

## Context Length

The amount of prior text the model can consider at once. Larger contexts need more memory.

## Tokens Per Second

A rough throughput measure for text generation speed.

## Time To First Token

The delay between sending a request and receiving the first generated token. This matters for interactive use.

## Batching

Processing multiple requests or prompt segments together for better throughput.

## Serving

Running a model behind an API so applications or users can send requests to it.

## Tensor Parallelism

A way of splitting model computation across devices so larger workloads can run in parallel across multiple GPUs.
