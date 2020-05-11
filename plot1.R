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
