library(readr)
library(tidyverse)
library(ggplot2)

##Traemos los archivos con los que vamos a trabajar

tweets2016 <- read_csv("D:/Guada/sesiones2016/archivos_def/tweets2016.csv", 
                       locale = locale(encoding = "ISO-8859-1"))
tweets2020 <- read_csv("D:/Guada/sesiones2016/archivos_def/tweets2020.csv", 
                       locale = locale(encoding = "ISO-8859-1"))

### SELECCIONAMOS LOS USUARIOS PARTIENDO DE UNA MUESTRA ALEATORIA
#USUARIOS 2016
tweets2016_usuarios <- tweets2016 %>% distinct(screenName)#genermos un df con los usuarios ?nicos 
muestra_2016 <- sample(x = tweets2016_usuarios$screenName, size = 3500, replace = F) #seleccionamos aleatoriamente 3500 usuarios
muestra_2016 <- as.data.frame(muestra_2016)  #generamos un data frame
write.csv(muestra_2016, "muestra_2016.csv", row.names = F) #guardamos nuestra muestra en un csv para procesarlo en Python 

#USUARIOS 2020

tweets2020_usuarios <- tweets2020 %>% distinct(screenName) #genermos un df con los usuarios ?nicos 
muestra_2020 <- sample(x = tweets2020_usuarios$screenName, size = 3500, replace = F) #seleccionamos aleatoriamente 3500 usuarios
muestra_2020 <- as.data.frame(muestra_2020) #generamos un data frame
write.csv(muestra_2020, "muestra_2020.csv", row.names = F) #guardamos nuestra muestra en un csv para procesarlo en Python 
