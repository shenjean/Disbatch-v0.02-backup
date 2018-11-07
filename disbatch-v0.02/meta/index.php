<html>
<head>
	<title>DisBatch</title>
</head>

<?php include 'header'?>
<b>About DisBatch</b></td></tr>
<tr><td>DisBatch is a light-weight disorder 
meta-predictor for large-scale sequence analysis. 
It combines the scores of two primary methods: FoldIndex and PrDOS.
<p><hr></td></tr>

<tr><td>
<pre><b>Submit DisBatch Prediction</b></pre>
<b><u>DISCLAIMER:</u> 
<font color=#666666>
<br>DisBatch relies on the FoldIndex and PrDOS prediction servers.
If there is a problem with any of the servers, DisBatch will not be able to complete the prediction.
In that case, please check the status of the FoldIndex and PrDOS prediction server,
refresh this page and try running DisBatch again.
</font></b>
<br><b>[Latest Status: PrDOS server is currently busy and difficult to connect to]</b>
<p>
<form action="/cgi-bin/predict/predictor" method="POST">
Please copy and paste your sequence (in <b>FASTA</b> format only) below:
<br><br>
<font color=#666666>
Currently, the DisBatch server accepts a maximum of 50 sequences. 
To predict more than 50 sequences, please <a href=index.html>download</a> 
the local version.
</font>
<br><br>
<textarea rows="20" cols="100" wrap="physical" name="seq">
>Example1
MKSDPPGHD
>Example2
FKHAGLYWW
</textarea>
<br><br>
Timeout for remote PrDOS server: &nbsp;   
<input type="text" name="timeout" value="10" size=1> &nbsp; minutes / per sequence
<br><font color=#666666>
(At least 10 minutes/per sequence is recommended for complete retrieval of results.
Alternatively, please contact PrDos for batch prediction.)
</font>
<br><br>
<input type="submit" value="Predict" />
</form>
</td></tr>

<tr><td>References:<br><ol>
<li> [ <a href=http://bip.weizmann.ac.il/fldbin/findex/>FoldIndex</a> ]  
Prilusky J, Felder CE, Zeev-Ben-Mordehai T, Rydberg EH, Man O, Beckmann JS, Silman I, Sussman JL. 
FoldIndex: a simple tool to predict whether a given protein sequence is intrinsically unfolded.. 
Bioinformatics. 2005; 21(16):3435-8. 
<a href=http://www.ncbi.nlm.nih.gov/pubmed/15955783>PubMed</a>
</li>
<br>
<li> [ <a href=http://prdos.hgc.jp/>PrDOS</a> ] 

Ishida T, Kinoshita K. PrDOS: prediction of disordered protein regions from amino acid sequence. Nucleic Acids Research. 2007; 35(suppl 2):W460-W464.
<a href=http://www.ncbi.nlm.nih.gov/pubmed/17567614>PubMed</a>
</li>
</ol></td></tr>
</table>
</body>
</html>
