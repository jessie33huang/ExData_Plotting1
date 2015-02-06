tab5rows <- read.table("household_power_consumption.txt", header = TRUE, sep=";",  nrows = 5)
classes <- sapply(tab5rows, class)
tabAll <- read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = classes,na.strings='?')

obs <- subset(tabAll, Date=="1/2/2007" | Date=="2/2/2007")

obs$Date <- as.character(obs$Date)
obs$Date[obs$Date == "1/2/2007"] <- "01/02/2007"
obs$Date[obs$Date == "2/2/2007"] <- "02/02/2007"

x <- paste(obs$Date, obs$Time)
t <- strptime(x, "%d/%m/%Y %H:%M:%S")
par(pin=c(6.4,6.4))
png(file="plot2.png")
plot(t,obs$Global_active_power, type="n", ylab="Global Active Power(kilowatts)") 
lines(t,obs$Global_active_power, type="l")
dev.off()
