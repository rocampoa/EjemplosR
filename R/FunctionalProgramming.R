#Functional Programming
addn <- function(y) {
  function(x) {
    x + y
  }
}
add1 <- addn(1)
add2 <- addn(2)

color_line <- function(col) {
  function(...) {
    plot(..., type = "l", lty = 1, col = col)
  }
}

red_line <- color_line("red")
red_line(rnorm(30), main = "Red Line Plot")

nloglik <- function(x) {
  n <- length(x)
  function(mean, sd) {
    log(2 * pi) * n / 2 + log(sd ^ 2) * n / 2 + sum((x - mean) ^ 2) / (2 * sd ^ 2)
  }
}

data <- rnorm(10000, 1, 2)
fit <- stats4::mle(nloglik(data), start = list(mean = 0, sd = 1),
                   method = "L-BFGS-B", lower = c(-5, 0.01), upper = c(5, 10))
fit@coef

hist(data, freq = FALSE, ylim = c(0, 0.25))
curve(dnorm(x, 1, 2), add = TRUE, col = rgb(1, 0, 0, 0.5), lwd = 6)
curve(dnorm(x, fit@coef[["mean"]], fit@coef[["sd"]]),
      add = TRUE, col = "blue", lwd = 2)

f2 <- function(x, y) {
  op <- if (x > y) `+` else `-`
  op(x, y)
}

f2(5, 4)
f2(8, 11)

#Pasando funciones como argumentos
add <- function(x, y, z) {
  x + y + z
}

product <- function(x, y , z) {
  x * y * z
}

combine <- function(f, x, y ,z) {
  f(x, y, z)
}

combine(add, 3, 4, 5)
combine(product, 3, 4, 5)
