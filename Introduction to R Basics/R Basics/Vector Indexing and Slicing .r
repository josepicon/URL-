#You can use bracket notation to index and access individual elements from a vector:

v1 <- c(100,200,300)
v2 <- c('a','b','c')

v1
v2

# Grab second element
v1[2]

v2[2]

#multiple indexing 
v1[c(1,2)]
v2[c(2,3)]
v2[c(1,3)]


#slicing 
v <- c(1,2,3,4,5,6,7,8,9,10)


#grab the starting index, colon, and stop index 
v[2:4]
v[7:10]

#indexing with names 
v <- c(1,2,3,4)
names(v) <- c('a','b','c','d')

#We can use those names along with the indexing brackets to grab individual elements from the array
v['a']

#multiple indexing with names 
# Notice how we can call out of order!
v[c('a','c','b')]


#Comparison Operators and Selection
v

#filter out any values less than 2 
v[v>2]

#logical vector is returned
v>2

#We could also assign names to these logical vectors and pass them as well, for example:
my.filter <- v>2
my.filter

v[my.filter]


