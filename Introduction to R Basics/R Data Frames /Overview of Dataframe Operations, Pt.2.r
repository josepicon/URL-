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

#adding rows 

df2 <- data.frame(col.name.1 = 2000, col.name.2 = 'new')
df2
df

#adding rows 
dfnew <- rbind(df,df2)
dfnew

#creating a new column: dataframe$name_of_new_col <- 2*df$col.name.1
df$newcol <- 2*df$col.name.1
df

df$newcol.copy <- df$newcol
df

#creating a copy column, referencing an existing column 
df[,'newcol.copy2'] <- df$newcol
df

#setting column names 
#renaming all at once 
colnames(df) <- c('1', '2', '3', '4', '5')
df

#rename a specific column in a dataframe 
colnames(df)[1] <- 'new COL NAME'
df

#select multiple rows 
df[1:10,]

df[1:3,]

head(df,7)

#select everything, except a certain row 
df[-2,]

#conditional selection 

#select cars from mtcars df, where mpg > 20
mtcars[mtcars$mpg > 20 , ]

#return cars w mpg > 20 AND cyl == 6  
mtcars[(mtcars$mpg > 20) & (mtcars$cyl == 6) , ]

#same as above + return only cols mpg, cyl, and hp
mtcars[(mtcars$mpg > 20) & (mtcars$cyl == 6) , c('mpg', 'cyl', 'hp') ]

#return cars w mpg > 20 AND cyl == 6  
subset(mtcars, mpg > 20 & cyl ==6)

#select multiple cols 
mtcars[,c(1,2,3)]

#or 

#select multiple cols 
mtcars[,c('mpg','cyl','disp')]

#dealing with missing data 


#checking if any missing info, returns boolean values 
is.na(mtcars)

#checking if any missing info, 
#returns 1 boolean value
any(is.na(mtcars))

#for specific columns  
any(is.na(mtcars$mpg))

#replace all null values w/ 0 
df[is.na(df)] <- 0 

#add mean where there is null values 
df[is.na(df)] <- mean(df)
