# Logistic_Regression_Classifier

## Usage
### 1. Generate the CSV file 
Run **'generate_csv_file.sh'**<br/>
Generating the CSV file based on the cluster file and filtered dataset file created by ConceptX.
The CSV format is as follows: <br/>
token\tline_idx\tposition_idx\tembedding\tcluster_idx


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

If we want to validate the performance of the classifier, we can set up the **'logistic_regression.sh'** scripts as follows: <br/>
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

If we want to predict the labels of the dataset, we can set up the **'logistic_regression.sh'** scripts as follows: <br/>
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
