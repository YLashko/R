library(igraph)
library(influenceR)
dat <- read.csv("Graph1/datasets/data-filtered.csv", header = TRUE)
mat <- as.matrix(dat)
g <- graph.data.frame(dat)
matrix_size <- length(g)
d_g <- degree(g)
d_g <- rev(sort(d_g))

print(c("degree mean: ", mean(d_g)))
pdf("Graph1/pdfs/degree_graph.pdf")
plot(d_g, xlab = "Indeks", ylab = "Stopień węzła", main = "Stopień węzła jako miara centralności")
points(d_g, bg = 'tomato2', pch = 21, cex = 1, lwd = 1)
dev.off()

V(g)$label.cex <- 1 #Font size

pdf("Graph1/pdfs/degree_map.pdf")
vcol <- rep("grey", length(g))
maxbg <- which(degree(g) == max(degree(g)))
vcol[V(g) == maxbg] <- "red"

print(max(d_g))

plot(g, vertex.size = degree(g) * c(rep(1 / 4, matrix_size)),
     edge.curved = 0.2,
     edge.width = (E(g)$weight ^ 0.1),
     vertex.color = vcol,
     edge.color = "grey",
     layout = layout.graphopt,
     edge.arrow.size = 0.3,
     main = "Stopień węzła jako miara centralności")
dev.off()