## Creates cacheable matrix for inputting to
## cacheSolve() function which sets and gets 
## the cached values
makeCacheMatrix <- function(x = matrix()) {
  ## By default set the value to null initially
  inv_x <- NULL
  
  set <- function(y) {
    # set the value in the cache
    x <<- y
    ## since this has just been set clear the inverse value in the cache
    ## as it will need to be recalulated
    inv_x <<- NULL
  }
  
  get <- function() {
    ## return the cached value
    return(x)
  }
  
  setinverse<- function(inverse) {
    ## set the inverse value in the cache
    inv_x <<-inverse
  }
  
  getinverse <- function() {
    ## get the inverse value in the cache
    return(inv_x)
  }
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Computes the inverse of the cacheable matrix returned by makeCacheMatrix()
## If the inverse has already been calculated and there's no change in the matrix
## then the cacheSolve() returns the cached inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  ## get the cached inverse value
  inv_x <- x$getinverse()
  
  ## Check if the inverse value has been calulated (e.g. not null)
  if (!is.null(inv_x)) {
    message("getting cached data")
  } else {
    message("calculating inverse")
    ## calculate the inverse value
    ## X is a square invertible matrix, then solve(X) returns its inverse.
    inv_x <- solve(x$get())
    ## save the calculated value
    x$setinverse(inv_x)  
  }
  #return the value
  return(inv_x)
}


