x <- 0 
    for (k in 1:10000){
        u1 = runif(1, 0, 1)
        u2 = runif(1, 0, 1)
        if(u1<5/6){
            x[k] <- 2*u2
        }else{
            if(2*u2-1>0){
                x[k] <- (2*u2-1)^(1/5) + 1
            }
            else{
                x[k] <- -(1 - 2*u2)^(1/5) + 1
            }
        }
    }

hist(x, freq=FALSE, breaks=50, col="lightblue") # nolint
curve((5/12)*(1+(x-1)^4), from=0, to=2, col= # nolint
"red", add=TRUE) # nolint