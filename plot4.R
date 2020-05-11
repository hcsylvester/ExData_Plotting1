#Load package needed
library(data.table)

#Create variable with full data
energy <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                     na.strings = "?", stringsAsFactors = FALSE)

#Create variable with subset of data and dates specified
main_energy <- subset(energy, Date %in% c("1/2/2007", "2/2/2007"))

#Turn Date and Time from char to obj and store into one variable
main_energy$Date <- as.Date(main_energy$Date, format = "%d/%m/%Y")
dt <- paste(as.Date(main_energy$Date), main_energy$Time)
main_energy$Dt <- as.POSIXct(dt) 

#Create image of plots
png("plot4.png", width = 480, height = 480)

#State layout for page 2 x 2 in this case 
par(mfrow = c(2, 2))

#First plot
with(main_energy, {plot(main_energy$Global_active_power ~ main_energy$Dt, 
                        type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", )})

#Second Plot
plot(main_energy$Voltage ~ main_energy$Dt, type = "l", xlab = "datetime", ylab = "Voltage")

#Third Plot
plot(main_energy$Sub_metering_1 ~ main_energy$Dt, type = "l", xlab = "", ylab = "Energy sub metering")
lines(main_energy$Sub_metering_3 ~ main_energy$Dt, col = "blue")
lines(main_energy$Sub_metering_2 ~ main_energy$Dt, col = "red")


legend("topright", col = c("black", "red", "blue"), lty = 1, 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Fourth Plot
plot(main_energy$Global_reactive_power ~ main_energy$Dt, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

