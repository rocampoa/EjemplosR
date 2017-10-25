library(RJDBC)
drv <- JDBC("oracle.jdbc.OracleDriver", classPath = "C:/Users/Rafael/.DataGrip2017.2/config/jdbc-drivers/Oracle/12.1.0.2/ojdbc6-12.1.0.2.jar")
con <- dbConnect(drv, "jdbc:oracle:thin:@//localhost:1521/pdbrocampo", "rocampo", "rocampo")
d <- dbGetQuery(con, "Select SysDate From Dual")
consolidado <- dbGetQuery(con, "Select * From Consolidado_ICA where rownum < 20")
head(consolidado, 3)
nrow(consolidado)

#Trayendo datos por pedazos
res <- dbSendQuery(con, "Select * From Consolidado_Ica Where rownum < 300")
chunk <- NULL
while (!dbHasCompleted(res)) {
  chunk <- dbFetch(res, 100)
  print(nrow(chunk), " records fetched\n")
}
dbClearResult(res)
dbDisconnect(con)
chunk
