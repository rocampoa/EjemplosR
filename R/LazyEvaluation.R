#Lazy evaluation

test0 <- function(x, y) {
  if (x > 0) x else y
}
test0(1)
test0(-1)

test2 <- function(x, n = floor(length(x)/2)) {
  x[1:n]
}
test2(1:10)
test2(1:10, 3)

test4 <- function(x, y = p) {
  p <- x + 1
  c(x, y)
}
test4(2)

check_input <- function(x) {
  switch (x,
    y = message("yes"),
    n = message("no"),
    stop("invalid input")
  )
}
check_input("y")
check_input("x")

#Copy-on-modify mechanism
x1 <- 1:3
x2 <- x1
x1[1] <- 0
x1
x2
tracemem(x1)
tracemem(x2)

simple_fun <- function() {
  cat("Executing environment: ")
  print(environment())
}
simple_fun()
