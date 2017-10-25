#A diferencia de S3, S4 requiere una definición formal de clases y métodos

validate_product <- function(object) { 
  errors <- c( 
    if (length(object@name) != 1)   
      "Length of name should be 1"  
    else if (is.na(object@name))  
      "name should not be missing value", 
    
    if (length(object@price) != 1)  
      "Length of price should be 1" 
    else if (is.na(object@price))  
      "price should not be missing value" 
    else if (object@price <= 0)  
      "price must be positive", 
    
    if (length(object@inventory) != 1)  
      "Length of inventory should be 1" 
    else if (is.na(object@inventory)) 
      "inventory should not be missing value" 
    else if (object@inventory < 0)  
      "inventory must be non-negative") 
  if (length(errors) == 0) TRUE else errors 
} 


setClass("Product",  
          representation(name = "character",  
                         price = "numeric",  
                         inventory = "integer"), 
          prototype(name = "Unnamed",  
                    price = NA_real_, inventory = 0L), 
          validity = validate_product) 

laptop <- new("Product", name = "Laptop-A", price = 299, inventory = 100L)

#Como no es una lista no se usa $ se usa @
laptop@price * laptop@inventory
laptop


#Herencia
setClass("Container",
         representation(volume = "numeric"),
         contains = "Product")
bottle <- new("Container", name = "Bottle", price = 3, inventory = 100L, volume = 15)
bottle

#Definiendo funciones genéricas
setClass("Shape")
setClass("Polygon",
         representation(sides = "integer"),
         contains = "Shape")
setClass("Triangle",
         representation(a = "numeric", b = "numeric", c = "numeric"),
         prototype(a = 1, b = 1, c = 1, sides = 3L),
         contains = "Polygon")
setClass("Rectangle", 
         representation(a = "numeric", b = "numeric"), 
         prototype(a = 1, b = 1, sides = 4L), 
         contains = "Polygon") 
setClass("Circle", 
         representation(r = "numeric"), 
         prototype(r = 1, sides = Inf), 
         contains = "Shape") 

setGeneric("area", function(object){
  standardGeneric("area")
}, valueClass = "numeric")

setMethod("area", signature("Triangle"), function(object) {
  a <- object@a
  b <- object@b
  c <- object@c
  s <- (a + b + c) / 2
  sqrt(s * (s -a) * (s - b) * (s- c))
})
setMethod("area", signature("Rectangle"), function(object) { 
  object@a * object@b 
}) 
setMethod("area", signature("Circle"), function(object) { 
  pi * object@r ^ 2 
}) 

triangle <- new("Triangle", a = 3, b = 4, c = 5)
area(triangle)
circle <- new("Circle", r = 3) 
area(circle) 
