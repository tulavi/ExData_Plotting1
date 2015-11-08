## Reading the data in. This part of the code will be common to all plots
data <- read.table(
	"household_power_consumption.txt",
	header=TRUE, sep=";", na.strings="?",
	colClasses = c("character", "character", rep("numeric", 7))
	)
data2 <- subset (data, Date=="1/2/2007" | Date=="2/2/2007")
DateTime <- paste(data2$Date, data2$Time)
data2$DateTime <- strptime (DateTime, format=("%d/%m/%Y %H:%M:%S"))


## Opening a png file and making the plot
png(file = "plot4.png", width=480, height=480, units="px")
par(mfrow = c(2,2))

plot(data2$DateTime, data2$Global_active_power,
	type="l", col="black",
	xlab="", ylab="Global Active Power")

plot(data2$DateTime, data2$Voltage,
	type="l", col="black",
	xlab="datetime", ylab="Voltage")

plot(data2$DateTime, data2$Sub_metering_1,
	type="l", col="black",
	xlab="", ylab="Energy sub metering")
lines(data2$DateTime, data2$Sub_metering_2, col="red")
lines(data2$DateTime, data2$Sub_metering_3, col="blue")
legend("topright",
	bty="n",
	col=c("black", "red", "blue"),
	c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	lwd=1)

plot(data2$DateTime, data2$Global_reactive_power,
	type="l", col="black",
	xlab="datetime", ylab="Global_reactive_power")

dev.off()
