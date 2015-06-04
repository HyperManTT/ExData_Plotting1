library(lubridate)
#Read in data and do date conversion using lubridate methods
power_data <- read.csv('household_power_consumption.txt', sep=";", na.strings='?', stringsAsFactors=FALSE)
power_data$Date <- dmy(power_data$Date)

#Extract the dates we want
power_data <- power_data[power_data$Date == ymd("2007-02-01") | power_data$Date == ymd("2007-02-02"),]

# Create a datetime column
power_data$Datetime <- ymd_hms(paste(power_data$Date, power_data$Time, sep= " "))

#Axis range for Plot 3
yrange <- range(power_data$Sub_metering_1, power_data$Sub_metering_2, power_data$Sub_metering_3)
xrange <- range(power_data$Datetime)

png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#Plot 1
plot(power_data$Datetime, power_data$Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(power_data$Datetime, power_data$Global_active_power)

#Plot 2
plot(power_data$Datetime, power_data$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(power_data$Datetime, power_data$Voltage)

#Plot 3
plot(xrange, yrange, type="n", xlab="", ylab="Energy sub metering")
lines(power_data$Datetime, power_data$Sub_metering_1, col="black")
lines(power_data$Datetime, power_data$Sub_metering_2, col="red")
lines(power_data$Datetime, power_data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), 
       lwd=c(1.5, 1.5), col=c("black", "red", "blue"))

#Plot 4
plot(power_data$Datetime, power_data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(power_data$Datetime, power_data$Global_reactive_power)

dev.off()