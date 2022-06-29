library(igraph)
library(influenceR)
dat <- read.csv("Graph1/datasets/data-filtered.csv", header = TRUE)
mat <- as.matrix(dat)
g <- graph_from_data_frame(dat)

matrix_size <- length(g)
b_g <- betweenness(g)
b_g <- rev(sort(b_g))
print(c("betweenness mean: ", mean(b_g)))
pdf("Graph1/pdfs/betweenness_graph.pdf")
plot(b_g, xlab = "Indeks", ylab = "Betweenness", main = "Występowanie w charakterze węzła pośredniego jako miara centralności")
points(b_g, bg = 'tomato2', pch = 21, cex = 1, lwd = 1)
dev.off()

V(g)$label.cex = 1 #Font size

pdf("Graph1/pdfs/betweenness_map.pdf")
vcol <- rep("grey", length(g))
maxbg <- which(betweenness(g) == max(betweenness(g)))
vcol[V(g) == maxbg] <- "red"

print(max(b_g))

plot(g, vertex.size = betweenness(g) / c(rep(10, matrix_size)),
     edge.curved = 0.2,
     edge.width = (E(g)$weight ^ 0.1),
     vertex.color = vcol,
     edge.color = "grey",
     layout = layout.graphopt,
     edge.arrow.size = 0.3,
     main = "Występowanie w charakterze węzła pośredniego jako miara centralności")
dev.off()