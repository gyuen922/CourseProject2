plot5 <- function() {
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  #Across the United States, how have emissions from coal 
  #combustion-related sources changed from 1999-2008?
  
  v <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
  vSCC <- SCC[v,]$SCC
  vNEI <- NEI[NEI$SCC %in% vSCC,]
  
  bvNEI <- vNEI[vNEI$fips=="24510",]
  
  png("plot5.png",width=480,height=480,units="px",bg="transparent")
  
  library(ggplot2)
  
  plot5 <- ggplot(bvNEI,aes(factor(year),Emissions)) +
    geom_bar(stat="identity",fill="grey",width=0.75) +
    theme_bw() +  guides(fill=FALSE) +
    labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
    labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))
  
  print(plot5)
  
  dev.off()
  
}

