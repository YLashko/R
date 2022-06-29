library(igraph)
library(bipartite)

dat <- olesen2002flores

pdf("pdfs/plotweb.pdf")
plotweb(dat,text.rot = 90)
dev.off()

pdf("pdfs/visweb.pdf")
visweb(dat, type = "nested")
dev.off()

pdf("pdfs/moduleweb.pdf")
m <- computeModules(dat)
plotModuleWeb(m)
dev.off()