## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#This function will set the inv. to NULL before then creating a function which will 
#set y and NULL in all environments and then create functions which will be used to invert the matrix
#finally, the funciton will return set, get, setmatrix, and getmatrix in list form

makeCacheMatrix <- function(x = matrix()) {
        #set the inverse to null
        inv <- NULL
        #create new function, 'set', which will take y variable
        set <- function(y) {
                #x is set to y (all enviornment)
                x <<- y
                #the inverse is set to null (all environment)
                inv <<- NULL
        }
        
        #call the function
        get <- function(x) x
        #create set matrixm which is a function using solve
        setmatrix <- function(solve) m <<- solve
        #create getmatrix which is a function taking m
        getmatrix <- function() m
        #created a list to show set, get, setmatrix, and get matrix
        list(set = set, get = get, setmatrix = setmatrix, getmatrix = getmatrix)

}


## Write a short comment describing this function
#This funciton will solve for the inverse of the matrix which is already cached

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        #check to see if m exists already
        m <- x$getmatrix()
        #tell R what to do if m exists already
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        
        data <- x$get()
        m <- solve(data, ...)
        x$setmatrix(m)
        m
}
