buildData = function(eedata,country,mincases) {
  cdata = eedata[ which(eedata$geoId == country),]
  cdata = cdata[order(cdata$year,cdata$month,cdata$day),1:7]
  cdata[,"cum_cases"] <- cumsum(cdata$cases)
  cdata[,"cum_deaths"] <- cumsum(cdata$deaths)
  cdata = cdata[which(cdata$cum_cases > mincases ),]
  cdata[,"start"] <- 1:nrow(cdata)
  return(cdata)
}

plotcases <-function (lista){
  #plot pais1
  d1=lista[[1]]
  
  plot(d1$start, d1$cum_cases,
       main="Evolucao a partir do D0 do caso 100",
       ylab="Casos",
       type="l",
       col="blue",xlab="Dias a partir do caso 100")
  #plot pais2
  colors = c( "blue","red","green", "orange")
  index=1
  a_fill <- colors[index]
  a_names <- c(as.character(d1$countriesAndTerritories[1]))
  for (ds in lista) {
    if (index == 1){
      index=index+1
      next
    }
    lines(ds$start, ds$cum_cases, col=colors[index])
    a_names =append(a_names,as.character(ds$countriesAndTerritories[1]))
    a_fill= append(a_fill,colors[index])
    index=index+1
  }
  #plot legenda
  legend("topleft",
         a_names,
         fill=a_fill
  )
}
plotdeaths <-function (lista){
  #plot pais1
  d1=lista[[1]]
  
  plot(d1$start, d1$cum_deaths,
       main="Evolucao a partir do D0 do caso 100",
       ylab="Mortes",
       type="l",
       col="blue",xlab="Dias a partir do caso 100")
  #plot pais2
  colors = c( "blue","red","green", "orange")
  index=1
  a_fill <- colors[index]
  a_names <- c(as.character(d1$countriesAndTerritories[1]))
  for (ds in lista) {
    if (index == 1){
      index=index+1
      next
    }
    lines(ds$start, ds$cum_deaths, col=colors[index])
    a_names =append(a_names,as.character(ds$countriesAndTerritories[1]))
    a_fill= append(a_fill,colors[index])
    index=index+1
  }
  #plot legenda
  legend("topleft",
         a_names,
         fill=a_fill
  )
}