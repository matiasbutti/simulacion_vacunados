library(tidyverse)
library(lubridate)

deptos <- read_csv("deptos.csv", locale = locale(encoding = "windows-1252"))
glimpse(deptos)
unique(deptos$Provincia)

cant = 10000000
memory.size(max=1200000)
vacunas_vector <- c("anticovid_pfizer", "anticovid_moderna", "antigripal_sanofi", "hepatitisb_gsk" )
vacunas <- rep(vacunas_vector,each=cant/length(vacunas_vector))
lotes <- sample(c(111,222,333,444,555,666,777,888,999),cant, replace=TRUE)

#lugar <- sample(c("San Luis", "Catamarca", "La Rioja", "Buenos Aires", "CABA" ),cant, replace=TRUE)

lugares_pos <- round(runif(cant, 1, 527), digits=0)
pcia_ciudad <- deptos[lugares_pos, c(1,3)]
provincias<-pcia_ciudad[1]
ciudades<-pcia_ciudad[2]


fechas_rango <- (seq(ymd('2021-01-01'),ymd('2022-11-01'), by = '1 day'))
fechas <- sample(fechas_rango, cant, replace=TRUE)

dnis <- c(30000000: (30000000+cant-1))

fechas_nacimiento_rango <- (seq(ymd('1950-01-01'),ymd('2016-01-01'), by = '1 day'))
fechas_nacimiento <- sample(fechas_nacimiento_rango, cant, replace=TRUE)

sexo_al_nacer <- sample(c("M", "F" ),cant, replace=TRUE)

df <- data.frame(vacunas, lotes, provincias, ciudades, fechas, dnis, fechas_nacimiento, sexo_al_nacer)
glimpse(df)
write_csv(x = df, file = paste0("./", cant/1000000, "m.csv"))
