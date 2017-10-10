set.seed(123)
x <- numeric(1000)
for (t in 1:(length(x) - 1)){
  x[[t + 1]] <- x[[t]] + rnorm(1 ,0, 0.1)
}
#Recorriendo un dataframe por columnas
plot(x, type = "s", main = "Random walk", xlab = "t")
df <- data.frame(x= c(1, 2, 3), y = c("A", "B", "C"), stringsAsFactors = FALSE)
for(col in df) {
  str(col)
}
#recorriendo un dataframe por filas
cat("-------------------------------\n")
cat("recorriendo un dataframe por filas")
for(i in 1:nrow(df)) {
  row <- df[i, ]
  cat("row", i, "\n")
  str(row)
  cat("\n")
}
cat("-------------------------------\n")
cat("numeros entre 1000 y 1100 que cumplen i^2 %% 11 == i^3 %% 17 \n")
m <- integer()
for (i in 1000:1100) {
  if ((i ^ 2) %% 11 == (i ^ 3) %% 17) {
    m <- c(m, i)
  }
}
cat("-------------------------------\n")
x <- c("a", "b", "c")
combx <- character()
for (c1 in x) {
  for (c2 in x) {
    combx <- c(combx, paste(c1, c2, sep = ",", collapse = ""))
  }
}
cat(combx)

