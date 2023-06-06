# Simón Cortázar Alba - 202020930 - Version 4.2.1

rm(list=ls())
require(pacman)
p_load(rio, tidyverse, data.table)


# 1. Lista de archivos en input.

      anhos <- c(seq(2019, 2021, 1))
      meses <- c("Enero.csv", "Febrero.csv", "Marzo.csv", "Abril.csv", "Mayo.csv","Junio.csv",
                 "Julio.csv", "Agosto.csv", "Septiembre.csv", "Octubre.csv",
                 "Noviembre.csv", "Diciembre.csv")
      
      path <- c()
      
      for (x in anhos) {
        
        for (y in meses) {
            
          path <-  append(path,paste0(x,"/",y))
          
      }
      }
      
      file_names <- list()
      
      for (i in path){
        
        file_names[i] <- as.data.frame(list.files(paste0("input/",i), full.name=T))
        
      }
      
       file_names <- unlist(file_names)
       file_names
      
      # Notemos que file_names contiene el vector con todos los nombres de los archivos de la carpeta input.

 
 # 1.2 & 1.3 
  # Importamos archivos que contengan Resto - Características generales (Personas)
  # Combinamos todos los datos en un solo data frame
    
         
  # Primero Filtramos el vector
       
    file_names <- file_names[grep("(Personas)", file_names)]
    file_names <- file_names[grep("Resto", file_names)]
    print(file_names)                                         # Notemos que hicimos el punto 1.2 y 1.3 en estas cuatro lineas de código
    cg <- import_list(file_names[], rbind = TRUE)   
    
    
  # Presentamos tabla de frecuencias de la variable mes
    
    
    tabla <- table(cg$MES)
    print(tabla)
    tabla <- as.data.frame(tabla) # La convertimos en data frame para exportarla en formato xlsx
    tabla <- tabla %>% 
      rename(Mes=Var1) %>% 
      export("output/tabla_frecuencia.xlsx")
      
       
       



