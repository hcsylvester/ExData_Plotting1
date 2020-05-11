#Load package needed
library(data.table)

#Create variable with full data
energy <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                     na.strings = "?", stringsAsFactors = FALSE)

#Create variable with subset of data with specified dates
main_energy <- subset(energy, Date %in% c("1/2/2007", "2/2/2007"))

#Turning Date from char to obj and creating variable to hold Date and Time 
main_energy$Date <- as.Date(main_energy$Date, format = "%d/%m/%Y")
dt <- paste(as.Date(main_energy$Date), main_energy$Time)
main_energy$Dt <- as.POSIXct(dt) 

#Creating image process
png("plot2.png", width = 480, height = 480)

#Creating plot
with(main_energy, {plot(main_energy$Global_active_power ~ main_energy$Dt, 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", )})

dev.off()
