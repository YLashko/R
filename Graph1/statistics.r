library(igraph)
library(influenceR)
g <- csv.to.igraph("Graph1/datasets/data-filtered.csv")

print(length(g))
print(ecount(g))

print("Średnica: ")
print(diameter(g))
print("Promień: ")
print(radius(g))
print("Gęstość: ")
print(graph.density(g))
