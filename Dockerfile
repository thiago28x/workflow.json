# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# The following custom nodes are from unknown_registry and could not be resolved automatically (no aux_id / registry entry):
# - CheckpointLoaderSimple
# - PreviewImage
# - VAEDecode
# - EmptyLatentImage
# - KSampler
# - TextEncodeQwenImageEditPlus
# - TextEncodeQwenImageEditPlus
# - LoadImage
# - LoadImage

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Phr00t/Qwen-Image-Edit-Rapid-AIO/resolve/main/Qwen-Rapid-AIO-v1.safetensors --relative-path models/checkpoints --filename Qwen-Rapid-AIO-v1.safetensors
# COPY input/ /comfyui/input/
