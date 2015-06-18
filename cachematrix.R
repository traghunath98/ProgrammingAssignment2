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


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
