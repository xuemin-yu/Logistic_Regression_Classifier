#!/bin/bash

# validate the performance of classifier loaded from sklearn
#layer=12
#python logistic_regression.py \
#  --train_file_path ./split_dataset/train/train_df_${layer}.csv\
#  --validate_file_path ./split_dataset/validation/validation_df_${layer}.csv \
#  --layer ${layer} \
#  --save_path ./result \
#  --do_train \
#  --do_validate

# train the classifier and use this trained classifier to predict the cluster_idx for test set
#layer=12
#python logistic_regression.py \
#  --train_file_path ./clusters_csv_train/clusters-map${layer}.csv \
#  --test_file_path ./clusters_csv_test/clusters-map${layer}.csv \
#  --layer ${layer} \
#  --save_path ./result2 \
#  --do_train \
#  --do_predict \
#  --classifier_file_path ./result/model/layer_${layer}_classifier.pkl \
#  --load_classifier_from_local


# loaded a trained classifier from local and use it o predict the cluster_idx for test set
layer=12
python logistic_regression.py \
  --test_file_path ./clusters_csv_unlabeled/clusters-map${layer}.csv \
  --layer ${layer} \
  --save_path ./result2 \
  --do_predict \
  --classifier_file_path ./result/model/layer_${layer}_classifier.pkl \
  --load_classifier_from_local