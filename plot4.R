tab5rows <- read.table("household_power_consumption.txt", header = TRUE, sep=";",  nrows = 5)
classes <- sapply(tab5rows, class)
tabAll <- read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = classes,na.strings='?')

obs <- subset(tabAll, Date=="1/2/2007" | Date=="2/2/2007")

obs$Date <- as.character(obs$Date)
obs$Date[obs$Date == "1/2/2007"] <- "01/02/2007"
obs$Date[obs$Date == "2/2/2007"] <- "02/02/2007"

png(file="plot4.png")
par(mfrow=c(2,2))
#1
plot(t,obs$Global_active_power, type="n", xlab="", ylab="Global Active Power(kilowatts)") 
lines(t,obs$Global_active_power, type="l")
#2
plot(t,obs$Voltage, type="n", xlab="datetime",ylab="Voltage") 
lines(t,obs$Voltage, type="l")
#3
plot(t,obs$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering") 
lines(t,obs$Sub_metering_1, type="l",col="black")
lines(t,obs$Sub_metering_2, type="l",col="red")
lines(t,obs$Sub_metering_3, type="l",col="blue")
legend("topright",bty = "n",
       lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#4

plot(t,obs$Global_reactive_power, type="n", xlab="datetime")#,ylab="Global_reactive_power") 
lines(t,obs$Global_reactive_power, type="l")

dev.off()