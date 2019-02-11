## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

SCC_coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T), ]
NEI_coal <- NEI[NEI$SCC %in% SCC_coal$SCC, ]

total_coal <- aggregate(Emissions ~ year, NEI_coal, sum)

library(ggplot2)
png('plot4.png')

ggplot(total_coal, aes(year, Emissions)) 
        + geom_point(col = 'steelblue') 
        + geom_line(col = 'steelblue') 
        + labs(title = 'Total PM2.5 Coal Combustion Emissions in US by Year', 
               x = 'Year', y = 'Total PM2.5 Emissions')

dev.off()

# Emissions from coal combustion-related sources in US have decreased from 
# 1999–2008.