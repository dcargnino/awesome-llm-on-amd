# Contributing

Thank you for helping make `awesome-llm-on-amd` useful, practical, and trustworthy.

## What We Accept

- setup guides
- benchmark reports
- video and tutorial links
- real-world experience reports
- corrections and clarifications
- troubleshooting notes
- hardware compatibility reports
- links to upstream docs, repos, and issues

## Core Rules

- Do not invent benchmarks, compatibility claims, or performance numbers.
- Prefer official documentation and verifiable community reports.
- Mark uncertainty clearly.
- Keep contributions practical and reproducible.
- Cite the original source when summarizing external information.

## Minimum Quality Requirements

Most technical submissions should include:

- exact hardware name
- hardware class: CPU, APU, Radeon, Radeon PRO, or Instinct
- memory or VRAM amount if relevant
- operating system and version
- driver/runtime versions where relevant
- model name
- model format or quantization
- stack and backend used
- exact command used, or a close equivalent
- source links
- reproducibility notes
- uncertainty label

## Uncertainty Labels

Use one of these labels whenever possible:

- `Officially documented`
- `Community reported`
- `Needs verification`
- `Experimental`
- `Not tested`

## Benchmarks

Benchmark submissions should follow [benchmarks/template.md](benchmarks/template.md).

Please include:

- the exact benchmark command
- prompt or workload description
- context size
- warmup notes
- run count
- temperature or deterministic settings if used
- raw output when possible

Avoid screenshots without the underlying command and text output.

## Hardware Compatibility Reports

When reporting compatibility, include:

- exact hardware SKU
- OS and kernel if applicable
- driver and runtime details
- stack tested
- result status
- what worked
- what failed
- link to upstream docs or community thread if one exists

## Guides and Troubleshooting Notes

Good guides usually:

- state assumptions up front
- separate official facts from local observations
- explain failure modes
- avoid hardcoding fast-moving version details unless sourced
- include rollback or validation steps when relevant

## Pull Request Tips

- Keep changes scoped.
- Update `README.md` if the repository structure or navigation changes.
- Prefer tables when they improve scanability.
- Add `TODO` markers rather than guessing.
- If you add a script, keep it safe and non-destructive.

## Community Media

For videos, blogs, or repos, include:

- title
- author or organization
- link
- topic
- hardware or stack mentioned
- short note on why it matters

## License

By contributing, you agree that your contributions will be licensed under the repository's MIT license unless the project owner changes the license later.
