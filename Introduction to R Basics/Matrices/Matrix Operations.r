# Prices
goog <- c(450,451,452,445,468)
msft <- c(230,231,232,236,228)

# Put vectors into matrix
stocks <- c(goog,msft)
stock.matrix <- matrix(stocks,byrow=TRUE,nrow=2)

# Name matrix
days <- c('Mon','Tue','Wed','Thu','Fri')
st.names <- c('GOOG','MSFT')
colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names

# Display
stock.matrix

#summing the column from the matrix 
colSums(stock.matrix)

#summing the rows from the matrix 
rowSums(stock.matrix)


#the mean of rows in the matrix 
rowMeans(stock.matrix)

FB <- c(111,112,113,120,145)


#bind a new row to existing matrix 
#rbind takes the original matrix as first argument and what we want to bind with it 
tech.stocks <- rbind(stock.matrix, FB)
tech.stocks

#add the average column to the matrix 
#new variable equal to the row means of the tech.stocks matrix
avg <- rowMeans(tech.stocks)
avg

#adds a new column to the existing matrix 

tech.stocks <- cbind(tech.stocks, avg)
tech.stocks
