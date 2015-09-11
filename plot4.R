# This file contains code that reads household_power_consumption.txt,
# and creates four separate line plots of:
# 1) Global_active_power
# 2) Voltage
# 3) the three Sub_metering fields
# 4) Global_reactive_power
# for the two days February 1st and 2nd, 2007 (the data is polled by minute).

# To preserve the current working directory at the end of the session
old.dir <- getwd()
setwd("C:/Users/corner PC/Desktop/Coursera/EXData_Plotting1")
power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
# sub.power is the subset of the file for the given two days
sub.power <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")
# Write to png file in same directory as the data file
png(file = "plot4.png")

with(sub.power, {
    # Combine Date and Time to create new field with R datetime
    DateTime <- as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")
    par(mfrow = c(2, 2))
    
    # Plot Global_active_power vs. DateTime
    plot(DateTime, Global_active_power, type = "l", xlab = "",
        ylab = "Global Active Power")
    
    # Plot Voltage vs. DateTime
    plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    
    # Plot three lines for the Sub_metering_# fields, each w/x-axis = DateTime
    plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
    legend("topright", lty = c(1, 1, 1), bty = "n",
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        col = c("black", "red", "blue"))
    
    # Plot Global_reactive_power vs. DateTime
    plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime",
        ylab = "Global_reactive_power")
})
dev.off()
setwd(old.dir)
