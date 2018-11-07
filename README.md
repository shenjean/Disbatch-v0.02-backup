# Disbatch-v0.02-backup

The identification of intrinsically disordered protein regions facilitates high
throughput structural determination, since these relatively unstructured and flexible
regions are reported to hamper protein purification and crystallization.
Additionally, intrinsically disordered regions have been known to be important for
protein function, through roles such as the presentation of protein modification sites
and the modulation of flexibility and specificity in protein-protein interactions.
Evidence has shown the evolutionary conservation and maintenance of protein
disorder to be non-trivial and non-random, suggesting functional significance.

<p>
As of 2011, computational methods, based on various sequence and structural features
in intrinsically disordered regions, have played an increasing role in the identification
of intrinsic protein disorder. In particular, meta-predictors that combine the results of
multiple primary prediction methods have been extensively applied due to higher
prediction accuracies. Nevertheless, most meta-predictors reported are limited in
terms of availability and scalability. Many are slow, unavailable locally and impose
practical restrictions on the number of submissions by users, posing difficulties for
large-scale batch sequence predictions. For example, GeneSilico MetaDisorder
MD2, the best disorder prediction method in CASP8 & CASP9, utilizes 15
22 primary disorder predictors and takes an average of 3 days for the prediction of 1-5
protein sequences, with a limitation of 10 jobs per day. Furthermore, the software is
also not available for local use. These constraints greatly limit the ability of the
scientific community to perform large scale protein disorder analysis.
</p>
<p>
In view of these limitations, I have developed a lightweight disorder meta-predictor
designed for rapid fully automated large-scale disorder analysis from protein
sequences. The prediction system, named DisBatch, demonstrates comparable performance with
GeneSilico MetaDisorder MD2, but with more than 10x speedup. The DisBatch metapredictor
was available both as a web service and as a local software package.
</p>
<p>
Disbatch was part of my MSc research on understanding the functional roles of intrinsic protein disorder in NFkB Transcription factors. A copy of my Msc thesis can be downloaded from: 
http://scholarbank.nus.edu.sg/handle/10635/30289

</p>

-----------------------
DisBatch Documentation
-----------------------

<b>1. Version</b>
-------------------------------------
DisBatch Version 0.02.
Please report all bugs/fixes to jean--at--bic.nus.edu.sg


<b>2a. Operating System</b>
-----------------
The local version of DisBatch is a command line tool containing Perl and Unix shell scripts zipped in a tar.gz file. 
The software will run on most versions of Linux, Unix and Mac OS X (with lynx and seq installed).

<b>2b. Dependencies</b> 
----------------
These software packages must be installed before running DisBatch
* Perl [http://www.perl.com]
* R [http://www.r-project.org]

<b>3. Installation Instructions:</b>
-------------------------------

* Unzip DisBatch-0.02.tar.gz : tar -xvf DisBatch-0.02.tar.gz
* You are now ready to run the DisBatch software!


<b>4. Run DisBatch:</b>
-------------------------------
- Use the following command: disbatch <inputfilename> <timeout(mins)>
- Example: disbatch test.fasta 10
- Timeout refers to the waiting time (in minutes per sequence) for the retrieval of PrDOS output from the remote PrDOS server.
  The recommended time is at least 10 minutes per sequence.
- If waiting time is too long, you can run DisBatch in the background using the following command: 
  nohup disbatch <inputfilename> <timeout>&
  and check the status using ps -ef | grep

<b>5. Output Files</b>
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
<b>Sample output file:</b>
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

