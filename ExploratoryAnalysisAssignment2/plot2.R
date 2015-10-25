plot2 <- function() {
  NEI <- readRDS("summarySCC_PM25.rds")
##  Have total emissions from PM2.5 decreased in the 
##  Baltimore City, Maryland (fips == "24510") from 1999 
##  to 2008? Use the base plotting system to make a plot 
##  answering this question.
  DF <- split(NEI, as.factor(NEI$fips))
  EBY <- aggregate(Emissions~ year, DF$'24510', sum)
  png('plot2.png')
  barplot(EBY$Emissions, names.arg=EBY$year, main="Total PM2.5 Emission from Baltimore", xlab="Year", ylab="PM20 Emission in tons")
  dev.off()
  }