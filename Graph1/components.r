library(igraph)
library(influenceR)
dat <- read.csv("Graph1/datasets/data-filtered.csv", header = TRUE)
mat <- as.matrix(dat)
g <- graph.data.frame(dat)
matrix_size <- length(g)

print(is_connected(g))
Cl <- clusters(g, mode = "strong")
V(g)$color <- rainbow(Cl$no)[Cl$membership]

pdf("Graph1/pdfs/clusters.pdf")
plot(g, layout = layout.graphopt, mark.groups = split(1 : vcount(g), Cl$membership), main = "Spójne składowe grafu")
dev.off()