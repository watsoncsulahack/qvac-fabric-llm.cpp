#!/data/data/com.termux/files/usr/bin/bash
# Source this from launcher scripts. Keeps Android/Termux Vulkan lookup deterministic.
set -euo pipefail

BINDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TERMUX_PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"

# Do not ship libvulkan.so in the artifact. Android's system loader must load the
# device vendor Vulkan stack from /system/lib64.
if [ ! -r /system/lib64/libvulkan.so ]; then
  echo "error: /system/lib64/libvulkan.so not found; Vulkan is unavailable on this device" >&2
  exit 1
fi

export LD_LIBRARY_PATH="${BINDIR}:/system/lib64:${TERMUX_PREFIX}/lib:${LD_LIBRARY_PATH:-}"

# Conservative defaults for Pixel/Mali driver stability. Override from the shell
# before launching if you want to test faster paths.
export GGML_VK_DISABLE_FUSION="${GGML_VK_DISABLE_FUSION:-1}"
export GGML_VK_DISABLE_GRAPH_OPTIMIZE="${GGML_VK_DISABLE_GRAPH_OPTIMIZE:-1}"
export GGML_VK_DISABLE_INTEGER_DOT_PRODUCT="${GGML_VK_DISABLE_INTEGER_DOT_PRODUCT:-1}"
