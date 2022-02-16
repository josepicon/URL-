#creating a dataframe from vectors 
#creating vectors 
days <- c('Mon', 'Tue', 'Wed', 'Th', 'Fr')
temp <- c(22,21,23,24,25)
rain <- c(T,T,F,F,T)

#creating the dataframe 
data.frame(days,temp,rain)
df <- data.frame(days,temp,rain)
df


#return all values of a specific column 
df[,'rain']

#call rows 1-5 of specific columns 
df[1:5,c('days','temp')]

#call specific columns 

#data is returned in a vector 
df$days
df$temp

#data is returned in a dataframe format 
df['days']

#call in days where it rained 
subset(df,subset = rain==TRUE)

#grab days where temp > 23 
subset(df,subset = temp>23)

#sorting order of a df 

sorted.temp <- order(df['temp'])
sorted.temp

df[sorted.temp,]

desc.temp <- order(-df['temp'])
desc.temp

df[desc.temp,]


