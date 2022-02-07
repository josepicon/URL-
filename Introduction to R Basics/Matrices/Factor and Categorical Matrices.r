animal <- c('d','c','d','c','c')
id <- c(1,2,3,4,5) 
factor(animal)

factor.ani <- factor(animal)


#factor()
#Nominal - no order 
#Ordinal - Order 


#ordinal categorical variables, even though we are using strings 
ord.cat <- c('cold','med','hot')

temps <- c('cold','med','cold','med','hot','hot','cold')

#adding order for the temps vector 
fact.temp <- factor(temps,ordered=TRUE,levels=c('cold','med','hot'))
fact.temp

summary(temps)


summary(fact.temp)



