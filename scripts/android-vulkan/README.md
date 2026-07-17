# Android arm64 Vulkan ternary/QVAC artifact

Builds the QVAC Fabric / ternary-capable llama.cpp fork for Android arm64 with Vulkan enabled.

Runtime path policy:

- artifact-local shared libraries are loaded from the unpacked directory
- Android Vulkan is loaded from `/system/lib64/libvulkan.so`
- Termux libraries are loaded from `${PREFIX}/lib`
- `libvulkan.so` is intentionally not bundled, because the system loader must dispatch to the phone vendor driver

Launchers:

- `start-ternary-stable.sh` runs `llama-server` with conservative Vulkan settings for Bonsai/TQ/Q2 GGUFs
- `bench-ternary.sh` runs a small `llama-bench`

Default model path: `${HOME}/models/Ternary-Bonsai-8B-Q2_0.gguf`.
