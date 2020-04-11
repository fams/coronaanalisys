

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
  cdata = cdata[order(cdata$year,cdata$month,cdata$day),1:10]
  cdata[,"cases_1000"] <- (cdata$cases /(cdata$popData2018 /1000))
  cdata[,"deaths_1000"] <- (cdata$deaths /(cdata$popData2018 /1000))
  cdata[,"cum_deaths_1000"] <- cumsum(cdata$deaths_1000)
  cdata[,"cum_cases_1000"] <- cumsum(cdata$cases_1000)
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


plotChart <- function(mydata, title,ylabel, trans, column){
  p <-mydata %>%
    ggplot( aes_string(x="start", y=column, group="countriesAndTerritories", color="countriesAndTerritories")) +
    geom_line() +
    scale_color_viridis(discrete = TRUE) +
    scale_y_continuous(trans=trans) +
    ggtitle(title) +
    ylab(ylabel) +
    xlab("dias a partir do caso 100")
    theme_ipsum()
  return (p)
}

