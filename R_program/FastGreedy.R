gr <- graph.famous(name = "Zachary")


mm <- fastgreedy.community(gr)

plot(rev(mm$modularity), xlab = 'Number of clusters', ylab = 'Modularity value')
which.max(rev(mm$modularity))
plot(mm, gr)
