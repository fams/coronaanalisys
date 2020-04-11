

pkgLoad <- function( packages = "favourites" ) {

    if( length( packages ) == 1L && packages == "favourites" ) {
        packages <- c( "data.table", "chron", "plyr", "dplyr", "shiny",
                       "shinyjs", "parallel", "devtools", "doMC", "utils",
                       "stats", "microbenchmark", "ggplot2", "readxl",
                       "feather", "googlesheets", "readr", "DT", "knitr",
                       "rmarkdown", "Rcpp"
        )
    }

    packagecheck <- match( packages, utils::installed.packages()[,1] )

    packagestoinstall <- packages[ is.na( packagecheck ) ]

    if( length( packagestoinstall ) > 0L ) {
        utils::install.packages( packagestoinstall,
                             repos = "http://cran.csiro.au"
        )
    } else {
        print( "All requested packages already installed" )
    }

    for( package in packages ) {
        suppressPackageStartupMessages(
            library( package, character.only = TRUE, quietly = TRUE )
        )
    }

}

buildData = function(eedata,country,mincases) {
  cdata = eedata[ which(eedata$geoId == country),]
  cdata = cdata[order(cdata$year,cdata$month,cdata$day),1:7]
  cdata[,"cum_cases"] <- cumsum(cdata$cases)
  cdata[,"cum_deaths"] <- cumsum(cdata$deaths)
  cdata = cdata[which(cdata$cum_cases > mincases ),]
  cdata[,"start"] <- 1:nrow(cdata)
  return(cdata)
}

buildPaises <- function(dataset, limit , ...){
  cc <- list(...)
  dt <- list()
  for (c in cc) {
    ds = buildData(dataset, c, limit)
    dt = append(dt, list(ds))
  }
  return(rbindlist(dt))
}

ggcases <- function(mydata, title){
  p <-mydata %>%
    ggplot( aes(x=start, y=cum_cases, group=countriesAndTerritories, color=countriesAndTerritories)) +
    geom_line() +
    scale_y_continuous(trans='log10') +
    scale_color_viridis(discrete = TRUE) +
    ggtitle(title) +
    theme_ipsum() +
    ylab("Casos acumulados") + xlab("dias a partir do caso 100")
    return(p)
}
ggdeaths <- function(mydata, title){
  p <-mydata %>%
    ggplot( aes(x=start, y=cum_deaths, group=countriesAndTerritories, color=countriesAndTerritories)) +
    geom_line() +
    scale_y_continuous(trans='log10') +
    scale_color_viridis(discrete = TRUE) +
    ggtitle(title) +
    theme_ipsum() +
    ylab("Mortes acumuladas (log10)") + xlab("dias a partir do caso 100")
  return (p)
}
