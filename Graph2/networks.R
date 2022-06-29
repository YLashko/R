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
#zWykly
pdf("pdfs/normalgraph.pdf")
plot(gr,
     vertex.label.cex=0.6,
     vertex.label.color="black"
)
dev.off()
#dwudzielny
pdf("pdfs/bipartitegraph.pdf")
plot(gr,
     layout=layout.bipartite,
     vertex.label.cex=0.5,
     vertex.label.color="black"
)
dev.off()