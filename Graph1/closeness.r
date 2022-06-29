library(igraph)
library(influenceR)
dat <- read.csv("Graph1/datasets/data-filtered.csv", header = TRUE)
mat <- as.matrix(dat)
g <- graph.data.frame(dat)
matrix_size <- length(g)
c_g <- closeness(g)
c_g <- rev(sort(c_g))

print(c("Closeness mean: ", mean(c_g)))
pdf("Graph1/pdfs/closeness_graph.pdf")
plot(c_g, xlab = "Indeks", ylab = "Bliskość", main = "Bliskość jako miara centralności")
points(c_g, bg = 'tomato2', pch = 21, cex = 1, lwd = 1)
dev.off()

V(g)$label.cex = 1 #Font size

cg_noNaN <- closeness(g)
cg_noNaN[is.nan(cg_noNaN)] <- 0

pdf("Graph1/pdfs/closeness_map.pdf")
vcol <- rep("grey", length(g))
maxbg <- which(cg_noNaN == max(cg_noNaN))
vcol[V(g) == maxbg] <- "red"

print(max(c_g))

plot(g, vertex.size = cg_noNaN * c(rep(50000, matrix_size)),
     edge.curved = 0.2,
     edge.width = (E(g)$weight ^ 0.1),
     vertex.color = vcol,
     edge.color = "grey",
     layout = layout.graphopt,
     edge.arrow.size = 0.3,
     main = "Bliskość jako miara centralności")

dev.off()
