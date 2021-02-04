# Edwards lab 2bRAD pipeline

#####If you need help with the basics of coding, get this book https://practicalcomputing.org/. The first few chapters will teach you enough to get started.

#####If you are having trouble with STACKS see the website https://catchenlab.life.illinois.edu/stacks/.

##Lets start 
First, check the the MD5sums of the files. Make sure you collected the MD5sums from the seqeucning core.
```bash
md5sum *.gz
```

## Unzipped all raw fastq files
```bash
gzip COMPRESSEDFILENAME.fastq.gz 
``` 

## Run demultiplexing script
The script (*trim2bRAD_2barcodes_noAdap.pl*) below will demultiplex the reads (script is based off one from Matz Lab protocol). https://github.com/z0on/2bRAD_denovo
```bash
./trim2bRAD_2barcodes_noAdap.pl fastq=Dios_plate1_row1_S7_L001_R1_001.fastq site=".{12}CGA.{6}TGC.{12}|.{12}GCA.{6}TCG.{12}" barcode2="[ATGC]{4}"
./trim2bRAD_2barcodes_noAdap.pl fastq=Dios_plate1_row2_S2_L001_R1_001.fastq site=".{12}CGA.{6}TGC.{12}|.{12}GCA.{6}TCG.{12}" barcode2="[ATGC]{4}"
./trim2bRAD_2barcodes_noAdap.pl fastq=Dios_plate1_row3_S3_L001_R1_001.fastq site=".{12}CGA.{6}TGC.{12}|.{12}GCA.{6}TCG.{12}" barcode2="[ATGC]{4}"
./trim2bRAD_2barcodes_noAdap.pl fastq=Dios_plate1_row4_S4_L001_R1_001.fastq site=".{12}CGA.{6}TGC.{12}|.{12}GCA.{6}TCG.{12}" barcode2="[ATGC]{4}"
./trim2bRAD_2barcodes_noAdap.pl fastq=Dios_plate1_row5_S5_L001_R1_001.fastq site=".{12}CGA.{6}TGC.{12}|.{12}GCA.{6}TCG.{12}" barcode2="[ATGC]{4}"
./trim2bRAD_2barcodes_noAdap.pl fastq=Dios_plate1_row6_S6_L001_R1_001.fastq site=".{12}CGA.{6}TGC.{12}|.{12}GCA.{6}TCG.{12}" barcode2="[ATGC]{4}"
./trim2bRAD_2barcodes_noAdap.pl fastq=Dios_plate1_row7_S8_L001_R1_001.fastq site=".{12}CGA.{6}TGC.{12}|.{12}GCA.{6}TCG.{12}" barcode2="[ATGC]{4}"
./trim2bRAD_2barcodes_noAdap.pl fastq=Dios_plate1_row8_S1_L001_R1_001.fastq site=".{12}CGA.{6}TGC.{12}|.{12}GCA.{6}TCG.{12}" barcode2="[ATGC]{4}"
```

## Remaning and filtering
This script (*fastz_quality_naming_plate123.sh*) is made to run all samples thro the fastx quality 
filter, discard low qual reads, and rename the files. Then it will create a new directory for the 
original files and move them to the new directory.
```bash
fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_TGGT.fq -o 46_01.fastq -Q 33 -q 20 -p 90;\
fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_AGAC.fq -o 46_23.fastq -Q 33 -q 20 -p 90;\
fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_ACCA.fq -o 48_11.fastq -Q 33 -q 20 -p 90;\
fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_AGTG.fq -o 77_07.fastq -Q 33 -q 20 -p 90;\
fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_CATC.fq -o 86_03.fastq -Q 33 -q 20 -p 90;\
fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_GTGA.fq -o 20_05.fastq -Q 33 -q 20 -p 90;\
fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_TCAG.fq -o 80_04.fastq -Q 33 -q 20 -p 90;\
fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_GCTT.fq -o 21_01.fastq -Q 33 -q 20 -p 90;\
fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_CTAC.fq -o 21_19.fastq -Q 33 -q 20 -p 90;\
fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_TGTC.fq -o 37_12.fastq -Q 33 -q 20 -p 90;\
fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_TCAC.fq -o 41_14.fastq -Q 33 -q 20 -p 90;\
fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_GACT.fq -o 18_05.fastq -Q 33 -q 20 -p 90;\
mkdir p1row1/;\
mv *.fastq -t p1row1/;\
```

## STACKS

At this point you have a set of files that can be run through STACKS. At this point you should see the 
manual for stacks and follow the steps https://catchenlab.life.illinois.edu/stacks/manual/