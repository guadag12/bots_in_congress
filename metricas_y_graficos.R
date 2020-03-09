#cargamos las librerias que vamos a necesitar
library(tidyverse)
library(sqldf)

#METRICAS Y GRAFICOS P/ 2016
sesion2016 <- read.csv("D:/Guada/sesiones2016/archivos_def/muestra_2016_procesada.csv")
tweets2016 <- read.csv("D:/Guada/sesiones2016/archivos_def/tweets2016.csv")
names(sesion2016)[2] <- "score" #Cambiamos el nombre de la segunda columna 
sesion2016 <- sesion2016 %>% drop_na() #eliminamos los usuarios que fueron eliminados o dejaron de existir
sesion2016$screenName <- gsub(x= sesion2016$screenName, pattern = "[']", replacement = "") #eliminamos las '' de los usuarios

data_2016 <- left_join(sesion2016, tweets2016) #hacemos un join con "tweets2016" xq nos interesa la columna "hashtag"
data_2016 <- data_2016[, c(1:2,18)] #subseteamos y nos quedamos con las columnas que nos interesan

data_2016 <- sqldf("SELECT * FROM data_2016
                  GROUP BY screenName") #nos quedamos con los usuarios únicos

data_2016 <- data_2016 %>% mutate(BOTNOT = case_when( #asignamos mediante case_when() la categoria "BOT", "BOTNOT", "NA" según el puntaje asignado en el archivo Botometer.ipynb
  score < 0.6 ~ "BOTNOT", 
  score >= 0.6 ~ "BOT",
  TRUE ~ "NA"
))     
data_2016 <- data_2016 %>% filter(BOTNOT != "NA") #volvemos a chequear que no haya NA's en la columna BOTNOT
data_2016 <- data_2016 %>% filter(hashtag != "NA")#volvemos a chequear que no haya NA's en # 

data_2016 %>%                     #sacamos metricas para conocer '%' de bots en la conversación
  group_by(BOTNOT) %>%
  summarize(cantidad = n(), 
            porcentaje = paste0(round(cantidad/2600*100,2),'%'))

#Hacemos un scatterplot p/ 2016 (S/ diferenciar hashtags)
ggplot(data_2016, aes( y = score, x = screenName)) + 
  geom_point(color = "#F5CE1E") +
  geom_hline(yintercept = 0.6, color = "#493B8E") +
  labs(title = "Sesiones 2016 - Detección de bots", subtitle = "> 0.6 mayor probabilidad de que la cuenta sea un bot", 
       caption = "Muestra de 2600 usuarios que twittearon sobre la apertura de las sesiones 2016. 
       Realizado con Botometer (https://botometer.iuni.iu.edu/#!/)") +
  ylab(label = "Probabilidad") +
  xlab(label = "Usuarios") +
  theme(axis.text.x = element_blank())



#Hacemos un scatterplot p/ 2016 (diferenciando hashtags)
ggplot(data_2016, aes( y = score, x = screenName)) + 
  geom_point(color = "#F5CE1E") +
  geom_hline(yintercept = 0.6, color = "#493B8E") +
  labs(title = "Sesiones 2016 - Detección de bots", subtitle = "> 0.6 mayor probabilidad de que la cuenta sea un bot", 
       caption = "Muestra de 2600 usuarios que twittearon sobre la apertura de las sesiones 2016.
       Realizado con Botometer (https://botometer.iuni.iu.edu/#!/)") +
  ylab(label = "Probabilidad") +
  xlab(label = "Usuarios") +
  facet_wrap(~ hashtag, ncol= 2) +
  theme(axis.text.x = element_blank())

write.csv(data_2016, "archivo_final_2016.csv", row.names = F)

#METRICAS Y GRAFICOS P/ 2020
sesion2020 <- read_csv("D:/Guada/sesiones2016/archivos_def/muestra_2020_procesada.csv", #Traemos el archivo terminado para 2016
)
tweets2020 <- read.csv("D:/Guada/sesiones2016/archivos_def/tweets2020.csv")
names(sesion2020)[2] <- "score" #Cambiamos el nombre de la segunda columna 
sesion2020 <- sesion2020 %>% drop_na() #eliminamos los usuarios que fueron eliminados o dejaron de existir
sesion2020$screenName <- gsub(x= sesion2020$screenName, pattern = "[']", replacement = "") #eliminamos las '' de los usuarios

data_2020 <- left_join(sesion2020, tweets2020) #hacemos un join con "tweets2020" xq nos interesa la columna "hashtag"
data_2020 <- data_2020[, c(1:2,18)] #subseteamos y nos quedamos con las columnas que nos interesan

data_2020 <- sqldf("SELECT * FROM data_2020
                  GROUP BY screenName") #nos quedamos con los usuarios únicos

data_2020 <- data_2020 %>% mutate(BOTNOT = case_when( #asignamos mediante case_when() la categoria "BOT", "BOTNOT", "NA" según el puntaje asignado en el archivo Botometer.ipynb
  score < 0.6 ~ "BOTNOT", 
  score >= 0.6 ~ "BOT",
  TRUE ~ "NA"
))     
data_2020 <- data_2020 %>% filter(BOTNOT != "NA") #volvemos a chequear que no haya NA's en la columna BOTNOT
data_2020 <- data_2020 %>% filter(hashtag != "NA")#volvemos a chequear que no haya NA's en # 

data_2020 %>%                     #sacamos metricas para conocer '%' de bots en la conversación
  group_by(BOTNOT) %>%
  summarize(cantidad = n(), 
            porcentaje = paste0(round(cantidad/3500*100,2),'%'))

#Hacemos un scatterplot p/ 2020 (S/ diferenciar hashtags)
ggplot(data_2020, aes( y = score, x = screenName)) + 
  geom_point(color = "#F5CE1E") +
  geom_hline(yintercept = 0.6, color = "#493B8E") +
  labs(title = "Sesiones 2020 - Detección de bots", subtitle = "> 0.6 mayor probabilidad de que la cuenta sea un bot", 
       caption = "Muestra de 3500 usuarios que twittearon sobre la apertura de las sesiones 2020. 
       Realizado con Botometer (https://botometer.iuni.iu.edu/#!/)") +
  ylab(label = "Probabilidad") +
  xlab(label = "Usuarios") +
  theme(axis.text.x = element_blank())



#Hacemos un scatterplot p/ 2020 (diferenciando hashtags)
ggplot(data_2020, aes( y = score, x = screenName)) + 
  geom_point(color = "#F5CE1E") +
  geom_hline(yintercept = 0.6, color = "#493B8E") +
  labs(title = "Sesiones 2020 - Detección de bots", subtitle = "> 0.6 mayor probabilidad de que la cuenta sea un bot", 
       caption = "Muestra de 3500 usuarios que twittearon sobre la apertura de las sesiones 2020.
       Realizado con Botometer (https://botometer.iuni.iu.edu/#!/)") +
  ylab(label = "Probabilidad") +
  xlab(label = "Usuarios") +
  facet_wrap(~ hashtag, ncol= 2) +
  theme(axis.text.x = element_blank())

write.csv(data_2020, "archivo_final_2020.csv", row.names = F)
