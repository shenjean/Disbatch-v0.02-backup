-----------------------
DisBatch Documentation
-----------------------

1. Version:
-------------------------------------
DisBatch Version 0.02.
Please report all bugs/fixes to jean--at--bic.nus.edu.sg


2. Hardware & Software Requirements:
-------------------------------------

2a. Operating System
-----------------
The local version of DisBatch is a command line tool containing Perl and Unix shell scripts zipped in a tar.gz file. 
The software will run on most versions of Linux, Unix and Mac OS X (with lynx and seq installed).

2b. Dependencies 
----------------
These software packages must be installed before running DisBatch
* Perl [http://www.perl.com]
* R [http://www.r-project.org]

3. Installation Instructions:
-------------------------------

* Unzip DisBatch-0.02.tar.gz : tar -xvf DisBatch-0.02.tar.gz
* You are now ready to run the DisBatch software!


4. Run DisBatch:
-------------------------------
- Use the following command: disbatch <inputfilename> <timeout(mins)>
- Example: disbatch test.fasta 10
- Timeout refers to the waiting time (in minutes per sequence) for the retrieval of PrDOS output from the remote PrDOS server.
  The recommended time is at least 10 minutes per sequence.
- If waiting time is too long, you can run DisBatch in the background using the following command: 
  nohup disbatch <inputfilename> <timeout>&
  and check the status using ps -ef | grep

5. Output Files
-------------------------------
A number of output files will be generated:

Output from primary methods - FoldIndex and PrDOS:
* <filename>.foldindex.csv : Binary prediction output from FoldIndex 
(0 for position not predicted to be disordered; 1 for position predicted to be disordered)
* <filename>.prdos.csv : Probability score output from PrDOS (min=0, max=1) 
* <filename>.f : Original prediction output for FoldIndex 
* <filename>.p : Original prediction scores for PrDOS 
* <filename>.prlog.txt : Job ID for PrDOS - 
You can check the status of your job at the PrDOS website as well 
[http://prdos.hgc.jp/cgi-bin/download.cgi?format=csv&ppid=<YOUR PRDOS JOB ID>]

Output from DisBatch Meta-Predictor: 
* <filename>.results.csv : DisBatch Meta-Prediction output file with raw scores 
(Sum of DisEMBL probability score + PrDOS binary score at each position; min=0, max=2) 
* <filename>.binary.csv : Summed prediction scores of DisBatch, converted to number of votes based on 
PrDOS threshold of 0.5
(No. of disorder votes from DisEMBL and PrDOS at each position; min=0, max=2) 

Error Logs (will be generated in the event of errors) 
* <filename>.error.f, <filename>.error.p, <filename>.error.r 
Error logs for FoldIndex, PrDOS and DisBatch Meta-Predictor (for combining FoldIndex and PrDos output)

Intermediate output files (will be cleaned up after a complete run)
* <filename>.f2, <filename>.f3, <filename>.f4 : Intermediate FoldIndex output files
* <filename>.p2, <filename>.p3 : Intermediate PrDOS output files

---------------------------
Sample output file:
---------------------------
x1,y1,z1
x2,y2,z2
x3,y3,z3
---------------------------

Output is in CSV format, where column -> sequence and row -> position:
    * Each column is separated by a comma (,) and contains prediction status of  each sequence (in the exact order of the input FASTA file).
    * Each row contains the prediction score/status in all input sequences at each position.
    * NA represent blank or null values which are not predicted by the predictor(s). For example,

For example,
    * x1, x2, x3 represent the disorder prediction score/status for sequence x (1st sequence in your input) 
    * y1, y2, y3 represent the disorder prediction score/status for sequence y (2nd sequence in your input) 
    at positions 1, 2 and 3 respectively. etc. 

For <filename>.results.csv
Each value represents the sum of disorder prediction scores at each position in a sequence, where 
Sum = FoldIndex binary score (0 for ordered; 1 for disordered) + PrDOS prediction probability score
* Recommended threshold is 1.5 *

For <filename>.binary.csv
Each value represents the disorder prediction status at each position in a sequence, where 
0 = not predicted by FoldIndex or PrDOS to be disordered at that particular position
1 = predicted by 1 prediction tool (either FoldIndex OR PrDOS) to be disordered
2 = predicted by 2 prediction tools (both FoldIndex AND PrDOS) to be disordered
* Recommended threshold is 2 *


