Analise sem qualquer tipo de conhecimento em epidemiologia usando R.
====================================================================

``` r
source("./init.R")
```

    ## [1] "All requested packages already installed"

Essas gráficos comparativos normalizam o curso da epidemia considerando
um D0 comum. Usei o critério de 100 casos confirmados para o D0 da
epidemia, porque 100? porque sim. não leu o título?

As linhas laranja do gráfico mostram o dia em que o país entrou
majoritariamente em quarentena e tem objetivo de verificar qual a
influência da Quarentena nas curvas.

Qualquer erro ou deslise na análise é de responsabilidade de queme está
lendo, não sou epidemiologista. :-P

### Datas de quarentena consideradas (fonte ruim, wikipedia)

| Pais          | Data     | Dia Normalizado |
|---------------|:---------|-----------------|
| Africa do Sul | 27/Março | 08              |
| Argentina     | 20/Março | 01              |
| Brasil        | 21/Março | 07              |
| EUA           | 21/Março | 19              |
| Italia        | 08/Março | 14              |
| India         | 24/Março | 08              |

Abaixo estão os dados de Casos a partir do centésimo caso comparando Brasil, EUA, Italia, e Suécia
--------------------------------------------------------------------------------------------------

``` r
#data <- read.csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv", na.strings = "", fileEncoding = "UTF-8-BOM")

plist <- buildPaises(data,100, "BR","US","IT","SE")
plotChart(plist,"Casos a partir do caso 100","Casos (log10)","log10","cum_cases") +
geom_vline(xintercept=7, color="orange", size=.5)  +
geom_vline(xintercept=14, color="orange", size=.5) +
geom_vline(xintercept=19, color="orange", size=.5) +
annotate(geom="text", x=7, y=80000,
             label="Qt Brasil", angle = 90) +
annotate(geom="text", x=14, y=80000,
             label="Qt Italia", angle = 90) +
annotate(geom="text", x=19, y=80000,
             label="Qt Eua", angle = 90)
```

![](readme_files/figure-markdown_github/unnamed-chunk-8-1.png)

Dados de Mortes a partir do centésimo caso comparando Brasil, EUA, Italia, e Suécia
-----------------------------------------------------------------------------------

``` r
#data <- read.csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv", na.strings = "", fileEncoding = "UTF-8-BOM")

plist <- buildPaises(data,100, "BR","US","IT","SE")
plotChart(plist,"Mortes a partir do caso 100","Mortes (log10)","log10","cum_deaths") +
geom_vline(xintercept=7, color="orange", size=.5)  +
geom_vline(xintercept=14, color="orange", size=.5) +
geom_vline(xintercept=19, color="orange", size=.5) +
annotate(geom="text", x=7, y=8000,
             label="Qt Brasil", angle = 90) +
annotate(geom="text", x=14, y=8000,
             label="Qt Italia", angle = 90) +
annotate(geom="text", x=19, y=8000,
             label="Qt Eua", angle = 90)
```

    ## Warning: Transformation introduced infinite values in continuous y-axis

![](readme_files/figure-markdown_github/unnamed-chunk-9-1.png) \#\#
Dados de Casos por 1000 habitantes a partir do centésimo caso comparando
Brasil, EUA, Italia, e Suécia

``` r
plist <- buildPaises(data,100, "BR","US","IT","SE")
plotChart(plist,"Casos a partir do caso 100 (casos/1000 hab)","Casos por 1000/hab","identity","cum_cases_1000") +
geom_vline(xintercept=7, color="orange", size=.5)  +
geom_vline(xintercept=14, color="orange", size=.5) +
geom_vline(xintercept=19, color="orange", size=.5) +
annotate(geom="text", x=7, y=2,
             label="Qt Brasil", angle = 90) +
annotate(geom="text", x=14, y=2,
             label="Qt Italia", angle = 90) +
annotate(geom="text", x=19, y=2,
             label="Qt Eua", angle = 90)
```

![](readme_files/figure-markdown_github/unnamed-chunk-10-1.png) \#\#
Dados de Mortes por 1000 habitantes a partir do centésimo caso
comparando Brasil, EUA, Italia, e Suécia

``` r
plist <- buildPaises(data,100, "BR","US","IT","SE")
plotChart(plist,"Mortes a partir do caso 100 (mortes/1000 hab)","Mortes por 1000/hab","identity","cum_deaths_1000") +
geom_vline(xintercept=7, color="orange", size=.5)  +
geom_vline(xintercept=14, color="orange", size=.5) +
geom_vline(xintercept=19, color="orange", size=.5) +
annotate(geom="text", x=7, y=0.33,
             label="Qt Brasil", angle = 90) +
annotate(geom="text", x=14, y=0.33,
             label="Qt Italia", angle = 90) +
annotate(geom="text", x=19, y=0.33,
             label="Qt Eua", angle = 90)
```

![](readme_files/figure-markdown_github/unnamed-chunk-11-1.png)

Comparativo com outros países terceiro mundistas
================================================

Abaixo estão os dados de Casos a partir do centésimo caso comparando Brasil, India, Africa do Sul, e Argentina
--------------------------------------------------------------------------------------------------------------

``` r
#data <- read.csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv", na.strings = "", fileEncoding = "UTF-8-BOM")
plist <- buildPaises(data,100, "BR","IN","ZA","AR")

plotChart(plist,"Casos a partir do caso 100","Casos (log10)","log10","cum_cases") +
geom_vline(xintercept=7, color="orange", size=.5)  +
geom_vline(xintercept=1, color="orange", size=.5) +
geom_vline(xintercept=8, color="orange", size=.5) +
annotate(geom="text", x=7, y=4000,
             label="Qt Brasil", angle = 90) +
annotate(geom="text", x=1, y=4000,
             label="Qt Argentina", angle = 90) +
annotate(geom="text", x=8, y=4000,
             label="Qt India", angle = 90) +
annotate(geom="text", x=8, y=4000,
             label="Qt Africa do Sul", angle = 90)
```

![](readme_files/figure-markdown_github/unnamed-chunk-12-1.png)

Dados de Mortes a partir do centésimo caso comparando Brasil, India, Africa do Sul, e Argentina
-----------------------------------------------------------------------------------------------

``` r
#data <- read.csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv", na.strings = "", fileEncoding = "UTF-8-BOM")
plist <- buildPaises(data,100, "BR","IN","ZA","AR")
plotChart(plist,"Mortes a partir do caso 100","Mortes (log10)","log10","cum_deaths") +
geom_vline(xintercept=7, color="orange", size=.5)  +
geom_vline(xintercept=1, color="orange", size=.5) +
geom_vline(xintercept=8, color="orange", size=.5) +
annotate(geom="text", x=7, y=4000,
             label="Qt Brasil", angle = 90) +
annotate(geom="text", x=1, y=4000,
             label="Qt Argentina", angle = 90) +
annotate(geom="text", x=8, y=4000,
             label="Qt India", angle = 90) +
annotate(geom="text", x=8, y=4000,
             label="Qt Africa do Sul", angle = 90)
```

![](readme_files/figure-markdown_github/unnamed-chunk-13-1.png) \#\#
Dados de Casos por 1000 habitantes a partir do centésimo caso comparando
Brasil, India, Africa do Sul, e Argentina

``` r
plist <- buildPaises(data,100, "BR","IN","ZA","AR","MX")
plotChart(plist,"Casos a require(nCov2019)
require(dplyr)partir do caso 100 (casos/1000 hab)","Casos por 1000/hab","identity","cum_cases_1000") +
geom_vline(xintercept=7, color="orange", size=.5)  +
geom_vline(xintercept=1, color="orange", size=.5) +
geom_vline(xintercept=8, color="orange", size=.5) +
annotate(geom="text", x=7, y=0.12,
             label="Qt Brasil", angle = 90) +
annotate(geom="text", x=1, y=0.12,
             label="Qt Argentina", angle = 90) +
annotate(geom="text", x=8, y=0.12,
             label="Qt India", angle = 90) +
 annotate(geom="text", x=8, y=0.12,
             label="Qt Africa do Sul", angle = 90)
```

![](readme_files/figure-markdown_github/unnamed-chunk-14-1.png) \#\#
Dados de Mortes por 1000 habitantes a partir do centésimo caso
comparando Brasil, India, Africa do Sul, e Argentina

``` r
plist <- buildPaises(data,100, "BR","IN","ZA","AR", "MX")
plotChart(plist,"Mortes a partir do caso 100 (mortes/1000 hab)","Mortes por 1000/hab","identity","cum_deaths_1000") +
geom_vline(xintercept=7, color="orange", size=.5)  +
geom_vline(xintercept=1, color="orange", size=.5) +
geom_vline(xintercept=8, color="orange", size=.5) +
annotate(geom="text", x=7, y=0.008,
             label="Qt Brasil", angle = 90) +
annotate(geom="text", x=1, y=0.008,
             label="Qt Argentina", angle = 90) +
annotate(geom="text", x=8, y=0.008,
             label="Qt India", angle = 90) +
 annotate(geom="text", x=8, y=0.008,
             label="Qt Africa do Sul", angle = 90)
```

![](readme_files/figure-markdown_github/unnamed-chunk-15-1.png)
