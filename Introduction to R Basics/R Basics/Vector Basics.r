#a vector is a one-dimensional array that can hold character, numberic, or logical data arguements 
nvec <- c(1,2,3,4,5)
nvec

class(nvec)

cvec <- c("U", "S", "A")
cvec

class(cvec)

lvec <- c(T,F)

lvec

class (lvec)

#cannot mix datatypes into the elements of the vector or array 
#R will convert the elements to be of the same class 

v <- c(TRUE, 20, 40)
    

#True is converted into a number 
v

v <- c("USA", 20, 31)

#R has created everything in the vector to be a character
class(v)

temps <- c(72,71,49,39,58,58,27)

temps

#apply a vector of names, for the temp vector 
names(temps) <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
temps

#creating a vector for days so its easier to recall 
days <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")

names(temps) <- days 

temps


