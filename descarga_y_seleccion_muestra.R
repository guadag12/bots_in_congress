#Cargamos las librerias correspondientes
library("tidyverse")
library("ROAuth")
library("twitteR")

#Nos conectamos a R  - para esto tienen que tener creada la aplicación en TW (https://developer.twitter.com/)#
options(RCurlOptions = list( capath = system.file("CurlSSL", "cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE))
reqURL<-"https://api.twitter.com/oauth/request_token"
accessURL<-"https://api.twitter.com/oauth/access_token"
authURL<-"https://api.twitter.com/oauth/authorize"
consumerKey<-"XXXXXXXXXXXXXXXXXXXXXXXXX" #clave que se da cuando se genera la app individual en Twitter
consumerSecret<-"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" #Idem
access_token <- "XXXXXXXXXX-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
access_secret <- "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
setup_twitter_oauth(consumerKey, consumerSecret, access_token, access_secret)

#DESCARGA_2016
tmp.env <- new.env() #abrimos el espacio temporal
tmp.env$tweets.nm1 <- searchTwitter("#1MVamosJuntos", n=30000, since = "2016-03-01" ) #le pedimos a twitter que descargue 30000 tweets que mencionen "#Aperturadesesiones" desde el "01/03/2016"  
tweets.df1 <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#1MVamosJuntos") #guardamos los tweets en el archivo tweets.df1 y le agregamos la columna con el hashtag que le pedimos en la linea anterior
rm(tmp.env)  #cerramos el espacio temporal
save.image("~/Apertura/tweets_sesiones_2016.RData") #guardamos el data frame en un archivo RData

tmp.env <- new.env() #abrimos el espacio temporal
tmp.env$tweets.nm1 <- searchTwitter("#MacriEnElCongreso", n=30000, since = "2016-03-01" )
tweets.df2 <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#MacriEnElCongreso")
rm(tmp.env)  #cerramos el espacio temporal
save.image("~/Apertura/tweets_sesiones_2016.RData")

tmp.env <- new.env() #abrimos el espacio temporal
tmp.env$tweets.nm1 <- searchTwitter("#AsambleaLegislativa", n=30000, since = "2016-03-01" )
tweets.df3 <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#AsambleaLegislativa")
rm(tmp.env)  #cerramos el espacio temporal
save.image("~/Apertura/tweets_sesiones_2016.RData")

tmp.env <- new.env() #abrimos el espacio temporal
tmp.env$tweets.nm1 <- searchTwitter("#AperturaDeSesiones", n=30000, since = "2016-03-01" )
tweets.df4 <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#AperturaDeSesiones")
rm(tmp.env)  #cerramos el espacio temporal
save.image("~/Apertura/tweets_sesiones_2016.RData")

tmp.env <- new.env() #abrimos el espacio temporal
tmp.env$tweets.nm1 <- searchTwitter("#1M", n=30000, since = "2016-03-01" )
tweets.df5 <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#1M")
rm(tmp.env)  #cerramos el espacio temporal
save.image("~/Apertura/tweets_sesiones_2016.RData")

tmp.env <- new.env() #abrimos el espacio temporal
tmp.env$tweets.nm1 <- searchTwitter("#Macri", n=30000, since = "2016-03-01" )
tweets.df6 <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#Macri")
rm(tmp.env)  #cerramos el espacio temporal
save.image("~/Apertura/tweets_sesiones_2016.RData")

tmp.env <- new.env() #abrimos el espacio temporal
tmp.env$tweets.nm1 <- searchTwitter("#AlCongresoConMacri", n=30000, since = "2016-03-01" )
tweets.df7 <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#AlCongresoConMacri")
rm(tmp.env)  #cerramos el espacio temporal
save.image("~/Apertura/tweets_sesiones_2016.RData")

tmp.env <- new.env() #abrimos el espacio temporal
tmp.env$tweets.nm1 <- searchTwitter("#NuevoCongreso", n=30000, since = "2016-03-01" )
tweets.df8 <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#NuevoCongreso")
rm(tmp.env)  #cerramos el espacio temporal
save.image("~/Apertura/tweets_sesiones_2016.RData")

tmp.env <- new.env() #abrimos el espacio temporal
tmp.env$tweets.nm1 <- searchTwitter("#ArribaArgentina", n=30000, since = "2016-03-01" )
tweets.df9 <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#ArribaArgentina")
rm(tmp.env)  #cerramos el espacio temporal
save.image("~/Apertura/tweets_sesiones_2016.RData")

tmp.env <- new.env() #abrimos el espacio temporal
tmp.env$tweets.nm1 <- searchTwitter("#AperturaSesiones", n=30000, since = "2016-03-01" )
tweets.df10 <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#AperturaSesiones")
rm(tmp.env)  #cerramos el espacio temporal
save.image("~/Apertura/tweets_sesiones_2016.RData")
#agrupamos los tweets en un sólo df
tweets2016 <- rbind(tweets.df1, tweets.df2, tweets.df3, tweets.df4, tweets.df5,
                    tweets.df6, tweets.df7, tweets.df8, tweets.df9, tweets.df10)
#eliminamos duplicados
which.duplicates<-rownames(tweets2016[duplicated(tweets2016$id),])
tweets2016 <- tweets2016[-c(as.integer(which.duplicates)),]

write.csv(tweets2016, "tweets2016.csv", row.names = F)

#DESCARGA_2020

tmp.env <- new.env() #abrimos el espacio temporal
tmp.env$tweets.nm1 <- searchTwitter("#TodosconAlberto", n=30000, since = "2020-03-01")
tweets2020_a <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#TodosconAlberto")
rm(tmp.env)  #cerramos el espacio temporal
save.image("~/Apertura/tweets_sesiones_2020.RData")

tmp.env <- new.env() #abrimos el espacio temporal
tmp.env$tweets.nm1 <- searchTwitter("#Asamblealegislativa2020", n=30000,  since = "2020-03-01")
tweets2020_b <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#Asamblealegislativa2020")
rm(tmp.env)  #cerramos el espacio temporal
save.image("~/Apertura/tweets_sesiones_2020.RData")

tmp.env <- new.env() #abrimos el espacio temporal
tmp.env$tweets.nm1 <- searchTwitter("#AlbertoFernandez", n=30000, since = "2020-03-01" )
tweets2020_c <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#AlbertoFernandez")
rm(tmp.env)  #cerramos el espacio temporal
save.image("~/Apertura/tweets_sesiones_2020.RData")

tmp.env <- new.env()  #abrimos el espacio temporal
tmp.env$tweets.nm1 <- searchTwitter("#AbortoLegal2020", n=30000)
tweets2020_d <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#AbortoLegal2020")
rm(tmp.env)  #cerramos el espacio temporal
save.image("~/Apertura/tweets_sesiones_2020.RData")

tmp.env <- new.env()  #abrimos el espacio temporal
tmp.env$tweets.nm1 <- searchTwitter("#AperturaDeSesiones", n=30000)
tweets2020_e <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#AperturaDeSesiones")
rm(tmp.env)  #cerramos el espacio temporal
save.image("~/Apertura/tweets_sesiones_2020.RData")

#agrupamos los tweets en un sólo df
tweets2020 <- rbind(tweets2020_a, tweets2020_b, tweets2020_c
                    tweets2020_d, tweets2020_e)
#eliminamos duplicados
which.duplicates<-rownames(tweets2020[duplicated(tweets2020$id),])
tweets2020 <- tweets2020[-c(as.integer(which.duplicates)),]

write.csv(tweets2020, "tweets2020.csv", row.names = F) #Guardamos nuestro archivo final en un csv

