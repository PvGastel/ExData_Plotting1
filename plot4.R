# project:    EDA Project assignment wk 1
# author:     Peter van Gastel
# scriptname: plot4.R
# date:       2014-12-04
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
png(filename ="plot4.png", width = 480, height=480)

# set graph matrix dimensions
par(mfrow = c(2, 2))

# create plot4.1: line chart (type="l") with correct labels
plot(EPCData$Time, EPCData$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")

# create plot4.2: line chart 
plot(EPCData$Time, EPCData$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

# create plot4.3: line chart with correct labels, colors and legend
with(EPCData, plot(Time, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering"))
with(EPCData, lines(Time, Sub_metering_2, type="l", col = "red"))
with(EPCData, lines(Time, Sub_metering_3, type="l", col = "blue"))
legend("topright", pch = "", col = c("black", "blue", "red"), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n")

# create plot4.4: line chart 
plot(EPCData$Time, EPCData$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")


# close file
dev.off()
