#Encontrando raíces
#x^2+x-2=0
print(polyroot(c(-2, 1,1)))
#X^2 + 1 = 0
print(polyroot(c(1, 0, 1)))
# x^3 - x^2 -2x - 1 
print(polyroot(c(-1, -2, -1, 1)))
cat("Prueba --------------")
r <- polyroot(c(-1, -2, -1, 1))
print(round(r^3 - r^2 - 2 * r - 1, 8))

# raíces de la ecuación x^2 - e^x = 0
print(uniroot(function(x) x^2 - exp(x), c(-2, 1)))

#A more complex e^x - 3e^(-x^2 +x) + 1 en rango -2,  2
#Sólo es capaz de encontrar una raíz a la vez
f <- function(x) {exp(x) - 3 * exp(-x^2 + x) + 1}
print(uniroot(f, c(-2, 0))$root) 
r <- uniroot(f, c(-2, 0))$root
print(uniroot(f, c(0, 2))$root)
print(round(exp(r) - 3 * exp(-r^2 + r) + 1))

#Derivadas
print(D(quote(x^2), "x"))
print(D(quote(sin(x) * cos(x * y)), "x"))
z <- D(quote(sin(x) * cos(x * y)), "x")
print(eval(z, list(x = 1, y = 2)))