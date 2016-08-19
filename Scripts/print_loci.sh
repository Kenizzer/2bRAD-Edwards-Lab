for i in batch_?.structure.tsv; do 

	myloci=$(head -n2 batch_1.structure.tsv | sed 's/\t/\n/g' | wc -l)
	echo $i 'has' $myloci
done
