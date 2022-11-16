library(tidyverse)
library(lubridate)

cant = 10000000

vacunas <- rep(c("anticovid_pfizer", "anticovid_moderna", "antigripal_sanofi", "hepatitisb_gsk" ),each=cant/4)
lotes <- rep(c(111,222,333,444,555,666,777,888,999),cant, replace=TRUE)
lugar <- sample(c("San Luis", "Catamarca", "La Rioja", "Buenos Aires", "CABA" ),cant, replace=TRUE)
fechas_rango <- (seq(ymd('2021-01-01'),ymd('2022-11-01'), by = '1 day'))
fechas <- sample(fechas_rango, cant, replace=TRUE)

dnis <- c(30000000: (30000000+cant-1))

fechas_nacimiento_rango <- (seq(ymd('1950-01-01'),ymd('2016-01-01'), by = '1 day'))
fechas_nacimiento <- sample(fechas_nacimiento_rango, cant, replace=TRUE)

sexo_al_nacer <- sample(c("M", "F" ),cant, replace=TRUE)

df <- data.frame(vacunas, lotes, lugar, fechas, dnis)
glimpse(df)
write_csv(x = df, file = paste0("./", cant/1000000, "m.csv"))
