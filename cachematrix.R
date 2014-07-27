## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  #clear the cached data? flag the data have changed?
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  #return the matrix
  #I am curious about where it saves the x?
  #when I changed the x,the get() function still return me the previous x
  get<-function() x
  #cache the inverse of matrix into another environment
  cacheSolve<-function(solve) m<<-solve
  #return the cached inversed matrix
  getSolve<-function() m
  list(set=set,get=get,setSolve=setSolve,getSolve=getSolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  #get the cached matrix
  m<-x$getSolve()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  #the meaning of get() is coercion?
  data<-x$get()
  #make the inversed matrix
  m<-solve(data)
  #cache the matrix
  x$setSolve(m)
  m
}
