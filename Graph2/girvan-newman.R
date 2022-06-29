library(igraph)
library(bipartite)

dat <- olesen2002flores

gr <- graph.incidence(dat)
gr <- as_edgelist(gr)
colnames(gr) <- c("upper","lower")
gr <- graph_from_edgelist(gr)
V(gr)$type <- bipartite_mapping(gr)$type
V(gr)$color <- ifelse(V(gr)$type, "lightblue", "salmon")
V(gr)$shape <- ifelse(V(gr)$type, "circle", "square")
E(gr)$color <- "lightgray"

get.adjacency(gr)
E(gr)
eb <- edge_betweenness(gr, directed=FALSE)

#wykres ze skupieniami
pdf("pdfs/normalgraph-betweenness.pdf")
plot(gr,
     edge.width = eb*0.2,
     vertex.label.cex=0.6,
     vertex.label.color="black"
)
dev.off()

#dendrogram
pdf("pdfs/dendrogram.pdf")
res <- cluster_edge_betweenness(gr)
h.res <- as.hclust(res)
plot(h.res, hang = -1)
dev.off()