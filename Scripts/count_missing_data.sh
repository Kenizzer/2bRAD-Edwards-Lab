
my0s=$(tail -n +3 batch_9.structure.tsv | cut -f1,2 --complement | grep -o "0" | wc -l)
myindiv=$(tail -n +3 batch_9.structure.tsv | wc -l)
myloci=$(head -n2 batch_9.structure.tsv | sed 's/\t/\n/g' | wc -l)
myobs=$(expr $myindiv \* $myloci)

#Not quite sure if this floating pioint math will work on every computer, as it requires python (NOT 3)
percent_missing=$(python -c "print float($my0s)/float($myobs)")
echo "The is the precent missing data:"$percent_missing


echo "This is my # of 0s:"$my0s
echo "This is my observations:"$myobs
