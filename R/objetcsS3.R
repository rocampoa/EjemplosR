generic_head <- function(x, n) {
  UseMethod("generic_head")  
}


generic_head.default <- function(x, n) {
  x[1:n]
}

generic_head.data.frame <- funcion (x, n) {
  x[1:n, ]
}

generic_head(num_vec, 3)
generic_head(data_frame, 3)

#Creando una clase
product <- function(name, price, inventory) {
  #Chequeando condiciones en la generación del objeto
  stopifnot(is.character(name), length(name) == 1,
            is.numeric(price), length(price) == 1,
            is.numeric(inventory), length(inventory) == 1,
            price > 0, inventory >= 0)
  structure(list(name = name, 
                 price = price,
                 inventory = inventory),
            class = "product")
}

laptop <- product("Laptop", 499, 300)
typeof(laptop)
class(laptop)
laptop

#definiendo métodos
print.product <- function(x, ...) {
  cat("<product>\n")
  cat("name: ", x$name, "\n")
  cat("price: ", x$price, "\n")
  cat("inventory: ", x$inventory, "\n")
  invisible(x)
}
laptop

product("Basket", 150, -0.5)

cellphone <- product("Phone", 249, 12000)
products <- list(laptop, cellphone)
products

#Definiendo nuevos métodos genéricos

value <- function(x, ...) {
  UseMethod("value")
}

value.default <- function(x, ...) {
  stop("value is undefined")
}

value.product <- function(x, ...) {
  x$price * x$inventory
}

value(laptop)
value(cellphone)
sapply(products, value)
laptop$price <- laptop$price * 0.85
laptop

#Usando un atomic vector como estructura de datos subyacente
percent <- function(x) {
  stopifnot(is.numeric(x))
  class(x) <- c("percent", "numeric")
  x
}

pct <- percent(c(0.1, 0.05, 0.25, 0.23))
pct

as.character.percent <- function(x, ...) {
  paste0(as.numeric(x) * 100, "%")
}
as.character(pct)

format.percent <- function(x, ...) {
  as.character(x, ...)
}

format(pct)

print.percent <- function(x, ...) {
  print(format.percent(x), quote = FALSE)
}

pct + 0.2

sum.percent <- function(x, ...) {
  percent(NextMethod("sum"))
}

mean.percent <- function(x, ...) {
  percent(NextMethod("mean"))
}

max.percent <- function(x, ...) {
  percent(NextMethod("max"))
}

min.percent <- function(x, ...) {
  percent(NextMethod("min"))
}

c.percent <- function(x, ...) {
  percent(NextMethod("c"))
}

sum(pct)
mean(pct)
max(pct)
min(pct)
