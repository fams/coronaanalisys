buildData = function(eedata,country) {
  cdata = eedata[ which(eedata$geoId == country),]
  cdata=cdata[order(cdata$year,cdata$month,cdata$day),2:6]
  cdata[,"cum_cases"] <- cumsum(cdata$cases)
  cdata[,"cum_deaths"] <- cumsum(cdata$deaths)
  return(cdata)
}