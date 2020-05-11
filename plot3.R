#Load packages needed
library(data.table)

#Create variable with full data 
energy <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                     na.strings = "?", stringsAsFactors = FALSE)

#Create variable with subset of data with specified dates
main_energy <- subset(energy, Date %in% c("1/2/2007", "2/2/2007"))

#Turning Date and Time from char to obj and creating variable to hold both
main_energy$Date <- as.Date(main_energy$Date, format = "%d/%m/%Y")
dt <- paste(as.Date(main_energy$Date), main_energy$Time)
main_energy$Dt <- as.POSIXct(dt) 

#Create image of plot
png("plot3.png", width = 480, height = 480)

#Create plot
plot(main_energy$Sub_metering_1 ~ main_energy$Dt, type = "l", xlab = "", ylab = "Energy sub metering")
lines(main_energy$Sub_metering_3 ~ main_energy$Dt, col = "blue")
lines(main_energy$Sub_metering_2 ~ main_energy$Dt, col = "red")

#Create legend to specificy the topright corner
legend("topright", col = c("black", "red", "blue"), lty = 1, 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
