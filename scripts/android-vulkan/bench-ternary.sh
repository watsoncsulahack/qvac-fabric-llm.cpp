#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
source ./env.sh

MODEL="${1:-${HOME}/models/Ternary-Bonsai-8B-Q2_0.gguf}"
OUT="${2:-bench-ternary-$(date -u +%Y%m%dT%H%M%SZ).txt}"

{
  date -u
  ./llama-bench \
    -m "${MODEL}" \
    -ngl 99 \
    -ctk f16 -ctv f16 \
    -b 256 -ub 32 \
    -fa off \
    -t 2 \
    -p 256 \
    -n 128 \
    -r 3
} | tee "${OUT}"
