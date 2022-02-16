#creating dataframes 
empty <- data.frame() # empty data frame

c1 <- 1:10 # vector of integers

c2 <- letters[1:10] # vector of strings

df <- data.frame(col.name.1=c1,col.name.2=c2)

#inporting and exporting data 
d2 <- read.csv('some.file.name.csv')

# For Excel Files
# Load the readxl package
library(readxl)
# Call info from the sheets using read.excel
df <- read_excel('Sample-Sales-Data.xlsx',sheet='Sheet1')

# Output to csv
write.csv(df, file='some.file.csv')

#getting information about dataframes 

# Row and columns counts
nrow(df)
ncol(df)
rownames(df)
colnames(df)
str(df) #structure of dataframe 
summary(df)

#referencing cells in a dataframe 
#dataframe[[row,column]]
df[[5,2]]

df[[5,"col.name.2"]]

#passing an assignment to a specific cell 
#dataframe[[row,column]] <- assignment 
df[[2,'col.name.1']] <- 9999
df

#call back a specific row 
df[1,]

head(mtcars)

#call back columns in a df
mtcars$mpg

#all of these return vectors of the data being called 

#get values of that column
mtcars[,'mpg']

#or 
mtcars[,1]

#or, double brackets
mtcars[['mpg']]

#returns a dataframe of a specific column (single set of brackets)
mtcars['mpg']

#call multiple columns 
head(mtcars[c('mpg', 'cyl')])
