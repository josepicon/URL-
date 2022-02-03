mat <- matrix(1:50,byrow=TRUE,nrow=5)
mat

# multiply all the numbers in the matrix by two 
2*mat

# divide all the numbers in the matrix by two 
2/mat

# power of 2 of all the numbers in the matrix 
2^mat

#Comparison operators with matrices
mat[mat > 17]

#Matrix Arithmetic with multiple matrices
#same as mat * 2
mat + mat

#same as mat / 2
mat / mat


# True Matrix Multiplication
mat2 <- matrix(1:9, nrow=3)
mat2 %*% mat2


