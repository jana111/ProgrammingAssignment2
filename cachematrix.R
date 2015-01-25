## MAKECACHEMATRIX
## This function creates a vector/list which contains 4 funtions
# 1/3 set/setinverse - set the value of the matrix x/matrix inverse of x
# 2/4 get/getinverse - get the value of the matrix x/matrix inverse of x
  

makeCacheMatrix <- function(x = matrix()) {
	# varible for storage of the matrix inverse matrix is created:
	inv <- NULL
	# value are assigned to the "matrix" and "inverse matrix" (regardless of the environment)
	set <- fuction(y){
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setinverse <- function(reverse) inv <<-inverse
	getinverse <- fucntion() inv
	# list of 4 functions is created:
	list(set=set, get=get, setinverse = setinverse, getinverse=getinverse)
}


## CACHESOLVE
## Function "cacheSolve" returns a matrix that is inverse of x (it takes the values setted in the previous function).
## The procedures is performed in the following steps:
## 1. At first function checks whether the inverse matrix has been calculated (= is stored in cache)
## 2. If so, it prints the stored inverse matrix
## 3. If not, it calculates the inverse matrix
## 4. The calculated inverse matrix is stored in the cache and printed

cacheSolve <- function(x, ...){
	# loads the value of inverse matrix:
	inv <- x$getinverse() 
	# if the value of the inverse matrix is not null (matrix has been calculated), function prints it
	if(!is.null(inv)){ 		
		message("getting cached data")
		return(inv)
	}
	# else function loads the matrix from cache
	data <- x$get()
	# the inverse matrix is calculated
	inv <- solve(data,...)
	# and stored to the cache
	x$setinverse(inv)  
	# and printed
	inv
}
