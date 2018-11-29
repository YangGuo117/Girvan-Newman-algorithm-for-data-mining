library(igraph)
setwd("~/Desktop/2018-Fall/cse514/Girvan-Newman-algorithm-for-data-mining/R_program")
file <- read.table("test.txt")
gr <- graph.data.frame(file, directed=FALSE, vertices=NULL)
gr <- graph.data.frame(read.table("com-amazon.ungraph.txt"), directed=FALSE, vertices=NULL)
gr <- graph.data.frame(read.table("com-dblp.ungraph.txt"), directed=FALSE, vertices=NULL)
gr <- graph.data.frame(read.table("email-Eu-core-department-labels .txt"), directed=F, vertices=NULL)
gr <- graph.data.frame(read.table("facebook_combined.txt"), directed=FALSE, vertices=NULL)
gr <- graph.data.frame(read.table("ca-GrQc.txt"), directed=FALSE, vertices=NULL)
gr <- graph.data.frame(read.table("email-Enron.txt"), directed=FALSE, vertices=NULL)













z_cluster <- graph.famous("Zachary")
eu = read.table("email-Eu-core.txt")
test = read.table("test.txt")


g = graph.data.frame(eu, directed=FALSE, vertices=NULL)
#eb <- estimate_betweenness(g, vids = V(graph), directed = FALSE, cutoff,weights = NULL, nobigint = TRUE)
eb <- edge.betweenness.community(g,directed=F)
#plot(eb, g)


est_zCluster <- edge.betweenness.estimate(z_cluster,directed=F, cutoff = 100)
true_zCluster <- edge.betweenness.community(z_cluster,directed=F)
plot(true_zCluster, z_cluster)

test_g <- graph.data.frame(test, directed=FALSE, vertices=NULL)
E(test_g)
V(test_g)
est_btw <- edge.betweenness.estimate(test_g,directed=F, cutoff = 100)
max_btw_index = which.max(est_btw) 
test_g <- test_g - E(test_g)[[2]]
clusters <- components(test_g)
gp <- groups(clusters)
test_g$membership <- clusters$membership
Q = modularity(test_g, membership(clusters))


plot(test_g,vertex.color= rainbow(10, .8, .8, alpha=.8)[membership(clusters)])
plot(gp,test_g)
#mark.groups = mark.groups
