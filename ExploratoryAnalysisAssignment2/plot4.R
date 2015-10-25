plot4 <- function() {
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  #Across the United States, how have emissions from coal 
  #combustion-related sources changed from 1999-2008?
  coal<-grepl("coal", SCC$SCC.Level.Three, ignore.case = TRUE)
  comb<-grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
  coalcomb <- (coal&comb)
  SCCTrue <- SCC$SCC[coalcomb==TRUE]
  CNEI <- NEI[NEI$SCC %in% SCCTrue,]

  library(ggplot2)
  png("plot4.png", width=640, height=480)
  plot4<-ggplot(CNEI, aes(as.factor(year),y=Emissions))+geom_bar(stat="identity") + theme_bw(base_size=12) + labs(x="Year", y=expression("Total PM2.5 Emission"), title=expression("PM2.5 Coal Combustion Related Emission in Baltimore 1999-2008"))
  print(plot4)
  dev.off()
  }

