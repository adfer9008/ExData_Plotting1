#set working directory
setwd("D:/R/Coursera/Git/Exploratory1")

#read in file
raw <- fread("household_power_consumption.txt")


#subset by date
power <- subset(raw, raw$Date=="1/2/2007"|raw$Date=="2/2/2007")
power$Date <- paste(power$Date, power$Time)
power$Date <- as.POSIXct(power$Date, tz="America/Chicago","%d/%m/%Y %H:%M:%S")

#convert to numeric
power$Global_active_power <- as.numeric(power$Global_active_power)

#export the plot
png("plot2.png")
with(power,plot(Date,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()
