# project:   EDA Project assignment wk 1
# author:    Peter van Gastel
# sciptname: Plot 2
# date:      2014-12-04
#
# overall goal is to examine how household energy usage varies over a 2-day period in February, 2007.
#

# Read file
EPCData <- read.csv("./Exploratory Data Analysis/WK1 project/household_power_consumption.txt", sep = ";", na.strings="?")

# select rows
EPCData <- EPCData[(EPCData$Date=="1/2/2007"| EPCData$Date=="2/2/2007"),]

# convert date and time
EPCData[,1] <- as.Date(EPCData[,1], format="%d/%m/%Y")
EPCData[,2] <- as.POSIXct(paste(EPCData[,1], EPCData[,2]), format="%Y-%m-%d %H:%M:%S")

# open outputfile for png format
png(filename ="plot2.png", width = 480, height=480)

# create line chart (type="l") with correct labels
plot(EPCData$Time, EPCData$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

# close file
dev.off()
