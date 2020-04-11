ggcases <- function(mydata){
  mydata %>%
    ggplot( aes(x=start, y=cum_cases, group=countriesAndTerritories, color=countriesAndTerritories)) +
    geom_line() +
    scale_color_viridis(discrete = TRUE) +
    ggtitle("Casos a partir do centésimo") +
    theme_ipsum() +
    ylab("Casos acumulados") + xlab("dias a partir do caso 100") + scale_y_log10(labels = scales::comma)
}

Italia  March 8
SP e MG March 21
NY      March 21


p = ggdeaths(paises)
b <- p +
geom_vline(xintercept=7, color="orange", size=.5)  +
geom_vline(xintercept=14, color="orange", size=.5) +
geom_vline(xintercept=19, color="orange", size=.5) +
annotate(geom="text", x=7, y=8000,
             label="Quarentena Brasil", angle = 90) +
annotate(geom="text", x=14, y=8000,
             label="Quarentena Italia", angle = 90) +
annotate(geom="text", x=19, y=8000,
             label="Quarentena Eua", angle = 90)

b

annotate(geom="point", x=as.Date("2017-12-17"), y=20089, size=10, shape=21, fill="transparent") +
