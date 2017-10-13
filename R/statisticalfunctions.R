#drawing a random sample for a given vector or list
print(sample(1:6, size=5))
print(sample(1:6, size=5, replace = TRUE))
print(sample(letters, size=5))
#Se puede indicar la probabilidad de cada elemento
grades <- sample(c("A", "B", "C"), size = 20, replace = TRUE, prob = c(0.25, 0.5, 0.25))
print(grades)
print(table(grades))
#Generar N números aleatorios de una distribución uniforme entre 0 y 1
print(runif(5))
#Especificando el mímino y el máximo
print(runif(5, min = -1, max = 1))
plot(runif(1000), runif(1000))
hist(runif(1000))
#Distribución normal
print(rnorm(5))
print(rnorm(5, mean = 2, sd = 0.5))
plot(rnorm(1000), rnorm(1000))
hist(rnorm(1000))
#Mediao Promedio
x <- rnorm(50)
cat("Promedio o Media ", mean(x), sum(x)/length(x), "\n")
cat("Mediana ", median(x), "\n")
cat("Desviación estándard ", sd(x), "\n")
cat("Varianza ", var(x), "\n")
cat("Desviación estándard ", sqrt(var(x)), "\n")
cat("Valor mínimo ", min(x), "\n")
cat("Valor máximo ", max(x), "\n")
cat("Range obtiene el máximo y mínimo ", range(x), "\n")
cat("quantiles ", quantile(x), "\n")
cat("quantiles ",quantile(x, probs = c(0.25, 0.50, 0.75)), "\n")
cat("quartiles ",quantile(x, probs = seq(0, 1, length = 5)), "\n")
cat("deciles ",quantile(x, probs = seq(0, 1, length = 11)), "\n")

#Covarianza
y <- 2 * x + 0.5 * rnorm(length(x))
cat("Covarianza ", cov(x, y), "\n")
#Coeficiente de Correlación
cat("Correlacion ", cor(x, y), "\n")
#Correlación y covariancia entre más de dos variables
z <- runif(length(x))
cat(x, "\n")
cat(y, "\n")
cat(z, "\n")
m1 <- cbind(x, y, z)
print(m1)
print("correlación")
print(cor(m1))
print("covarianza")
print(cov(m1))




