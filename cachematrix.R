## Put comments here that give an overall description of what your
## functions do

## Matrix inversion is usually a costly computation and 
## there may be some benefit to caching the inverse of a
## matrix rather than compute it repeatedly (there are 
## also alternatives to matrix inversion that we will 
## not discuss here). Your assignment is to write a 
## pair of functions that cache the inverse of a matrix.


## makeCacheMatrix: 
## This function creates a special "matrix" object 
## that can cache its inverse.

## cacheSolve: 
## This function computes the inverse of the special 
## "matrix" returned by makeCacheMatrix above. If the 
## inverse has already been calculated (and the matrix 
## has not changed), then the cachesolve should retrieve
## the inverse from the cache.



makeCacheMatrix <- function(x = matrix()) {
  ## This function creates a special "matrix" object that can cache its inverse.
  
  cached_matrix_inverse <- NULL
  
  set <- function(y) {
    x <<- y
    cached_matrix_inverse <<- NULL
  }
  
  get <- function() {
    
    x 
  
    }
  
  set_inverse <- function(inverse) {
  
      cached_matrix_inverse <<-inverse
  
      }
    
  get_inverse <- function() {
    
    cached_matrix_inverse
  
    }
  
  list(set = set, get=get,
       set_inverse = set_inverse, get_inverse =get_inverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## This function computes the inverse of the special "matrix"
  ## returned by makeCacheMatrix above. If the inverse has 
  ## already been calculated (and the matrix has not changed), 
  ## then the cachesolve should retrieve the inverse from the cache.
  
  cached_solve <- x$get_inverse()
  
  if (!is.null(cached_solve)) {
    message("getting cached data")
    return(cached_solve)
  }
  matrix_x <- x$get()
  
  cached_solve <- solve(matrix_x, ...)
  x$set_inverse(cached_solve)
  cached_solve
}
