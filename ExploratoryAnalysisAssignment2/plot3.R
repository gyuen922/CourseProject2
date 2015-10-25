plot3 <- function() {
  NEI <- readRDS("summarySCC_PM25.rds")
##Of the four types of sources indicated by the type (point, nonpoint, 
##onroad, nonroad) variable, which of these four sources have seen decreases 
##in emissions from 1999-2008 for Baltimore City? Which have seen increases 
##in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot 
##answer this question.
  library(ggplot2)
  DF <- split(NEI, as.factor(NEI$fips))
  DF <- DF$'24510'
  png("plot3.png", width=640, height=480)
  plot3 <- ggplot(DF, aes(as.factor(year),y=Emissions, fill=type))+geom_bar(stat="identity") + theme_bw(base_size=12) + facet_grid(.~type) + labs(x="Year", y=expression("Total PM2.5 Emission"), title=expression("PM2.5 Emission in Baltimore 1999-2008 by Source Type"))
  print(plot3)
  dev.off()
}