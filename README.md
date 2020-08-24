## TODO:  
* Add link to DOI  
* Add Ct values to data  
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
See `./data/qPCR_values.tsv`.  

### Analysis and Figures  
The tree was generated via [Nextstrain's augur](https://github.com/nextstrain/augur), v10.0.0. The config files used are located in `nextstrain-config`.  

Figure 1 was generated in PRISM. Figure 2 was generated using the code found in `figures/fig2.rmd`.
