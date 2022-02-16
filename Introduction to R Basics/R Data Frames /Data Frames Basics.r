#built in dataframes in R 
state.x77
USPersonalExpenditure
women

#list of all dataframes 
data()

#see the top of dataframe, returns first 6 rows 
head(state.x77)

#see the bottom of dataframe, returns last 6 rows 
tail(state.x77)

#see the structure of a df
str(state.x77)

summary(state.x77)

#creating a dataframe from vectors 
#creating vectors 
days <- c('Mon', 'Tue', 'Wed', 'Th', 'Fr')
temp <- c(22,21,23,24,25)
rain <- c(T,T,F,F,T)

#creating the dataframe 
data.frame(days,temp,rain)
df <- data.frame(days,temp,rain)
df


str(df)

summary(df)
