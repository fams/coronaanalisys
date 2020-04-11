
# Quarentena
# Italia  March 8
# SP e MG March 21
# NY      March 21


p = ggdeaths(paises,"") +
geom_vline(xintercept=7, color="orange", size=.5)  +
geom_vline(xintercept=14, color="orange", size=.5) +
geom_vline(xintercept=19, color="orange", size=.5) +
annotate(geom="text", x=7, y=8000,
             label="Qt Brasil", angle = 90) +
annotate(geom="text", x=14, y=8000,
             label="Qt Italia", angle = 90) +
annotate(geom="text", x=19, y=8000,
             label="Qt Eua", angle = 90)


