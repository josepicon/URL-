mat <- matrix(1:50,byrow=TRUE,nrow=5)
mat

 # Grab first row
mat[1,]

#Grab first column
mat[,1]

# Grab first 3 rows
mat[1:3,]

# Grab top left rectangle of:
# 1,2,3
# 11,12,13
#
mat[1:2,1:3]

# Grab last two columns
mat[,9:10]

# Grab a center square of:
# 15,16
# 25,26
mat[2:3,5:6]

mat[4:5, 3:5]


