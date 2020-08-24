##
## I simply set the input x as a matrix
## and then set the solved value "s" as null
##then Ichanged every reference to 'mean' to 'solve'
library(MASS)
makeCacheMatrix<-function(x=matrix(sample(1:100,9),3,3)){
  s<- NULL
  set<-function(y){
    x<<-y
    s<<-NULL
  }
  get <- function()x
  setsolve <- function(solve) s<<-solve
  getsolve<-function()s
  list(set=set,get=get,
       setsolve=setsolve,
       getsolve=getsolve)
}
##
## Same here,changed 'mean' to 'solve'
cacheSolve<-function(x,...){
  s<=x$getsolve()
  if(!is.null(s)){
    message("getting inversed matrix")
    return(s)
  }
  data<-x$get()
  s<-solve(data,...)
  x$setsolve(s)
  s
}
  

