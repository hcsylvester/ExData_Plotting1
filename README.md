## Exploratory Data Analysis Project 1

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.

## Plot 1


#Load package needed
library(data.table)

#create variable with all data
energy <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                     na.strings = "?")
                     
#check to see what data looks like               
head(energy)

#Create variable with subset of full data with specified dates
main_energy <- subset(energy, Date %in% c("1/2/2007", "2/2/2007"))

#Check to see if it worked should start at 2007
head(main_energy)

#Begin creating image for plot
png("plot1.png", width = 480, height = 480)

#Create Histogram
hist(main_energy$Global_active_power, main = "Global Active Power", 
        xlab = "Global Active Power (kilowatts)",
        ylab = "Frequency", col = "red")

dev.off()  


### Plot 1


![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 



## Plot 2


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


### Plot 2

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


## Plot 3

  
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


### Plot 3

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


## Plot 4

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

### Plot 4

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

