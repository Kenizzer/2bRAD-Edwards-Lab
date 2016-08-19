# Edwards lab 2bRAD pipeline

As always everything in this pipeline is as is. There will be mistakes so take care to double check your
work!

##Useful commands to start
    $ man "command"
This will show the manual for any command in UNIX, these are very detail and are invaluble.

    $ ls -lsha    
Checks permissions & size
[a link](http://linuxcommand.org/images/file_permissions.png)
   
    $ chmod u+x filename.sh
Give a file execute permission, 

    $ nano 
Nano is a text editor useable form the command line, it is simple and can get the job done quick. 

.sh is an shell script file format, this is your go to when writing scripts on UNIX.  

Be mindful of line endings these can cause scripts to fail, Notepad ++ on windows the default EOL (End of 
line) is windows format and you must change it to UNIX for the script to run on the cluster (Don't forget 
the execution permissions).
 
##Lets start
Before starting ensure the edited matz lab script is in the same working directory as your raw fastq files
opened cygwin and navigate to directory.

    $ ls
    $ cd ../../cygdrive/c/Users/alx552/Desktop/thesis project/RAD seq/2bRAD data
 
##Unzipped all raw fastq files
use gzip
 
The script (*trim2bRAD_2barcodes_noAdap.pl*) below will demultiplex the reads (script is based off one
from Matz Lab protocol).


    $ ./trim2bRAD_2barcodes_noAdap.pl fastq=Dios_plate1_row1_S7_L001_R1_001.fastq site=".{12}CGA.{6}TGC.{12}|.{12}GCA.{6}TCG.{12}" barcode2="[ATGC]{4}"
    $ ./trim2bRAD_2barcodes_noAdap.pl fastq=Dios_plate1_row2_S2_L001_R1_001.fastq site=".{12}CGA.{6}TGC.{12}|.{12}GCA.{6}TCG.{12}" barcode2="[ATGC]{4}"
    $ ./trim2bRAD_2barcodes_noAdap.pl fastq=Dios_plate1_row3_S3_L001_R1_001.fastq site=".{12}CGA.{6}TGC.{12}|.{12}GCA.{6}TCG.{12}" barcode2="[ATGC]{4}"
    $ ./trim2bRAD_2barcodes_noAdap.pl fastq=Dios_plate1_row4_S4_L001_R1_001.fastq site=".{12}CGA.{6}TGC.{12}|.{12}GCA.{6}TCG.{12}" barcode2="[ATGC]{4}"
    $ ./trim2bRAD_2barcodes_noAdap.pl fastq=Dios_plate1_row5_S5_L001_R1_001.fastq site=".{12}CGA.{6}TGC.{12}|.{12}GCA.{6}TCG.{12}" barcode2="[ATGC]{4}"
    $ ./trim2bRAD_2barcodes_noAdap.pl fastq=Dios_plate1_row6_S6_L001_R1_001.fastq site=".{12}CGA.{6}TGC.{12}|.{12}GCA.{6}TCG.{12}" barcode2="[ATGC]{4}"
    $ ./trim2bRAD_2barcodes_noAdap.pl fastq=Dios_plate1_row7_S8_L001_R1_001.fastq site=".{12}CGA.{6}TGC.{12}|.{12}GCA.{6}TCG.{12}" barcode2="[ATGC]{4}"
    $ ./trim2bRAD_2barcodes_noAdap.pl fastq=Dios_plate1_row8_S1_L001_R1_001.fastq site=".{12}CGA.{6}TGC.{12}|.{12}GCA.{6}TCG.{12}" barcode2="[ATGC]{4}"


 
##Changes made = Add "row*/" before input, output, mkdir, and mv. These changes now allow the script to be run within the sorted_trimmed directroy.
This script (*fastz_quality_naming_plate123.sh*) is made to run all samples thro the fastx quality filter,
discard low qual reads, and rename the files. Then it will create a new directory for the original files
and move them to the new directory.
 
 
    $ fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_TGGT.fq -o 46_01.fastq -Q 33 -q 20 -p 90;\
    $ fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_AGAC.fq -o 46_23.fastq -Q 33 -q 20 -p 90;\
    $ fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_ACCA.fq -o 48_11.fastq -Q 33 -q 20 -p 90;\
    $ fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_AGTG.fq -o 77_07.fastq -Q 33 -q 20 -p 90;\
    $ fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_CATC.fq -o 86_03.fastq -Q 33 -q 20 -p 90;\
    $ fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_GTGA.fq -o 20_05.fastq -Q 33 -q 20 -p 90;\
    $ fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_TCAG.fq -o 80_04.fastq -Q 33 -q 20 -p 90;\
    $ fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_GCTT.fq -o 21_01.fastq -Q 33 -q 20 -p 90;\
    $ fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_CTAC.fq -o 21_19.fastq -Q 33 -q 20 -p 90;\
    $ fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_TGTC.fq -o 37_12.fastq -Q 33 -q 20 -p 90;\
    $ fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_TCAC.fq -o 41_14.fastq -Q 33 -q 20 -p 90;\
    $ fastq_quality_filter.exe -i Dios_plate1_row1_S7_L001_R1_001_GACT.fq -o 18_05.fastq -Q 33 -q 20 -p 90;\
    $ mkdir p1row1/;\                                                          
    $ mv *.fastq -t p1row1/;\   

This created the output files containing the actual sample name and moved them to newly created folders
corredponding to the rows. After we move moved all output "sample".fq files to "demultiplexed_.fq_unedited"
folder. The files where subsequently zipped (gzip *.fastq -9) then tar (tar-cvf plate1_demultiplex_trim.tar),
and uploaded to the cluster via filezilla.

    $ gzip *.fastq -9
    $ tar -cvf batch5_6_demultiplex_plate123.tar *.gz

why zip and tar? KISS! Keep it small stupid.


##MANAGING AND USING CLUSTER NODES 
Much of what you need to know is covered in the documentation found for the Kepler cluster.
READ THE DOCUMENTATION!

    $ top 
Check processes running on a cluster

    $ kill (process ID)
kill a process on the currently running.The process id (PID) is the number in the first column associated 
with a process.

Having trouble working with the cluster? READ THE DOCUMENTATION! Then find help if it is still needed.

# STACKS

It is very wise to consult all the documentaion on the stacks website before beginning as it will save 
some headaches later. *You were warned!*
[a link](http://catchenlab.life.illinois.edu/stacks/)

##USTACKS
Below are the commands used on the cluster. See the parameters tutorial on the stacks website for info on the M and m paramters

    $ cd demultiplexed_trimmed_data/plate2/
    $ ls
    $ chmod +x dios_ustacks.sh
    $ sh dios_ustacks.sh

##CSTACKS
To run the cstacks program, I ran the script below. 

    $ ./dios_cstacks_plate_123.sh

Run the command below to check the progress of CSTACKS without having to see the whole report.

    $ egrep -o "\[.*]" cstacksout.txt
 
##SSTACKS
SSTACKS requires all the outputs from both ustacks and cstacks thus, cstacks outputs were copied to to 
ustacks directory and sstacks was run from the ustacks directory.To run the SSTACKS program, I ran the
script below.
 
    $ sh dios_sstacks4.sh
 
Run the command below to check the progress of SSTACKS without having to see the whole report.
 
    $ egrep -o "\[.*]" sstacks3out.txt
 
##Populations
Populations program was run from the command line (i.e. no .sh file)  (see populations_runs.txt). In order
to run populations all stacks outputs were put into sstacks directory and Populations was run from the 
populations directory. 
*You need to create a population map file in order to run populations* 
###EXAMPLE
popschem1
r=60%
p=60%

    $ populations -P ../../../../ustacks5/ -M ../../popmap_popschem1.1.txt --min_maf 0.05 --max_obs_het 0.75 -b 5 -k -p 8  -m 3 -r 0.6 -t 20 --structure \
    --genepop --write_single_snp 2> ./populationout.txt > ././populationerr.txt &

Outputs are put in the sstacks direcotry by populations program,  there is no way to specify the output
destination (Corrected in updated STACKS version 1.42)
    
# QUICK ANALYZING RESULTS 
Run the below script to determine number of rad tags produced from cstacks. This will differ from the 
number of loci produced in populations as populations filters out monomorphic loci.
  
    $ cat batch1.catalog.tags.tsv | wc -l

#### Determine number of loci in one file

  head -n1 batch_1.structure.tsv |  sed 's/\t/\n/g' | wc -l
  
### Loop to determine the number of loci for many files 

for i in batch_?.structure.tsv; do 

	myloci=$(head -n2 batch_1.structure.tsv | sed 's/\t/\n/g' | wc -l)
	echo $i 'has' $myloci
done

### Determine the amount of missing data in each file 

my0s=$(tail -n +3 batch_1.structure.tsv | cut -f1,2 --complement | grep -o "0" | wc -l)
myindiv=$(tail -n +3 batch_1.structure.tsv | wc -l)
myloci=$(head -n2 batch_1.structure.tsv | sed 's/\t/\n/g' | wc -l)
myobs=$(expr $myindiv \* $myloci)

echo "This is my # of 0s:"$my0s
echo "This is my observations:"$myobs

  
