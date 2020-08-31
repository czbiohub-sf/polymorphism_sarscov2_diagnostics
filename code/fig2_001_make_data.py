# Script to make data for Figure 2 plot (fig2_002_plot.R).
#
# This script is not fully reproducible, since the GISAID TOS don't
# allow sharing the sequences, and in particular this repo is missing
# the file "data/subsampled_alignment.fasta".
#
# All intermediate data results created by this script are stored in
# git, so that at least the second script "fig2_002_plot.R" may be
# reproduced.

from Bio import SeqIO
import pandas as pd
import os

# not shared due to gisaid TOS
seqs = list(SeqIO.parse("../data/subsampled_alignment.fasta", "fasta"))

ref, = SeqIO.parse(
    "../data/MN908947.3.fa", "fasta")


alleles_29140 = {}
for s in seqs:
    alleles_29140[s.id] = s[29139]

seq_meta = pd.read_csv(
    "../data/sequence_ids_metadata.tsv", sep="\t")

seq_meta.set_index("strain", inplace=True)

locs_df = []

for s in seqs:
    if not s.id.startswith("CDPH"):
        row = seq_meta.loc[s.id]
        locs_df.append({
            "strain": s.id,
            "region": row["region"],
            "country": row["country"],
            "division": row["division"],
            "location": row["location"]
        })
    else:
        locs_df.append({
            "strain": s.id,
            "region": "North America",
            "country": "USA",
            "division": "California",
            "location": "Madera"
        })

locs_df = pd.DataFrame(locs_df)
locs_df.to_csv("../data/fig2_locs_df.csv", index=False)

haplotype_df = []

for i in range(len(ref)):
    assert ref[i] in "ACTG"

    n_muts = 0
    for s in seqs:
        assert s[i] == s[i].upper()
        if s[i] != ref[i] and s[i] in "ACTG":
            n_muts += 1

    if n_muts >= 2:
        row = {"pos": i+1}
        for s in seqs:
            a = s[i]
            if a == ref[i]:
                continue
            row = {
                "strain": s.id,
                "pos": i+1,
                "allele": a
            }
            haplotype_df.append(row)

haplotype_df = pd.DataFrame(haplotype_df)
haplotype_df.to_csv(
    "../data/fig2_haplotype_df.csv", index=False
)
