# This file contains code that reads household_power_consumption.txt,
# and creates a line plot of Global_active_power for the two days February 1st and
# 2nd, 2007 (the data is polled by minute).

# To preserve the current working directory at the end of the session
old.dir <- getwd()
setwd("C:/Users/corner PC/Desktop/Coursera/EXData_Plotting1")
power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
# sub.power is the subset of the file for the given two days
sub.power <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")
# Write to png file in same directory as the data file
png(file = "plot2.png")

with(sub.power, {
    # Combine Date and Time to create new field with R datetime
    DateTime <- as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")
    # Plot line of Global_active_power vs. DateTime
    plot(DateTime, Global_active_power, type = "l", xlab = "", 
        ylab = "Global Active Power (kilowatts)")
})

dev.off()
setwd(old.dir)
