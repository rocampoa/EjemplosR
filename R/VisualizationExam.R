plot(1:10)
x <- rnorm(100)
y <- 2 * x + rnorm(100)
plot(x, y)
plot(x, y, main = "Linearly correlated random numbers",
     xlab = "x", ylab = "2x + noise",
     xlim = c(-4, 4), ylim = c(-4, 4))

#Por defecto los graficos de dispersión se muestran con círculos
#pero se puede espeficicar otro caracter
plot(0:25, 0:25, pch = 0:25,
     xlim = c(-1, 26), ylim = c(-1, 26),
     main = "Point styles (pch)")
text(0:25+1, 0:25, 0:25)
plot(x, y, pch = 16,
     main = "Scatter plot with customized point style")

#A veces se necesita distinguir los puntos dependiente de una condición
plot(x, y,
     pch = ifelse(x * y > 1, 16, 1),
     main = "Scatter plot with conditional point styles")

# se pueden dibujar puntos de dos datasets separados compartiendo
#el mismo eje X

z <- sqrt(1 + x ^ 2) + rnorm(100)
plot(x, y, pch = 1, xlim = range(x), ylim = range(y, z),
     xlab = "X", ylab = "value")
points(x, z, pch = 17)
title("Scatter plot with two series")


#Personalizando el color de los puntos
plot(x, y, pch = 16, col = "blue",
     main = "Scatter plot with blue points")

plot(x, y, pch = 16, 
     col = ifelse(y >= mean(y), "red", "green"),
     main = "Scatter plot with conditional colors")

plot(x, y, col = "blue", pch = 0,
     xlim = range(x), ylim = range(y, z),
     xlab = "x", ylab = "value")
points(x, z, col = "red", pch = 1)
title("Scatter plot with two series")

#Creando dibujos de líneas, básicamente se usa plot con type = 1
t <- 1:50
y <- 3 * sin(t * pi / 60) + rnorm(t)
plot(t, y, type = "l", main = "Simple line plot")

#Personalizando el tipo de línea y el ancho
lty_values <- 1:6
plot(lty_values, type = "n", axes = FALSE, ann = FALSE)
abline(h = lty_values, lty = lty_values, lwd = 2,
       mtext(lty_values, side = 2, at = lty_values))
title("Line types (lty)")

plot(t, y, type = "l", lwd = 2)
abline(h = mean(y), lty = 2, col = "blue")
abline(h = range(y), lty = 3, col = "red")
abline(v = t[c(which.min(y), which.max(y))], lty = 3, col = "darkgray")
title("Line plot with auxiliary lines")

#Dibujando líneas en múltiples períodos
p <- 40
plot(t[t <= p], y[t <= p], type = "l", xlim = range(t),
     xlab = "t", col = "green")
lines(t[t >= p], y[t >= p], lty = 2, col = "red")
title("Simple line plot with two periods")

#Trazar líneas con puntos
plot(y, type = "l")
points(y, pch = 16)
title("Line with Points")

#Multiseries chart with a legend
x <- 1:30
y <- 2 * x + 6 * rnorm(30)
z <- 3 * sqrt(x) + 8 * rnorm(30)
plot(x, y, type = "l", ylim = range(y, z), col = "black")
points(y, pch = 15)
lines(z, lty = 2, col = "blue")
points(z, pch = 16, col = "blue")
title("plot of two series")
legend("topleft", legend = c("y", "z"), col = c("black", "blue"),
       lty = c(1, 2), pch = c(15, 16), cex = 0.8,
       x.intersp = 0.5, y.intersp = 0.8)

#Lineas de paso
plot(x, y, type = "s", main = "A Simple step plot")

#Diagramas de códigos de barras
barplot(1:10, names.arg = LETTERS[1:10])

data("flights", package = "nycflights13")
carriers <- table(flights$carrier)
sorted_carriers <- sort(carriers, decreasing = TRUE)
barplot(head(sorted_carriers, 8), ylim = c(0, max(sorted_carriers) * 1.1),
        xlab = "Carrier", ylab = "Flights", 
        main = "Top 8 carriers with the most flights in record")

#Creando pie charts
grades <- c(A = 2, B = 10, C = 12, D = 8)
pie(grades, main = "Grades", radius = 1)

#Histogramas y diagramas de densidad
random_normal <- rnorm(10000)
hist(random_normal)
hist(random_normal, probability = TRUE, col = "lightgray")
curve(dnorm, add = TRUE, lwd = 2, col = "blue")

#Ahora un histograma de la velocidad de una aeronave en vuelo
flight_speed <- flights$distance / flights$air_time
hist(flight_speed, main = "Histogram of flight speed")
#utilizamos density para estimar una distribución empírica de velocidad
plot(density(flight_speed, from = 2, na.rm = TRUE),
     main = "Empirical distribution of flight speed")
abline(v = mean(flight_speed, na.rm = TRUE), col = "blue", lty = 2)

#Combinando todo en un solo gráfico
hist(flight_speed, probability = TRUE, ylim = c (0, 0.5),
     main = "Histogram and empirical distribution of flight speed",
     border = "black", col = "lightgray")
lines(density(flight_speed, from = 2, na.rm = TRUE), col = "red", lwd = 2)
abline(v = mean(flight_speed, na.rm = TRUE), col = "blue", lty = 2)

#Diagrama de cajas
x <- rnorm(1000)
boxplot(x)

