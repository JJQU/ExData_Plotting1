#Exploratory Data Analysis_Course Project 1
#Load the data set and use only the data from the dates 2007-02-01 and 2007-02-02
##Measurement is in one household with a one-minute sampling rate over 4 years. 
##The data set has 2,075,259 rows.Starting date and time is 16/12/2006;17:24:00
##Thus, nrow is equal to 2880 for 2007-02-1 and 2 record (2x24x60=2880)

tb <- readLines("C:/Users/JJQ/Desktop/household_power_consumption.txt")
n <- grep("1/2/2007", tb)
head(n)
PowerConsumption <- read.table("C:/Users/JJQ/Desktop/household_power_consumption.txt", skip=n[1], nrows=2880, sep = ";",
                               col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                               na.strings = "?")

head(PowerConsumption)
tail(PowerConsumption)

#Convert the Date and Time variables to Date/Time classes in R

PowerConsumption$Date <- as.Date(PowerConsumption$Date, format = "%d/%m/%Y")

PowerConsumption$DateTime <- strptime(paste(PowerConsumption$Date, PowerConsumption$Time), "%Y-%m-%d %H:%M:%S")


#Plot 1
hist(PowerConsumption$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

#save png file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()

#Plot2
DateTime <- as.POSIXct(PowerConsumption$DateTime)
GlobalActivePower <- as.numeric(PowerConsumption$Global_active_power)
plot(DateTime, GlobalActivePower, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

#Save plot2.png file
dev.copy(png, file = "plot2.png", height = 480, width = 480)

dev.off()
