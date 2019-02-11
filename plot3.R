## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in 
# emissions from 1999–2008 for Baltimore City? Which have seen increases 
# in emissions from 1999–2008? Use the ggplot2 plotting system to make a 
# plot answer this question.

NEI_Baltimore <- NEI[NEI$fips == '24510', ]
totalEmissions_Baltimore <- aggregate(Emissions ~ year + type, NEI_Baltimore, sum)

library(ggplot2)
png('plot3.png')

ggplot(totalEmissions_Baltimore, aes(year, Emissions, col = type))
        + geom_point() + geom_line() 
        + labs(title = 'Total PM2.5 Emissions in Baltimore by Type and Year', 
         x = 'Year', y = 'Total PM2.5 Emissions')
        + scale_colour_discrete(name = "Type of Sources")
        
dev.off()

# Emissions from three types of sources (nonpoint, onroad, nonroad) have 
# decreased from 1999–2008 in Baltimore City. 

# Emissions from point source have increased from 1999–2005 and decreased 
# by 2008.