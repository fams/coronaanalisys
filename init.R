source("./builddata.R")
pkgLoad(list("ggplot2","dplyr","viridis","magrittr","hrbrthemes","scales","data.table"))
data <- read.csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv", na.strings = "", fileEncoding = "UTF-8-BOM")
