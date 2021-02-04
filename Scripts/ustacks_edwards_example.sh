#!/usr/bin/env bash

####USTACKS LOOP######
#Loop will take all fastq.gz files as inputs and run ustacks using the same parameters.

(( COUNTER = 1 ))
for i in *.fastq.gz; do
	
	ustacks -t gzfastq -f $i -o ../../analyses/ustacks -i $((COUNTER++)) -d -r -m -p 15 ;

done
