plot1 <- function() {
NEI <- readRDS("summarySCC_PM25.rds")
##Have total emissions from PM2.5 decreased in the 
##United States from 1999 to 2008? Using the base 
##plotting system, make a plot showing the total 
##PM2.5 emission from all sources for each of the 
##years 1999, 2002, 2005, and 2008.
EBY <- aggregate(Emissions~ year, NEI, sum)
png('plot1.png')
barplot(EBY$Emissions, names.arg=EBY$year, main="Total PM2.5 Emission from all County", xlab="Year", ylab="PM20 Emission in tons")
dev.off()
}
