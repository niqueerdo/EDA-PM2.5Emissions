## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed from 1999–2008 in 
# Baltimore City?

SCC_vehicle <- SCC[grepl("vehicle", SCC$EI.Sector, ignore.case = T), ]
NEI_vehicle <- NEI[NEI$SCC %in% SCC_vehicle$SCC, ]
Baltimore_vehicle <- NEI_vehicle[NEI_vehicle$fips == '24510', ]

total_Baltimore_vehicle <- aggregate(Emissions ~ year, Baltimore_vehicle, sum)

library(ggplot2)
png('plot5.png')

ggplot(total_Baltimore_vehicle, aes(year, Emissions)) 
        + geom_point(col = 'steelblue') 
        + geom_line(col = 'steelblue') 
        + labs(title = 'Total PM2.5 Motor Vehicle Emissions in Baltimore by 
               Year', x = 'Year', y = 'Total PM2.5 Emissions')

dev.off()

# Emissions from motor vehicles sources in Baltimore have decreased from 1999–2008.