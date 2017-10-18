#Ejemplos de lectura y escritura de archivos
#Se debe instalar el paquete readr (Facilita la lectura de archivos)
#install.packages("readr"), funciona mejor que las que ya vienen predefinidas
#También se puede utilizar la herramienta de importación de RStudio, pero no es recomendada
#por que no queda genérico.

#Utilizando la funció predefinida, lee el archivo y almacena cada línea como elemento de un vector
readLines("data/File.csv")
#Si solo quiero leer las primeras 2 líneas del archivo
readLines("data/File.csv", n = 2)
#readLines es demasiados simple, utilizando read.csv(), retorna un dataFrame
person1 <- read.csv("data/File.csv", stringsAsFactors = FALSE)
person1

#Especificando clases y nombres de columnas
person2 <- read.csv("data/File.csv", colClasses = c("character", "factor","integer", "character"), col.names = c("name", "sex", "age", "major"), stringsAsFactors = FALSE)
person2

#Por algunas razones read.* tienen algunas inconsistencias, utilizar el paquete readr
person3 <- readr::read_csv("data/file.csv")
person3

#ESto genera error porque no son uniformes los espacios
read.table("data/Person.txt", sep = " ")
#Este funciona bien, la función es inteligente
person3 <- readr::read_table("data/Person.txt")

#Creando un archivo
some_data <- data.frame(
  id = 1:4,
  grade = c("A", "A", "B", NA),
  width = c(1.51, 1.52, 1.46, NA),
  check_date = as.Date(c("2016-03-05", "2016-03-06", "2016-03-10", "2016-03-11"))
)
some_data
write.csv(some_data, "data/some_data.csv")
cat(readLines("data/some_data.csv"), sep = "\n")

#Leyendo y escribiendo archivos de Excel
#Importar la librería readxl install.packages("readxl")
readxl::read_excel("data/Prices.xlsx")

#Otra librería que permite leer, escribir y editar los archivos en excel
#es openxlsx
openxlsx::read.xlsx("data/Prices.xlsx", detectDates = TRUE)
openxlsx::write.xlsx(some_data, "data/somedata.xlsx")

#Grabar y leer objetos en formato nativo
saveRDS(some_data, "data/some_data.rds")
some_data2 <- readRDS("data/some_data.rds")
some_data2
identical(some_data, some_data2)

#Ejemplo para probar eficiencia en performance y espacio del
#formato nativo y el csv.
rows <- 200000
large_data <- data.frame(id = 1:rows, x = rnorm(rows), y = rnorm(rows))
system.time(write.csv(large_data, "data/large_data.csv"))
system.time(saveRDS(large_data, "data/large_data.rds"))
system.time(read.csv("data/large_data.csv"))
system.time(readr::read_csv("data/large_data.csv"))
system.time(readRDS("data/large_data.rds"))
