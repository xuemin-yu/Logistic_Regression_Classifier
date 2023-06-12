# Logistic_Regression_Classifier

## Usage
### 1. Generate the CSV file 
Run **'generate_csv_file.sh'**<br/>

There is two cases for generating the CSV file: <br/>
1. Generating the CSV file for the labeled data (data has gold value of cluster_idx) <br/>
The CSV file is based on the cluster file and filtered dataset file created by ConceptX. <br/>
The CSV format is as follows: <br/>
token\tline_idx\tposition_idx\tembedding\tcluster_idx


2. Generating the CSV file for the unlabeled data (data has no gold value of cluster_idx) <br/>
The CSV file is based on the filtered dataset file created by ConceptX. <br/>
The CSV format is as follows: <br/>
token\tline_idx\tposition_idx\tembedding

If we want to generate the CSV file for the labeled data, we can set up the **'generate_csv_file.sh'** scripts as follows: <br/>
Example: <br/>
```
layer=12
datasetFile=${clusterDir}/layer${layer}/$data.tok.sent_len-layer${layer}_min_${minfreq}_max_${maxfreq}_del_${delfreq}-dataset.json
python generate_csv_labeled_data.py --dataset_file $datasetFile --cluster_file ${clusterDir}/layer${layer}/results/clusters-$cluster_num.txt --output_file $saveDir/clusters-map${layer}.csv
```

If we want to generate the CSV file for the unlabeled data, we can set up the **'generate_csv_file.sh'** scripts as follows: <br/>
Example: <br/>
```
layer=12
datasetFile=${clusterDir}/layer${layer}/$data.tok.sent_len-layer${layer}_min_${minfreq}_max_${maxfreq}_del_${delfreq}-dataset.json
python generate_csv_unlabeled_data.py --dataset_file $datasetFile --output_file $saveDir/clusters-map${layer}.csv
```


### 2. Split the CSV file into training and validation set (optional)
Run **'split_dataset.sh'**<br/>
This is an optional step if we want to validate the performance of the classifier.

### 3. Logistic Regression Classifier 
Run **'logistic_regression.sh'** <br/>

* We can choose to do the train, or validation, or predict, or all of them by setting the arguments **'--do_train, 
--do_validate, --do_predict'**. <br/>
* We can load the datasets separately by setting the arguments **'--train_file_path, --validate_file_path, 
--predict_file_path'**. <br/>
* Also, we can choose to load the classifier from the local file by setting the argument **'--load_classifier_from_local'
and '--classifier_file_path'**. <br/>

If we want to train and validate the performance of the classifier, we can set up the **'logistic_regression.sh'** scripts as follows: <br/>
Example: <br/>
```
layer=12
python logistic_regression.py \
  --train_file_path ./split_dataset/train/train_df_${layer}.csv\
  --validate_file_path ./split_dataset/validation/validation_df_${layer}.csv \
  --layer ${layer} \
  --save_path ./result \
  --do_train \
  --do_validate
  
```

If we want to train a classifier and use it to predict the labels of the dataset, we can set up the **'logistic_regression.sh'** scripts as follows: <br/>
Example: <br/>
```
layer=12
python logistic_regression.py \
  --train_file_path ./clusters_csv_train/clusters-map${layer}.csv \
  --test_file_path ./clusters_csv_test/clusters-map${layer}.csv \
  --layer ${layer} \
  --save_path ./result \
  --do_train \
  --do_predict \
  --classifier_file_path ./result/model/layer_${layer}_classifier.pkl \
  --load_classifier_from_local
```

If we want to use a trained classifier loaded from the local file to predict the labels of the dataset, we can set up the **'logistic_regression.sh'** scripts as follows: <br/>
Example: <br/>
```
layer=12
python logistic_regression.py \
  --test_file_path ./clusters_csv_unlabeled/clusters-map${layer}.csv \
  --layer ${layer} \
  --save_path ./result \
  --do_predict \
  --classifier_file_path ./result/model/layer_${layer}_classifier.pkl \
  --load_classifier_from_local
```

### 4. Get the Prediction Statistics
Run **'get_prediction_stats.sh'** <br/>
Getting the statistics for the prediction results. <br/>
Calculating the accuracy for the top1, top2, and top5 predictions. <br/>

If we want to get the statistics for the single layer, we can set up the **'get_prediction_stats.sh'** scripts as follows: <br/>
Example: <br/>
```
layer=12
python get_prediction_stats.py \
  --layer ${layer} \
  --file_path ./result/validate_predictions/
```

If we want to get the statistics for all layers, we can set up the **'get_prediction_stats.sh'** scripts as follows: <br/>
Example: <br/>
```
python get_prediction_stats.py \
  --all_layer_stats \
  --file_path ./result/validate_predictions/
```