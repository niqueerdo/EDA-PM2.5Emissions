## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 
# 1999 to 2008? Using the base plotting system, make a plot showing the 
# total PM2.5 emission from all sources for each of the years 1999, 2002, 
# 2005, and 2008.

totalEmissions <- aggregate(Emissions ~ year, NEI, sum)

with(totalEmissions, plot(year, Emissions, type = 'o', col = 'steelblue', 
                          main = 'Total PM2.5 Emissions in US by Year', 
                          xlab = 'Year', ylab = 'Total PM2.5 Emissions'))

dev.copy(png, "plot1.png")
dev.off()

# Total PM2.5 emissions decreased in the United States from 1999 to 2008.