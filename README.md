# Edwards lab 2bRAD pipeline

As always everything in this pipeline is as is. There will be mistakes so take care to double check 
your work!

## Useful commands to start
This will show the manual for any program in UNIX, these are very detailed and are invaluble.

```bash
man grep
```
Checks permissions & size
[PHOTO](http://linuxcommand.org/images/file_permissions.png)

```bash
ls -lsha    
```
Give a file execute permission,.sh is an shell script file format, this is your go to when writing
scripts on UNIX.  

```bash 
    $ chmod u+x EXAMPLEFILE.sh
```
Nano is a text editor useable form the command line, it is simple and can get the job done quick. 
Alternatives are vi of emacs.Be mindful of line endings these can cause scripts to fail, Notepad++ 
on windows the default EOL (End of line) is windows format and you must change it to UNIX for the 
script to run on the cluster (Don't forget the execution permissions).

```bash
nano 
```
##Lets start
Before starting ensure the edited matz lab script is in the same working directory as your raw fastq
files open a terminal or cygwin and navigate to directory.

```bash
ls
cd ~/DIRECTORY/WITH/SEQUENCE/DATA
```
## Unzipped all raw fastq files

```bash
gzip COMPRESSEDFILENAME.fastq.gz 
``` 
The script (*trim2bRAD_2barcodes_noAdap.pl*) below will demultiplex the reads (script is based off 
one from Matz Lab protocol).

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

## Changes made = Add "row\*/" before input, output, mkdir, and mv. These changes now allow the script to be run within the sorted_trimmed directroy.
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
This script ran FASTX quality filter, made output files with the actual sample names,and moved them
to newly created folders corredponding to the rows. After we move moved all output "sample".fq files
to  "demultiplexed_.fq_unedited" folder. The files where subsequently zipped (gzip \*.fastq -9) then
tar (tar-cvf plate1_demultiplex_trim.tar), and uploaded to the HPC cluster via filezilla.

```bash
gzip *.fastq -9
tar -cvf batch5_6_demultiplex_plate123.tar *.gz
```
why zip and tar? KISS! Keep it small stupid.


## MANAGING AND USING CLUSTER QUEUES 
Much of what you need to know is covered in the documentation found for the APEX cluster at St. 
Louis University. The cluster is running a slurm environment, there is extensive documentation 
online to better understand how to use the cluster. READ THE DOCUMENTATION!

# STACKS

It is very wise to consult all the documentaion on the stacks website before beginning as it will save 
some headaches later. *You were warned!*
[STACKS Website](http://catchenlab.life.illinois.edu/stacks/)

## USTACKS
The unique stacks program will take as input a set of short-read sequences and align them into 
exactly-matching stacks (or putative alleles). (STACKS documentation)

The most important parameters to consider changing from the default for you data are M and m.

```bash
cd ~/DIRECTORY/WITH/SEQUENCE/DATA
chmod +x ustacks_edwards.sh
./ustacks_edwards.sh
```
## CSTACKS
A catalog can be built from any set of samples processed by the ustacks or pstacks programs. It will
 create a set of consensus loci, merging alleles together. (STACKS documentation)

The most important parameter to consider changing is n.
```bash
    $ ./cstacks_edwards.sh
```

Run the command below to check the progress of CSTACKS without having to see the whole report.
```bash
egrep -o "\[.*]" cstacksout.txt
``` 

## SSTACKS
Sets of stacks, i.e. putative loci, constructed by the ustacks program can be searched against a 
catalog produced by cstacks. In the case of a general population, all samples in the population 
would be matched against the catalog with sstacks. (STACKS documentation)
 
```bash
./sstacks_edwards.sh
```
Run the command below to check the progress of SSTACKS without having to see the whole report.
```bash
egrep -o "\[.*]" sstacks3out.txt
```
## Populations
The populations program will analyze a population of individual samples computing a number of 
population genetics statistics as well as exporting a variety of standard output formats. A 
population map specifying which individuals belong to which population is submitted to the program 
and the program will then calculate population genetics statistics such as expected/observed 
heterozygosity, π, and FIS at each nucleotide position. (STACKS documentation)

*You need to create a population map file in order to run populations* 
### EXAMPLE

```bash
populations -P ../../../../ustacks5/ -M ../../popmap_popschem1.1.txt --min_maf 0.05 --max_obs_het 0.75 -b 5 -k -p 8  -m 3 -r 0.6 -t 20 --structure \
    --genepop --write_single_snp 2> ./populationout.txt > ././populationerr.txt &
```
Outputs are put in the sstacks direcotry by populations program,  there is no way to specify the output
destination (Corrected in STACKS version 1.42).