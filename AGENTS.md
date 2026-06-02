# Instructions for AI Coding Agents

This repository is documentation-heavy and source-sensitive. Future AI agents should optimize for correctness and traceability over volume.

## Non-Negotiable Rules

- Do not invent benchmarks.
- Do not claim compatibility without a source.
- Prefer official documentation and verifiable community reports.
- Use clear Markdown.
- Keep content practical and reproducible.
- Update `README.md` when repository structure changes.
- Keep scripts safe and non-destructive.
- Do not copy copyrighted text.
- Cite sources when summarizing external material.
- Mark uncertainty clearly.
- Preserve the distinction between official, community-reported, and experimental information.

## Authoring Guidance

- Favor checklists, tables, and short explanations over marketing language.
- When support is version-sensitive, say so directly and link upstream.
- Add `TODO` markers where validation is missing.
- If a source is inaccessible, note that explicitly instead of filling gaps from memory.
- Reuse templates in `templates/` and benchmark conventions in `benchmarks/`.

## Source Handling

- Treat AMD, ROCm, PyTorch, Ollama, vLLM, and llama.cpp upstream docs as primary sources.
- Treat issue threads, forum posts, and community blogs as secondary sources.
- When a claim comes from a community report, label it as such.

## Scripts

- No destructive commands.
- No automatic installation.
- Check whether external commands exist before using them.
- Print the exact command when running benchmark helpers.
