## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting 
# system to make a plot answering this question.

NEI_Baltimore <- NEI[NEI$fips == '24510', ]
totalEmissions_Baltimore <- aggregate(Emissions ~ year, NEI_Baltimore, sum)

with(totalEmissions, plot(year, Emissions, type = 'o', col = 'steelblue', 
                          main = 'Total PM2.5 Emissions in Baltimore by Year', 
                          xlab = 'Year', ylab = 'Total PM2.5 Emissions'))

dev.copy(png, "plot2.png")
dev.off()

# Total PM2.5 emissions decreased in the Baltimore from 1999 to 2008.