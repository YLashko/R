library(igraph)
library(bipartite)

dat <- olesen2002flores

sl_higher <- as.matrix(specieslevel(dat, index = c("degree", "normalised degree", "species specificity"), level = "higher"))
sl_lower <- as.matrix(specieslevel(dat,index = c("degree", "normalised degree", "species specificity"), level = "lower"))
#dla wyzszej grupy
pdf("Graph2/pdfs/higher.pdf")
plot(x=sl_higher[1:10,2],
     y=sl_higher[1:10,3],
     ylab = "Specyficzność",
     xlab = "Znormalizowany stopień",
     main = "Specyficzność węzłów z wyższej grupy",
     xlim = c(0,1),
     ylim = c(0,1)
)
dev.off()
#dla nizszej grupy
pdf("Graph2/pdfs/lower.pdf")
plot(x=sl_lower[1:10,2],
     y=sl_lower[1:10,3],
     ylab = "Specyficzność",
     xlab = "Znormalizowany stopień",
     main = "Specyficzność węzłów z niższej grupy",
     xlim = c(0,1),
     ylim = c(0,1)
)
dev.off()
print(grouplevel(dat, index = c("number of species", "mean number of links", "mean number of shared partners", "niche overlap")))
print(networklevel(dat, index = c("number of compartments", "H2")))