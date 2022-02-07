A <- c(1,2,3)
B <- c(4,5,6) 
mew <- rbind(A,B)
mew

mat <- matrix(1:9,nrow=3)
mat

is.matrix(mat)

mat2 <- matrix(1:25,byrow=TRUE,nrow=5)
mat2

mat2[4:5,4:5]

sum(mat2)

mat3 <- matrix(runif(20, min=0, max=100),byrow=TRUE, nrow=4)
mat3


