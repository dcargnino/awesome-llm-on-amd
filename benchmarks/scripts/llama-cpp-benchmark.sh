#!/usr/bin/env bash

# Safe benchmark helper for llama.cpp.
# This script does not install software or modify the system.

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  ./llama-cpp-benchmark.sh -m /path/to/model.gguf [options]

Options:
  -m, --model PATH       Required model path
  -b, --binary PATH      llama.cpp binary to run (default: llama-cli)
  -p, --prompt TEXT      Prompt to use
  -c, --context N        Context size (default: 4096)
  -n, --predict N        Tokens to predict (default: 128)
  -t, --threads N        CPU threads to use
  --                     Pass remaining arguments directly to llama.cpp
EOF
}

MODEL=""
BINARY="llama-cli"
PROMPT="Explain the difference between ROCm and Vulkan in one paragraph."
CONTEXT="4096"
PREDICT="128"
THREADS=""
EXTRA_ARGS=()

while [ $# -gt 0 ]; do
  case "$1" in
    -m|--model)
      MODEL="$2"
      shift 2
      ;;
    -b|--binary)
      BINARY="$2"
      shift 2
      ;;
    -p|--prompt)
      PROMPT="$2"
      shift 2
      ;;
    -c|--context)
      CONTEXT="$2"
      shift 2
      ;;
    -n|--predict)
      PREDICT="$2"
      shift 2
      ;;
    -t|--threads)
      THREADS="$2"
      shift 2
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    --)
      shift
      EXTRA_ARGS=("$@")
      break
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [ -z "$MODEL" ]; then
  echo "Error: model path is required." >&2
  usage
  exit 1
fi

if [ ! -f "$MODEL" ]; then
  echo "Error: model file not found: $MODEL" >&2
  exit 1
fi

if ! command -v "$BINARY" >/dev/null 2>&1; then
  echo "Error: llama.cpp binary not found in PATH: $BINARY" >&2
  exit 1
fi

CMD=("$BINARY" "-m" "$MODEL" "-p" "$PROMPT" "-c" "$CONTEXT" "-n" "$PREDICT")

if [ -n "$THREADS" ]; then
  CMD+=("-t" "$THREADS")
fi

if [ "${#EXTRA_ARGS[@]}" -gt 0 ]; then
  CMD+=("${EXTRA_ARGS[@]}")
fi

echo "About to run the following command:"
printf '  %q' "${CMD[@]}"
printf '\n'

"${CMD[@]}"
