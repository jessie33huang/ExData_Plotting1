tab5rows <- read.table("household_power_consumption.txt", header = TRUE, sep=";",  nrows = 5)
classes <- sapply(tab5rows, class)
tabAll <- read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = classes,na.strings='?')

obs <- subset(tabAll, Date=="1/2/2007" | Date=="2/2/2007")

obs$Date <- as.character(obs$Date)
obs$Date[obs$Date == "1/2/2007"] <- "01/02/2007"
obs$Date[obs$Date == "2/2/2007"] <- "02/02/2007"


par(pin=c(6.4,6.4), mar= c(5, 4, 4, 2))


png(file="plot3.png")
plot(t,obs$Sub_metering_1, type="n", ylab="Energy sub metering") 
lines(t,obs$Sub_metering_1, type="l",col="black")
lines(t,obs$Sub_metering_2, type="l",col="red")
lines(t,obs$Sub_metering_3, type="l",col="blue")
legend("topright",
       lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
