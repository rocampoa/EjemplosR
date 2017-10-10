
#Usando expresiones regulares
fruits <- readLines("fruits.txt")
#Todas las líneas que empienzan por carateres seguidos de : y números
matches <- grep("^\\w+:\\s\\d+$", fruits) 
fruits[matches]
#Todas las líneas que contienen números
grep("\\d", c("abc", "a12", "123", "1"))
#Todas las líneas que sólo tienen un dígito
grep("^\\d$", c("abc", "a12", "123", "1"))
#Todas las líneas que sólo tienen números
grep("^\\d+$", c("abc", "a12", "123", "1"))
#Usando grupos
matches <- str_match(fruits, "^(\\w+):\\s(\\d+)$")
matches
