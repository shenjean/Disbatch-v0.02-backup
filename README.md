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
NFkB Base was part of my MSc research on understanding the functional roles of intrinsic protein disorder in NFkB Transcription factors. A copy of my Msc thesis can be downloaded from: 
http://scholarbank.nus.edu.sg/handle/10635/30289

</p>
