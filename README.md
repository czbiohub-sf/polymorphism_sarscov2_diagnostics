## TODO:  
* Add link to DOI  
* Add Jack's code to `figures`

# Identification of a polymorphism in the N gene of SARS-CoV-2 that adversely impacts detection by a widely-used RT-PCR assay.
Manu Vanaerschot, Sabrina Mann, James T. Webber, Jack Kamm, Sidney M. Bell, John Bell, Si Noon Hong, Minh Nguyen, Lienna Chan, Karan Bhatt, Michelle Tan, Angela Detweiler, Wesley Wu, Joshua Batson, David Dynerman, CLIAHUB Consortium, Debra Wadford, Andreas S. Puschnik, Norma Neff, Vida Ahyong, Steve Miller, Patrick Ayscue, Simon Paul, Amy Kistler, Joe L. DeRisi, Emily D. Crawford  
<sub>Chan Zuckerberg Biohub, San Francisco, California, USA (Manu Vanaerschot, Sabrina Mann, James T. Webber, Jack Kamm, Lienna Chan, Karan Bhatt, Michelle Tan, Angela Detweiler, Wesley Wu, Josh Batson, David Dynerman, Andreas S. Puschnik, Vida Ahyong, Norma Neff, Patrick Ayscue, Amy Kistler, Joe L. DeRisi, E. D. Crawford)  
Chan Zuckerberg Initiative, Redwood City, California, USA (Sidney M. Bell)
California Department of Public Health, Richmond, California, USA (John Bell, Debra Wadford)  
Department of Public Health, Madera, California, USA (Si Noon Hong, Minh Nguyen, Simon Paul)  
University of California, San Francisco, California, USA (Sabrina Mann, Steve Miller, Joe L. DeRisi, Emily D. Crawford)
</sub>

## Abstract  
We identify a mutation in the N gene of SARS-CoV-2 that adversely affects annealing of a commonly-used RT-PCR primer; epidemiologic evidence suggests the virus retains pathogenicity and competence for spread. This reinforces the importance of using multiple targets, preferably in at least 2 genes, for SARS-CoV-2 diagnosis.  

## Methods  
### Sequence Data
`./data/sequence_metadata.tsv` contains the accession numbers of all sequences used in this analysis. Per GISAID terms of service, these can be downloaded via [gisaid.org](gisaid.org).  

### qPCR values  
See `./data/Figure1*_rawdata.tsv`.  

### Analysis and Figures  
The tree was generated via [Nextstrain's augur](https://github.com/nextstrain/augur), v10.0.0, via the workflow specified in [nextstrain/ncov](https://github.com/nextstrain/ncov/commit/d03944a99edbad3f6c05fbb9b0caad46fdd77098) at the linked commit. The config files used are located in `tree/nextstrain-config/`.  

Figure 1 was generated in PRISM. Figure 2 was generated using the code found in `figures/`.

### Additional citations  
Our work is possible because of the computational tools developed by the research community. We gratefully acknowledge their contributions, and regret the journal-imposed limitation on the number of citations.   

* Nguyen, L.T., Schmidt, H., Haeseler, A., & Minh, B. (2014). IQ-TREE: a fast and effective stochastic algorithm for estimating maximum-likelihood phylogeniesMolecular biology and evolution, 32(1), 268–274.  
* Katoh, K., & Standley, D. (2013). MAFFT multiple sequence alignment software version 7: improvements in performance and usabilityMolecular biology and evolution, 30(4), 772–780.  
* Pérez, F., & Granger, B. (2007). IPython: a system for interactive scientific computingComputing in Science & Engineering, 9(3), 21–29.    
* IQ-Tree builds the tree under the hood; Mafft does the alignment; IPython is the computing environment.  
* RStudio Team (2020). RStudio: Integrated Development for R. RStudio, PBC, Boston, MA URL http://www.rstudio.com/.  
* Yu G (2020). "Using ggtree to Visualize Data on Tree-Like Structures." Current Protocols in Bioinformatics, 69(1), e96. doi: 10.1002/cpbi.96, https://currentprotocols.onlinelibrary.wiley.com/doi/abs/10.1002/cpbi.96.  
