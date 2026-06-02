#!/usr/bin/env bash

# Safe benchmark helper template for vLLM.
# This script does not install software or make system changes.

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  ./vllm-benchmark.sh -m <model> [options]

Options:
  -m, --model NAME_OR_PATH   Required model name or local path
  -H, --host HOST            Host to bind (default: 127.0.0.1)
  -P, --port PORT            Port to bind (default: 8000)
  -k, --api-key KEY          API key value to require (default: local-token)
  --extra ARG                Extra argument to pass to vllm serve (repeatable)
  -h, --help                 Show this help
EOF
}

MODEL=""
HOST="127.0.0.1"
PORT="8000"
API_KEY="local-token"
EXTRA_ARGS=()

while [ $# -gt 0 ]; do
  case "$1" in
    -m|--model)
      MODEL="$2"
      shift 2
      ;;
    -H|--host)
      HOST="$2"
      shift 2
      ;;
    -P|--port)
      PORT="$2"
      shift 2
      ;;
    -k|--api-key)
      API_KEY="$2"
      shift 2
      ;;
    --extra)
      EXTRA_ARGS+=("$2")
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [ -z "$MODEL" ]; then
  echo "Error: model name or path is required." >&2
  usage
  exit 1
fi

if command -v python3 >/dev/null 2>&1; then
  PYTHON_BIN="python3"
elif command -v python >/dev/null 2>&1; then
  PYTHON_BIN="python"
else
  echo "Error: Python is required but was not found." >&2
  exit 1
fi

if ! "$PYTHON_BIN" - <<'PY' >/dev/null 2>&1
import importlib
import sys
sys.exit(0 if importlib.util.find_spec("vllm") else 1)
PY
then
  echo "Error: Python is available, but the 'vllm' package is not importable." >&2
  exit 1
fi

if ! command -v vllm >/dev/null 2>&1; then
  echo "Error: the 'vllm' CLI was not found in PATH." >&2
  echo "Hint: activate the environment that provides the vLLM command." >&2
  exit 1
fi

CMD=("vllm" "serve" "$MODEL" "--host" "$HOST" "--port" "$PORT" "--api-key" "$API_KEY")

if [ "${#EXTRA_ARGS[@]}" -gt 0 ]; then
  CMD+=("${EXTRA_ARGS[@]}")
fi

echo "vLLM benchmark setup"
echo "  model: $MODEL"
echo "  host: $HOST"
echo "  port: $PORT"
echo "  api_key: $API_KEY"
echo "Exact command:"
printf '  %q' "${CMD[@]}"
printf '\n'

"${CMD[@]}"
