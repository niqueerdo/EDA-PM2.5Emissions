## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Compare emissions from motor vehicle sources in Baltimore City with 
# emissions from motor vehicle sources in Los Angeles County, California 
# (fips=="06037"). Which city has seen greater changes over time in motor 
# vehicle emissions?

SCC_vehicle <- SCC[grepl("vehicle", SCC$EI.Sector, ignore.case = T), ]
NEI_vehicle <- NEI[NEI$SCC %in% SCC_vehicle$SCC, ]

Baltimore_LA_vehicle <- NEI_vehicle[NEI_vehicle$fips == '24510' | 
                                            NEI_vehicle$fips == '06037', ]

total_vehicle <- aggregate(Emissions ~ year + fips, Baltimore_LA_vehicle, sum)

library(ggplot2)
png('plot6.png')

ggplot(total_vehicle, aes(year, Emissions, col = fips)) 
        + geom_point() 
        + geom_line() 
        + labs(title = 'Baltimore and Los Angeles PM2.5 Motor Vehicle 
               Emissions by Year', x = 'Year', y = 'Total PM2.5 Emissions') 
        + scale_colour_discrete(name = "City", labels = c('Los Angeles', 
                                                          'Baltimore'))

dev.off()

# Los Angeles County has seen greater changes over time in motor vehicle emissions.