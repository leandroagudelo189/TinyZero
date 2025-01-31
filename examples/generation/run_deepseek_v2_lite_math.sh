pyth#!/bin/bash
# This script runs a generation task using the vel.trainer.main_generation module.
# It configures various parameters for the generation task, such as model paths, data paths, and rollout configurations.

# Define generation mode
GENERATION_MODE="standard"  # Options: standard, debug, extended

# Define logging level
LOGGING_LEVEL="INFO"  # Options: DEBUG, INFO, WARNING, ERROR

# Set configurations based on generation mode
if [ "$GENERATION_MODE" == "debug" ]; then
    data.n_samples=10
    rollout.top_p=0.9
elif [ "$GENERATION_MODE" == "extended" ]; then
    data.n_samples=1000
    rollout.top_p=0.95
fi

# Set logging level
export LOGGING_LEVEL

# Run the generation task
on3 -m verl.trainer.main_generation \
    trainer.nnodes=1 \
    trainer.n_gpus_per_node=8 \
    data.path=~/data/rlhf/gsm8k/test.parquet \
    data.prompt_key=prompt \
    data.n_samples=1 \
    data.output_path=~/data/rlhf/math/deepseek_v2_lite_gen_test.parquet \
    model.path=deepseek-ai/deepseek-llm-7b-chat \
    +model.trust_remote_code=True \
    rollout.temperature=1.0 \
    rollout.top_k=50 \
    rollout.top_p=0.7 \
    rollout.prompt_length=2048 \
    rollout.response_length=1024 \
    rollout.tensor_model_parallel_size=2 \
    rollout.gpu_memory_utilization=0.8
