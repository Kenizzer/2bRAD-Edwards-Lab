
my0s=$(tail -n +3 batch_1.structure.tsv | cut -f1,2 --complement | grep -o "0" | wc -l)
myindiv=$(tail -n +3 batch_1.structure.tsv | wc -l)
myloci=$(head -n2 batch_1.structure.tsv | sed 's/\t/\n/g' | wc -l)
myobs=$(expr $myindiv \* $myloci)


echo "This is my # of 0s:"$my0s
echo "This is my observations:"$myobs
