#set working directory
setwd("D:/R/Coursera/Git/Exploratory1")
#load chron library for time formatting
library(chron)

#read in fiel
raw <- fread("household_power_consumption.txt")
#convert date for subsetting
raw$Date <- as.Date(raw$Date,format="%d/%m/%Y")

#subset by date
power <- subset(raw, raw$Date=="2007-02-01"|raw$Date=="2007-02-02")
#convert time to time format
power$Time <- chron(times=power$Time)
#convert to numeric
power$Global_active_power <- as.numeric(power$Global_active_power)


#export the plot
png("plot1.png")
hist(power$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="blue")
dev.off()

