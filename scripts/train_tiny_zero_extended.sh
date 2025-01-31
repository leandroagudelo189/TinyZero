#!/bin/bash
# This script runs an extended training task for TinyZero.
# It includes additional configurations or datasets for training.

# Define extended training configurations
EXTENDED_CONFIG="configs/extended_training.yaml"

# Define extended dataset path
EXTENDED_DATASET_PATH="data/extended_dataset"

# Run the training task with extended configurations
python -m vel.trainer.main_training \
    --config $EXTENDED_CONFIG \
    --data-path $EXTENDED_DATASET_PATH \
    --logging-level INFO
