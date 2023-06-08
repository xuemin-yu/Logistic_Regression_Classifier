#!/bin/bash

layer=12
python get_prediction_stats.py \
  --layer ${layer} \
  --file_path ./result/validate_predictions/


#python get_prediction_stats.py \
#  --all_layer_stats \
#  --file_path ./result/validate_predictions/