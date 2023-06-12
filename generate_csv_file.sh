cluster_num=400
clusterDir="text_test"
data=text.in.test

minfreq=0
maxfreq=1000000
delfreq=1000000

saveDir=clusters_csv_test
mkdir $saveDir

#for i in {0..12}
#do
#echo $i
#i=12
#datasetFile=${clusterDir}/layer$i/$data.tok.sent_len-layer${i}_min_${minfreq}_max_${maxfreq}_del_${delfreq}-dataset.json
#python generate_csv_labeled_data.py --dataset_file $datasetFile --cluster_file ${clusterDir}/layer$i/results/clusters-$cluster_num.txt --output_file $saveDir/clusters-map$i.csv
#done

# i=12
# datasetFile=${clusterDir}/layer$i/$data.tok.sent_len-layer${i}_min_${minfreq}_max_${maxfreq}_del_${delfreq}-dataset.json
# python generate_csv_unlabeled_data.py --dataset_file $datasetFile --output_file $saveDir/clusters-map$i.csv
