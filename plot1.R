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
png(file = "plot1.png", width=480, height=480, units="px")
hist(data2$Global_active_power,
	col="red",
	main="Global Active Power",
	xlab="Global Active Power (kilowatts)")
dev.off()
