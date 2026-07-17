#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
source ./env.sh

MODEL="${1:-${HOME}/models/Ternary-Bonsai-8B-Q2_0.gguf}"
shift || true

exec ./llama-server \
  -m "${MODEL}" \
  -ctk f16 -ctv f16 \
  -b 256 -ub 32 \
  -fa off \
  -cram 0 \
  -ngl 99 \
  -t 2 \
  -np 1 \
  --no-cont-batching \
  --jinja \
  "$@"
