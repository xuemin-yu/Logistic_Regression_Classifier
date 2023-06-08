#!/bin/bash

saveDir='./split_dataset'
mkdir ${saveDir}


python split_dataset.py \
  --file_path './clusters_csv_train/' \
  --layer 12 \
  --validation_size 0.1 \
  --train_dataset_save_path ${saveDir}/train/ \
  --validation_dataset_save_path ${saveDir}/validation/ \
  --id_save_filename ${saveDir}/id.txt \
  --is_first_file

