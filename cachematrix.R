## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    
    #This is where I will start my code. Check in with comments version
    inv_x <- NULL
    
    set <- function(new_matrix) {
        x <<- new_matrix
        inv_x <- NULL
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


## Checks if its a square matrix with non-zero determinant.
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
