f <- function(x) 2 * x + 3
x <- rnorm(100)
y <- f(x) + 0.5 * rnorm(100)
model1 <- lm(y ~ x)
model1
summary(model1)
coef(model1)
plot(x, y, main = "A simple linear Regression")
abline(coef(model1), col = "blue")
predict(model1, list(x = c(-1, 0.5)), se.fit = TRUE)

#Se intenta predecir el tiempo de buelo usando modelos lineales
# de diferente complejidad. La variable mas obvia útil para predecir
#el tiempo de vuelo es la distancia
data("flights", package = "nycflights13")
plot(air_time ~ distance, data = flights, pch = ".",
     main = "Flight speed plot")
rows <- nrow(flights)
rows_id <- 1:rows
sample_id <- sample(rows_id,  rows * 0.75, replace = FALSE)
flights_train <- flights[sample_id,]
flights_test <- flights[setdiff(rows_id, sample_id),]

#Primero se utilza el conjunto de entrenamiento para alimentar el modelo

model2 <- lm(air_time ~ distance, data = flights_train)
predict2_train <- predict(model2, flights_train)
error2_train <- flights_train$air_time - predict2_train
#Evaluar la magnitud de los errores
evaluate_error <- function(x) {
  c(abs_err = mean(abs(x), na.rm = TRUE), std_dev = sd(x, na.rm = TRUE))
}
evaluate_error(error2_train)

predict2_test <- predict(model2, flights_test)
error2_test <- flights_test$air_time - predict2_test
evaluate_error(error2_test)

#El modelo2 anterior sólo tiene un regresor, que pasa si se adicionan
#más regresores mejoraría la predicción
model3 <- lm(air_time ~ carrier + distance + month + dep_time, data = flights_train)
predict3_train <- predict(model3, flights_train)
error3_train <- flights_train$air_time - predict3_train
evaluate_error(error3_train)

predict3_test <- predict(model3, flights_test)
error3_test <- flights_test$air_time - predict3_test
evaluate_error(error3_test)

#Curvas de densidad
plot(density(error2_test, na.rm = TRUE), 
     main = "Empirical distributions of out-of-sample errors")
lines(density(error3_test, na.rm = TRUE), lty = 2, col = "red")
legend("topright", legend = c("model2", "model3"), lty = c(1, 2),
       col = c("black", "red"), cex = 0.8, x.intersp = 0.6, y.intersp = 0.6)

#Montaje de un Regression Tree
#Supongase que queremos predecir la calidad diaria del OZono de acuerdo
#a la radiación solar, el promedio de la velocidad del viento y la máxima
#temperatura diaria
#Hay múltiple paquetes para algoritmos de árboles de decisión
#vamos usar party install.package("party")
model4 <- party::ctree(air_time ~ distance + month + dep_time,
                       data = subset(flights_train, !is.na(air_time)))
predict4_train <- predict(model4, flights_train)
error4_train <- flights_train$air_time - predict4_train[, 1]
evaluate_error(error4_train)

predict4_test <- predict(model4, flights_test)
error4_test <- flights_test$air_time - predict4_test[, 1]
evaluate_error(error4_test)

plot(density(error3_test, na.rm = TRUE),
     ylim = range(0, 0.06),
     main = "Empirical distributions of out-of-sample errors")
lines(density(error4_test, na.rm = TRUE), lty = 2)
legend("topright", legend = c("model3", "model4"),
       lty = c(1, 2), cex = 0.8,
       x.intersp = 0.6, y.intersp = 0.6)
