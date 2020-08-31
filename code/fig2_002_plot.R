library(magrittr)
library(ggplot2)
library(ggtree)
library(aplot)

cadph_rename <- c(
  CDPH_Mad_1="USA/CA-CDPH007/2020",
  CDPH_Mad_2="USA/CA-CDPH010/2020",
  CDPH_Mad_3="USA/CA-CDPH026/2020",
  CDPH_Mad_4="USA/CA-CDPH027/2020",
  CDPH_Mad_5="USA/CA-CDPH031/2020",
  CDPH_Mad_6="USA/CA-CDPH032/2020"
)

tree_time = read.tree("../tree/nextstrain__timetree.nwk")
tree_time$tip.label <- dplyr::if_else(
  tree_time$tip.label %in% names(cadph_rename),
  cadph_rename[tree_time$tip.label],
  tree_time$tip.label
)
names(tree_time$tip.label) <- NULL

ct_df <- read.csv("../data/fig2-cts.csv")

read.csv("../data/fig2_locs_df.csv") %>%
  dplyr::mutate(Location=dplyr::case_when(
    startsWith(location,"Madera") ~ "Madera",
    division=="California" ~ "California",
    TRUE ~ region
  )) %>%
  dplyr::mutate(
    Location=factor(Location, levels=c("Madera", "California", "North America", "Africa", "Asia",  "Europe", "Oceania", "South America"))
  ) %>%
  dplyr::mutate(
    strain=dplyr::if_else(
      strain %in% names(cadph_rename),
      cadph_rename[strain], strain)) ->
  locs_df

readr::read_csv("../data/fig2_haplotype_df.csv") %>%
  dplyr::mutate(
    strain=dplyr::if_else(
      strain %in% names(cadph_rename),
      cadph_rename[strain], strain)) ->
  haplotype_df

haplotype_df %>%
  dplyr::mutate(Allele=dplyr::case_when(
    !(allele %in% c("A","C","T","G")) ~ "Missing/Ambiguous/DEL",
    pos==29140 ~ allele,
    TRUE ~ "ALT"
  )) %>%
  dplyr::mutate(Allele=factor(Allele, levels=c("C", "T", "REF", "ALT", "Missing/Ambiguous/DEL"))) ->
  haplotype_trans

p <- ggtree(tree_time, mrsd="2020-08-11", as.Date=TRUE)
p <- p %<+% locs_df
p <- p + geom_tippoint(aes(color=Location), size=2) +
  geom_tiplab(size=3, align=TRUE, hjust=0) +
  #xlim_tree(c(as.Date("2019-12-01"),as.Date("2020-09-29"))) +
  scale_x_date(limits=as.Date(c("2019-11-15", "2020-10-01")),
               date_labels="%b",
               breaks=as.Date(c("2019-12-01",
                                "2020-01-01",
                                "2020-02-01",
                                "2020-03-01",
                                "2020-04-01",
                                "2020-05-01",
                                "2020-06-01",
                                "2020-07-01",
                                "2020-08-01"))) +
  theme_tree2() +
  #ggthemes::scale_color_gdocs() ->
  #scale_color_brewer(type="qual") ->
  scale_color_brewer(palette="Dark2") ->
  #scale_color_viridis_d() ->
  #ggthemes::scale_color_colorblind() ->
  #ggthemes::scale_color_stata() ->
  #ggthemes::scale_color_tableau() ->
p

ct_df %>%
  tidyr::gather(Gene, Ct, -strain) ->
  ct_gathered

n_samples <- length(tree_time$tip.label)
data.frame(
  strain=rep(tree_time$tip.label,2),
  Gene=c(rep("N", n_samples), rep("E", n_samples))
) %>%
  ggplot(aes(y=strain, x=Gene)) +
  geom_blank() +
  geom_tile(aes(fill=Ct), data=dplyr::filter(ct_gathered, Gene!="RNAse.P")) +
  theme_bw() +
  theme(axis.text.y=element_blank(), axis.title.y=element_blank(), axis.ticks.y=element_blank()) +
  scale_fill_viridis_c(trans="reverse") ->
  p1


p2 <- ggplot(expand.grid(strain=tree_time$tip.label, pos=unique(haplotype_df$pos)), aes(y=strain, x=as.factor(pos))) +
  geom_blank() +
  #geom_tile(aes(fill=allele), data=dplyr::filter(haplotype_df, is.na(allele) | pos==29140)) +
  #geom_tile(data=dplyr::filter(haplotype_df, !(is.na(allele) | pos==29140))) +
  geom_tile(aes(fill=Allele), data=haplotype_trans) +
  theme_minimal() + xlab("Pos") +
  scale_fill_manual(drop=FALSE, values=c("red", "gold", "white", "black", "gray")) +
  theme(axis.text.y=element_blank(), axis.text.x=element_text(angle=90, hjust=1), axis.title.y=element_blank())

svg("../figures/fig2.svg", width=20, height=15)
p2 %>% insert_left(p, width=1.5) %>% insert_right(p1, width=.1)
dev.off()
