I want to create an open source repository that collects research information, practical guides, community experiences, videos, benchmarks, troubleshooting notes, and useful resources about **LLMs running on AMD processors and GPUs**.

The goal of the repository is to help the community understand how to run, optimize, troubleshoot, and compare Large Language Models on AMD hardware, including AMD Ryzen, Ryzen AI, Ryzen AI Max, Radeon, Instinct, ROCm, Vulkan, llama.cpp, vLLM, Ollama, and PyTorch ROCm.

Repository name:
`awesome-llm-on-amd`

Repository description:
`Community-curated guides, benchmarks, videos, and real-world experiences for running LLMs on AMD hardware with ROCm, Vulkan, llama.cpp, vLLM, Ollama, and PyTorch.`

Use the following links as initial sources. Analyze them, classify them, and synthesize original content from them. Do not copy text verbatim. When using external information, cite the source clearly.

SOURCES TO USE:

[* \[ADD LINK 1\]](https://www.amd.com/en/developer/resources/technical-articles/2026/day-0-support-for-gemma-4-on-amd-processors-and-gpus.html)
[* \[ADD LINK 2\]](https://www.amd.com/en/developer/resources/technical-articles/2026/lemonade-for-local-ai.html)
[* \[ADD LINK 3\]](https://www.amd.com/en/products/processors/laptop/ryzen/ai-300-series/amd-ryzen-ai-max-plus-395.html)

Create the initial repository structure:

```text
awesome-llm-on-amd/
├── README.md
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── LICENSE
├── AGENTS.md
├── docs/
│   ├── getting-started.md
│   ├── hardware-compatibility.md
│   ├── rocm-installation.md
│   ├── vulkan-backend.md
│   ├── llama-cpp.md
│   ├── vllm.md
│   ├── ollama.md
│   ├── pytorch-rocm.md
│   ├── troubleshooting.md
│   └── glossary.md
├── benchmarks/
│   ├── README.md
│   ├── template.md
│   ├── results/
│   │   └── example-result.md
│   └── scripts/
│       ├── collect-system-info.sh
│       ├── llama-cpp-benchmark.sh
│       └── vllm-benchmark.sh
├── community/
│   ├── experiences.md
│   ├── success-stories.md
│   ├── known-issues.md
│   └── videos.md
├── resources/
│   ├── official-docs.md
│   ├── blogs.md
│   ├── papers.md
│   ├── videos.md
│   └── repos.md
└── templates/
    ├── experience-report.md
    ├── benchmark-report.md
    └── guide-submission.md
```

General requirements:

* Write all repository content in English.
* Use a clear, technical, but accessible tone.
* Avoid hype and exaggerated claims.
* Do not invent benchmarks, compatibility claims, or performance numbers.
* Clearly separate:

  * officially documented information;
  * community-reported information;
  * unverified or experimental information;
  * TODO items.
* Prefer Markdown tables where they improve readability.
* Use clean Markdown formatting.
* Keep the repository easy to contribute to.
* Add TODO markers where more validation is needed.
* When a source cannot be analyzed, mention that clearly in the final summary.
* Do not copy copyrighted text from sources.
* Summarize external sources in original wording and cite them.

For each provided source, classify it as one of:

* Official documentation
* Community guide
* Benchmark
* Video/tutorial
* Forum discussion
* GitHub issue/discussion
* Blog/article
* Research paper
* Repository
* Other

For each source, extract:

* Main topic
* Hardware mentioned
* Software stack mentioned
* Practical value for the repository
* Limitations or uncertainty
* Suggested target file in the repository

Specific file requirements:

1. `README.md`

Create a strong landing page with:

* Project title and description
* Project goals
* Who this repository is for
* Quick start section
* Covered AMD hardware
* Covered software stacks
* “Which stack should I use?” decision table
* Links to documentation sections
* How to contribute
* Disclaimer about compatibility and performance
* Placeholder badges, without inventing real metrics

The “Which stack should I use?” table should include:

* llama.cpp
* vLLM
* Ollama
* PyTorch ROCm
* Vulkan backend
* CPU-only inference

For each stack, describe:

* Best use case
* Difficulty level
* Typical hardware
* Notes and limitations

2. `docs/getting-started.md`

Write an introductory guide for users who are new to running LLMs on AMD hardware.

Explain:

* CPU inference
* GPU inference
* ROCm
* Vulkan
* HIP
* GGUF models
* quantization
* VRAM vs system RAM
* local inference
* server inference
* model serving APIs

Include a simple beginner path:

* easiest local setup;
* more advanced GPU setup;
* server/API setup;
* benchmark-oriented setup.

3. `docs/hardware-compatibility.md`

Create a structure for tracking tested hardware.

Separate hardware into:

* Ryzen CPUs
* Ryzen AI / Ryzen AI Max / APUs
* Radeon consumer GPUs
* AMD Instinct GPUs
* Other AMD platforms

Use columns such as:

* Hardware
* Type
* Memory / VRAM
* Tested stack
* Status
* Source
* Notes

Use cautious labels:

* Officially documented
* Community reported
* Needs verification
* Experimental
* Not tested

Do not claim absolute compatibility unless the source explicitly supports it.

4. `docs/rocm-installation.md`

Create a practical ROCm installation guide structure.

Include:

* pre-install checklist;
* supported OS considerations;
* GPU support considerations;
* driver/runtime compatibility notes;
* verification commands;
* Docker notes;
* common failure points;
* links to official documentation.

Do not hardcode version-specific instructions unless they are directly supported by the provided sources.

5. `docs/vulkan-backend.md`

Explain the role of Vulkan as an alternative backend for running LLMs on AMD hardware.

Include:

* when Vulkan may be useful;
* differences from ROCm;
* typical use cases;
* limitations;
* tools that may use Vulkan;
* troubleshooting checklist.

6. `docs/llama-cpp.md`

Explain when to use llama.cpp.

Create sections for:

* CPU backend
* Vulkan backend
* ROCm/HIP backend
* GGUF models
* quantization
* common command examples
* benchmarking notes
* troubleshooting notes

Add generic command examples only. Do not include unsupported performance claims.

7. `docs/vllm.md`

Explain when to use vLLM.

Include:

* server inference;
* batching;
* throughput;
* OpenAI-compatible APIs;
* AMD/ROCm notes;
* Docker notes;
* benchmark considerations;
* limitations and known uncertainty.

Do not invent benchmark results.

8. `docs/ollama.md`

Explain when to use Ollama.

Include:

* ease of use;
* local model management;
* API usage;
* AMD-specific checks;
* limitations;
* recommended tests to run.

9. `docs/pytorch-rocm.md`

Explain the role of PyTorch with ROCm.

Include:

* what PyTorch ROCm is useful for;
* installation verification checklist;
* inference vs training notes;
* common issues;
* links to official sources.

10. `docs/troubleshooting.md`

Create a troubleshooting guide with sections for:

* ROCm does not detect the GPU
* Driver/runtime mismatch
* Out of memory
* Low performance
* CPU fallback
* Docker device permission issues
* Model loading failures
* Quantization confusion
* Unsupported hardware
* Thermal or power throttling

For each issue include:

* Symptoms
* Possible causes
* What to check
* Possible fixes
* Relevant source links, if available

11. `docs/glossary.md`

Create a beginner-friendly glossary for terms such as:

* LLM
* inference
* fine-tuning
* quantization
* GGUF
* ROCm
* HIP
* Vulkan
* VRAM
* context length
* tokens per second
* time to first token
* batching
* serving
* tensor parallelism

12. `benchmarks/README.md`

Explain the benchmark philosophy of the repository.

Include:

* reproducibility rules;
* required metadata;
* why benchmark comparisons can be misleading;
* how to submit a benchmark;
* what metrics to report.

13. `benchmarks/template.md`

Create a complete benchmark report template with:

* hardware;
* software;
* model;
* quantization;
* runtime;
* backend;
* exact command;
* prompt configuration;
* context size;
* results;
* memory usage;
* power/thermal notes;
* limitations;
* raw output section.

14. `benchmarks/results/example-result.md`

Create a clearly marked fictional example result.

It must be labeled as an example only and must not be presented as a real benchmark.

15. `benchmarks/scripts/collect-system-info.sh`

Create a safe Bash script that collects system information useful for benchmark reports.

Requirements:

* no destructive commands;
* no automatic package installation;
* check whether commands exist before using them;
* collect OS, kernel, CPU, GPU, memory, ROCm-related info if available, Vulkan-related info if available;
* print output to the terminal;
* include comments explaining what the script does.

16. `benchmarks/scripts/llama-cpp-benchmark.sh`

Create a safe Bash script template for running llama.cpp benchmarks.

Requirements:

* no automatic installation;
* check that the llama.cpp binary exists;
* require the user to pass a model path;
* support optional prompt/context parameters;
* print the exact command before running;
* include comments and usage instructions.

17. `benchmarks/scripts/vllm-benchmark.sh`

Create a safe Bash script template for vLLM benchmark setup.

Requirements:

* no automatic installation;
* check that Python is available;
* check that vLLM is importable if possible;
* require the user to pass a model name or path;
* print configuration before running;
* avoid destructive commands;
* include comments and usage instructions.

18. `community/videos.md`

Create a table for cataloging useful videos.

Columns:

* Title
* Creator / Channel
* Topic
* Hardware
* Software stack
* Level
* Link
* Notes

Add provided video links if available.

19. `community/experiences.md`

Create a structure for community experience reports.

Include:

* what hardware was used;
* what stack was used;
* what worked;
* what failed;
* workaround;
* performance observations;
* source link;
* verification status.

Add one fictional example clearly labeled as an example only.

20. `community/success-stories.md`

Create a page for successful setups.

Include a table structure and contribution guidance.

21. `community/known-issues.md`

Create a page for known issues.

Include:

* issue title;
* affected hardware;
* affected stack;
* symptoms;
* workaround;
* status;
* source.

22. `resources/official-docs.md`

Organize official links from the provided sources.

For each link include:

* title;
* source organization;
* topic;
* summary;
* target audience;
* repository relevance.

23. `resources/blogs.md`

Organize blog posts and articles.

For each link include:

* title;
* author or organization;
* topic;
* summary;
* hardware/software mentioned;
* notes.

24. `resources/papers.md`

Create a placeholder structure for research papers.

Include fields for:

* title;
* authors;
* year;
* topic;
* relevance to AMD/LLM;
* link;
* notes.

25. `resources/videos.md`

Organize video links with summaries.

For each video include:

* title;
* creator;
* topic;
* difficulty;
* key takeaways;
* link.

26. `resources/repos.md`

Organize relevant repositories.

Include:

* repository name;
* owner;
* topic;
* stack;
* relevance;
* link;
* notes.

27. `templates/experience-report.md`

Create a template users can copy to submit their AMD LLM experience.

28. `templates/benchmark-report.md`

Create a template users can copy to submit benchmark results.

29. `templates/guide-submission.md`

Create a template users can copy to submit a new guide.

30. `CONTRIBUTING.md`

Explain how to contribute:

* guides;
* benchmarks;
* videos;
* real-world experiences;
* corrections;
* troubleshooting notes;
* hardware compatibility reports.

Include minimum quality requirements:

* exact hardware;
* OS;
* driver/runtime versions;
* model;
* quantization;
* command used;
* source links;
* reproducibility notes;
* uncertainty labels.

31. `CODE_OF_CONDUCT.md`

Create a concise community code of conduct based on respectful collaboration.

32. `AGENTS.md`

Write instructions for future AI coding agents working on this repository.

Include:

* Do not invent benchmarks.
* Do not claim compatibility without a source.
* Prefer official documentation and verifiable community reports.
* Use clear Markdown.
* Keep content practical and reproducible.
* Update README when repository structure changes.
* Keep scripts safe and non-destructive.
* Do not copy copyrighted text.
* Cite sources when summarizing external material.
* Mark uncertainty clearly.
* Preserve the distinction between official, community-reported, and experimental information.

33. `LICENSE`

Use MIT License with placeholders:

* `[YEAR]`
* `[OWNER]`

If you think a documentation-focused license would be more appropriate, mention that in the final summary, but still create the MIT placeholder file unless instructed otherwise.

Final output required from you:

After creating the files, provide a summary in English with:

1. Files created or modified.
2. Main content added.
3. Sources successfully analyzed.
4. Sources that could not be analyzed.
5. Assumptions made.
6. Any TODOs left in the repository.
7. Recommended next 5 steps to grow the project and attract contributors.
