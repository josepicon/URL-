#What is two to the power of five?

2^5

#Create a vector called stock.prices with the following data points: 23,27,23,21,34

stock.prices <- c(23,27,23,21,34)
stock.prices

#Assign names to the price data points relating to the day of the week, starting with Mon, Tue, Wed, etc...
names(stock.prices) <- c('Mon', 'Tue', 'Wed', 'Th', 'Fri' )
stock.prices

#What was the average (mean) stock price for the week?
mean(stock.prices)

#Create a vector called over.23 consisting of logicals that correspond to the days where the stock price was more than $23
over.23 <- stock.prices > 23
stock.prices[over.23]

#Use a built-in function to find the day the price was the highest
max(stock.prices)


