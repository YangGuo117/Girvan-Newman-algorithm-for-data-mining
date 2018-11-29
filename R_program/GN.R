library(igraph)
gr <- graph.famous("Zachary")



eb <- edge.betweenness.community(gr)
plot(rev(eb$modularity), xlab = 'Number of clusters', ylab = 'Modularity value')
which.max(rev(eb$modularity))
plot(eb, gr)
