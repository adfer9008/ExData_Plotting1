#set working directory
setwd("D:/R/Coursera/Git/Exploratory1")

#read in file
raw <- fread("household_power_consumption.txt")


#subset by date
power <- subset(raw, raw$Date=="1/2/2007"|raw$Date=="2/2/2007")
power$Date <- paste(power$Date, power$Time)
power$Date <- as.POSIXct(power$Date, tz="America/Chicago","%d/%m/%Y %H:%M:%S")

#convert to numeric
power$Sub_metering_1<- as.numeric(power$Sub_metering_1)
power$Sub_metering_2<- as.numeric(power$Sub_metering_2)
power$Sub_metering_3<- as.numeric(power$Sub_metering_3)
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
power$Voltage <- as.numeric(power$Voltage)

#export the plot
png("plot4.png")
par(mfrow=c(2,2))
#plot 1
with(power,plot(Date,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
#plot 2
with(power,plot(Date,Voltage,type="l",xlab="datetime",ylab="Voltage"))
#plot 3
with(power,plot(Date,Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering"))
with(power,lines(Date,Sub_metering_2,col="red"))
with(power,lines(Date,Sub_metering_3,col="blue"))
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black", "red","blue"),lty=1)
#plot 4
with(power,plot(Date,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))
dev.off()
