## The functions below invert a square matrix by first:
## 1) Checking if the operation has been executed already. If so, the cached inverted matrix is returned.
## 2) If this is the first time the matrix is being inverted, we invert the matrix, and then
##    cache the result for future use.

## Return a list of functions operational over a matrix
makeCacheMatrix <- function(aMatrix = matrix()) {
  matrixInverse <- NULL
  
  setMatrix <- function(someMatrix) {
    matrixInverse <<- NULL
    aMatrix <<- someMatrix
  }
  
  getMatrix <- function() {
    aMatrix
  }
  
  setMatrixInverse <- function(inverse) {
    matrixInverse <<- inverse
  }
  
  getMatrixInverse <- function() {
    matrixInverse
  }
  
  list(set=setMatrix, get=getMatrix, getInverse=getMatrixInverse , setInverse=setMatrixInverse)
  
}


## Invert a matrix. If the solution has been cached, return it, otherwise, invert the matrix and
##cache the result.
cacheSolve <- function(aMatrix, ...) {
  ## Return a matrix that is the inverse of 'aMatrix'
  matrixInverse <- aMatrix$getInverse()
  
  #Is this the first time we are inverting the matrix ?
  if (is.null(matrixInverse)) {
    matrixInverse <- solve(aMatrix$get())
    aMatrix$setInverse(matrixInverse)
    
  }
  
  aMatrix$getInverse()
}
