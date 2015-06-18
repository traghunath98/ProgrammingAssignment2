## Put comments here that give an overall description of what your
## functions do
## The 2 functions below compute inverse of a matrix in an optimal manner
## Computing inverse of a matrix is quite expensive. Hence we will try to cache
## the inverse of a matrix.
##
## When we receive a new matrix, we'll first check if the
## if the inverse of the matrix is computable. If yes, we either return the value from
## the cache or compute it and store it in the cache for future reference

## This function provides us the ability to define, store a matrix and its inverse
## The function encapsulates a set of get / set methods for a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
    
    inv_x <- NULL
    
    set <- function(new_matrix) {
        x <<- new_matrix
        
        # important to set inverse to null as matrix changes
        inv_x <<- NULL
    }
    
    get <- function() {
        x
    }
    
    setInvMatrix <- function(inv_matrix) {
        inv_x <<- inv_matrix
    }
    
    getInvMatrix <- function() {
        inv_x
    }
    
    invisible(list(set = set, get = get, setInv = setInvMatrix, getInv = getInvMatrix))

}


## Checks if the data structure provided a square matrix with non-zero determinant. If yes, inverse is computable
## If the inverse exists in the cache returns it, else computes inverse and sets cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

    inv_x <- NULL

    #Make sure that the matrix is square and its determinant is non-zero

    dimensions <- dim(x)

    if((dimensions[1] == dimensions[2]) && (det(x) != 0)){
    
        # Check if the Matrix is identical to stored matrix
        constr <- makeCacheMatrix()
    
        if(identical(x, constr$get()) && !is.null(constr$getInv())) {
        
            # Get the value of Matrix Inverse from Cache if it exists
            inv_x <- constr$getInv()
        
        } else {
        
            inv_x <- solve(x)
            constr$setInv(inv_x)
        
        }
    
    } else {
    
        message("Inverse of this matrix doesn't exist")
    
    }
    
    return(inv_x)

}
