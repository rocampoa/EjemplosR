num <- c(1,2,3)
if (any(num > 2)) {
  cat("num > 2!\n")
}
if (all(num > 2)) {
  cat("num > 2!\n")
} else {
  cat("Not all values are greater than 2\n")
}
x <- ifelse(c(TRUE, FALSE, FALSE), c(1,2,3), c(4,5,6))
print(x)
x <- ifelse(num > 2, c(1,2,3), c(4,5,6))
print(x)
#Con DataFrame el for recorre por columnas
df <- data.frame(x=c(1,2,3), y = c("A", "B", "C"), stringsAsFactors = FALSE) 
for(col in df) {
  str(col)
}
#Si se quiere recorrer por filas
for(i in 1:nrow(df)){
  row <- df[i,]
  cat("row", i, "\n")
  str(row)
  cat("\n")
}
set.seed(123)
x <- numeric(1000)
for (t in 1:(length(x) - 1)) {
  x[[t + 1]] <- x[[t]] + rnorm(1, 0, 0.1)
}
plot(x, type = "s", main="Random walk", xlab="t")

sum100 <- sum(1:100)
random_walk <- cumsum(rnorm(1000, 0, 0.1))

#Permutaciones con For
x <- c("a", "b", "c")
combx <- character()
for (c1 in x) {
  for (c2 in x) {
    combx <- c(combx, paste(c1, c2, sep=",", collapse=""))
  }
}
print(combx)

#Permutaciones con valores distintos
for (c1 in x) {
  for (c2 in x) {
    if (c1 == c2) next
    combx <- c(combx, paste(c1, c2, sep=",", collapse=""))
  }
}
print(combx)

#expand.grid produces un data frame containing all permutations
print(expand.grid(n=c(1, 2, 3), x=c("a", "b")))
