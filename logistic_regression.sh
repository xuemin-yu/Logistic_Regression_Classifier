#!/bin/bash

#layer=12
#python logistic_regression.py \
#  --train_file_path ./split_dataset/train/train_df_${layer}.csv\
#  --validate_file_path ./split_dataset/validation/validation_df_${layer}.csv \
#  --layer ${layer} \
#  --save_path ./result \
#  --do_train \
#  --do_validate

layer=12
python logistic_regression.py \
  --train_file_path ./clusters_csv_train/clusters-map${layer}.csv \
  --test_file_path ./clusters_csv_test/clusters-map${layer}.csv \
  --layer ${layer} \
  --save_path ./result2 \
  --do_train \
  --do_predict \
  --classifier_file_path ./result/model/layer_${layer}_classifier.pkl \
  --load_classifier_from_local