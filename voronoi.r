library(scales)
library(class)

#cleaning up the data
data <- rbind(c(1,1,'A'),c(3,2,'A'),c(3,3,'A'),c(2,1,'B'),c(3,1,'B'),c(2,2,'B'))

A1 = c(1,1)
A2 = c(3,2)
A3 = c(3,3)

B1 = c(2,1)
B2 = c(3,1)
B3 = c(2,2)

train <- rbind(A1, A2, A3, B1, B2, B3)
cl <- factor(c(rep("A",3),rep("B",3)))

#generating shapes for voronoi diagram
vt <- deldir(as.numeric(data[1:6,1]), as.numeric(data[1:6,2]))

#generating matrix of points for background colors
x <- as.vector(seq(1,3,.01))
m <- NULL

for (i in 1:length(x)) {
  m <- rbind(m,cbind(x[i], seq(1,3,.01)))
}

#applying k-nearest neighbor to classify all background color points
m.knn <- cbind(m,knn(train,m,cl,k=1))

#graphing all the things
plot(m.knn[,1],m.knn[,2], col=(m.knn[,3]+3), pch=3, xlab="X", ylab="Y", main="Voronoi Diagram")
plot(as.numeric(data[1:6,1]), as.numeric(data[1:6,2]), pch=16, col=data1$V3, add=TRUE)
plot(vt, wlines="tess",lty="solid",lwd=3,add=TRUE)
