tab5rows <- read.table("household_power_consumption.txt", header = TRUE, sep=";",  nrows = 5)
classes <- sapply(tab5rows, class)
tabAll <- read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = classes,na.strings='?')

obs <- subset(tabAll, Date=="1/2/2007" | Date=="2/2/2007")

png(file="plot1.png")
hist(obs$Global_active_power,
     main="Global Active Power",
     col="red",
     xlab="Global Active Power(kilowatts")
png(file="plot1.png")
dev.off()