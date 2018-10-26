tb <- readLines("C:/Users/JJQ/Desktop/household_power_consumption.txt")
n <- grep("1/2/2007", tb)
PowerConsumption <- read.table("C:/Users/JJQ/Desktop/household_power_consumption.txt", skip=n[1], nrows=2880, sep = ";",
                               col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                               na.strings = "?")

PowerConsumption$Date <- as.Date(PowerConsumption$Date, format = "%d/%m/%Y")

PowerConsumption$DateTime <- strptime(paste(PowerConsumption$Date, PowerConsumption$Time), "%Y-%m-%d %H:%M:%S")
DateTime <- as.POSIXct(PowerConsumption$DateTime)

#Plot3

SubMetering1 <- as.numeric(PowerConsumption$Sub_metering_1)
plot(DateTime, SubMetering1, type = "l", ylab = "Energy sub metering", xlab = "")
with(PowerConsumption,lines(DateTime,as.numeric(as.character(Sub_metering_2)),col="red"))
with(PowerConsumption,lines(DateTime,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=l, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Save plot3.png file
dev.copy(png, file = "plot3.png", height = 480, width = 480)

dev.off()
