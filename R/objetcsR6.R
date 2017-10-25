library(R6) 
Vehicle <- R6Class("Vehicle",  
                   public = list( 
                     name = NA, 
                     model = NA, 
                     initialize = function(name, model) { 
                       if (!missing(name)) self$name <- name 
                       if (!missing(model)) self$model <- model 
                     }, 
                     move = function(movement) { 
                       private$start() 
                       private$position <- private$position + movement 
                       private$stop() 
                     }, 
                     get_position = function() { 
                       private$position 
                     } 
                   ), 
                   private = list( 
                     position = 0, 
                     speed = 0, 
                     start = function() { 
                       cat(self$name, "is starting\n") 
                       private$speed <- 50 
                     }, 
                     stop = function() { 
                       cat(self$name, "is stopping\n") 
                       private$speed <- 0 
                     } 
                   )) 
car <- Vehicle$new(name = "Car", model = "A") 
car
car$get_position() 
car$move(10)
car$get_position() 

#Herencia
MeteredVehicle <- R6Class("MeteredVehicle", 
                          inherit = Vehicle, 
                          public = list( 
                            move = function(movement) { 
                              super$move(movement) 
                              private$distance <<- private$distance + abs(movement) 
                            }, 
                            get_distance = function() { 
                              private$distance 
                            } 
                          ), 
                          private = list( 
                            distance = 0 
                          )) 
bus <- MeteredVehicle$new(name = "Bus", model = "B") 
bus 
bus$get_position()
bus$move(10)
bus$get_position()
bus$move(-5)
bus$get_position()
