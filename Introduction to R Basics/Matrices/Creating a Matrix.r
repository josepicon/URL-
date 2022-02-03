#use the colon notation to create sequential vector of numerics 
1:10

v <- 1:10 
v

matrix(v)

#define the number of rows 
matrix(v,nrow=2)


#fill out the matrix by columns first, byrow = FALSE is the default 
matrix(1:12,byrow = FALSE,nrow=4)


#fillout matrix by row first 
matrix(1:12, byrow=TRUE, nrow=4)


# creating two vectors
goog <- c(450,451,452,445,468)
msft <- c(230,231,232,236,228)

#combining the vectors we just created 
stocks <- c(goog,msft)
stocks

stock.matrix <- matrix(stocks, byrow = T, nrow = 2)
stock.matrix

#creating the two vectors for the names we want to add in the matrix 
days <- c('Mon','Tue','Wed','Thu','Fri')
st.names <- c('GOOG','MSFT')

#define column names 
colnames(stock.matrix) <- days 

#define row names 
rownames(stock.matrix) <- st.names 

stock.matrix


