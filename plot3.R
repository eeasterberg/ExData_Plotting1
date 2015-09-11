# This file contains code that reads household_power_consumption.txt,
# and creates line plots of the three Sub_metering fields for the two days February 
# 1st and 2nd, 2007 (the data is polled by minute).

# To preserve the current working directory at the end of the session
old.dir <- getwd()
setwd("C:/Users/corner PC/Desktop/Coursera/EXData_Plotting1")
power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
# sub.power is the subset of the file for the given two days
sub.power <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")
# Write to png file in same directory as the data file
png(file = "plot3.png")

color.pal = c("black", "red", "blue")
with(sub.power, {
    # Combine Date and Time to create new field with R datetime
    DateTime <- as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")
    # Plot three lines for the Sub_metering_# fields, each w/x-axis = DateTime
    plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering",
         col = color.pal[1])
    lines(DateTime, Sub_metering_2, col = color.pal[2])
    lines(DateTime, Sub_metering_3, col = color.pal[3])
    legend("topright", lty = c(1, 1, 1), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col = color.pal)
})
dev.off()
setwd(old.dir)
