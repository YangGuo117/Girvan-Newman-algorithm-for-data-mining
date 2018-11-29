est_GN <- function(graph,deepth) {
  g <- graph
  g_copy <- graph
  best_g <- graph
  #init
  best_cluster <- components(g)
  cluster_num <- best_cluster$no
  cluster_list <- c(cluster_num)
  Q_max <- modularity(g, membership(best_cluster))
  Q_list <- c(Q_max)
  
  
  while (length(E(g)) > 0) {
    cat("num E = ", length(E(g)))
    est_btw <- edge.betweenness.estimate(g,directed=F, cutoff = deepth)
    print("btw done")
    max_btw_index = which.max(est_btw) 
    g <- g - E(g)[[max_btw_index]]
    clusters <- components(g)
    #print("before if")
    if (cluster_num != clusters$no) {
      cluster_num <- clusters$no
      #print(cluster_num)
      Q <- modularity(g_copy, membership(clusters),weights = NULL)
      #print("Q done")
      if (Q > Q_max) {
        Q_max <- Q
        best_cluster <- clusters
        best_g <- g
      }
      Q_list <- c(Q_list,Q)
      cluster_list <- c(cluster_list,clusters$no)
    }
  }
  cat("The best Q is ",Q_max,"when the cluster number is ",best_cluster$no)
  res <- list(maxQ = Q_max, best_cluster=best_cluster,QList = Q_list, cluser_List=cluster_list, g=g , g_copy=g_copy, best_g=best_g)
  return(res) 
}


gr <- graph.famous("Zachary")
estGN_result <- est_GN(simplify(gr),5)
plot(x = estGN_result$cluser_List,y = estGN_result$QList,
     type = "l",
     xlab = "num of cluster",
     ylab = "Q",
     main = "Q distrbution"
)
plot(estGN_result$g_copy,vertex.color= membership(estGN_result$best_cluster),mark.groups = groups(estGN_result$best_cluster))
plot(gr)

