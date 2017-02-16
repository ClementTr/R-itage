head(iris)
data("iris")
View(iris)

set.seed(101)

gmean = function(x) prod(x)^(1/length(x))

kmeans2 = function(x, k, iter = 10){
  res = numeric(iter)
  clust = matrix(nrow = iter, ncol = nrow(x))
  for (i in 1:iter) {
    km = kmeans(x, k)
    res[i] = gmean(km$withinss)
    clust[i,] = km$cluster 
  }
  return(clust[which.min(res)])
}

cl = matrix(nrow = 5, ncol = nrow(iris))
for (k in 2:6)
  cl[k-1,] = kmeans2(iris[,1:4], k)


apply(cl, 1, table)
plot(iris[,1:2])
plot(iris[,2:3])
pairs(iris[,1:4])
pairs(iris[,1:4], col = cl[1,])
