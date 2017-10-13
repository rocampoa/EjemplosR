students <- list(
  a1 = list(name = "James", age = 25, gender = "M", 
            interest = c("reading", "writing")),
  a2 = list(name = "Jenny", age = 23, gender = "F",
            interest = c("cooking")),
  a3 = list(name = "David", age = 24, gender = "M",
            interest = c("running", "basketball"))
)
#laply a cada elemento de un vector o lista le aplica una función
#y retorna una lista
lapply(students, function(s){
  type <- switch(s$gender, "M" = "man", "F" = "woman")
  interest <- paste(s$interest, collapse = ", ")
  sprintf("%s, %d year-old %s, loves %s", s$name, s$age, type, interest)
})

#saply retonra un vector o una matriz según el caso
sapply(1:10, function(i) { i ^ 2})

sapply(1:10, function(i) c(i, i ^ 2))
#mapply
mapply(function(a, b, c) a * b + b * c  + a * c, a = c(1, 2, 3),
       b = c(5, 6, 7), c = c(-1, -2, -3))

# apply aplica una función a un margen o dimensión dado de una matrix o array
mat <- matrix(c(1, 2, 3, 4), nrow = 2)
apply(mat, 1, sum) # sumatoria de cada fial
apply(mat, 2, sum) #sumatoria de cada columna
mat2 <- matrix(1:16, nrow = 4)
apply(mat2, 2, function(col) range(col))
Sys.Date()
Sys.time()
