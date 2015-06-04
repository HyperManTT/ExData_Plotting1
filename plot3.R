library(lubridate)
#Read in data and do date conversion using lubridate methods
power_data <- read.csv('household_power_consumption.txt', sep=";", na.strings='?', stringsAsFactors=FALSE)
power_data$Date <- dmy(power_data$Date)

#Extract the dates we want
power_data <- power_data[power_data$Date == ymd("2007-02-01") | power_data$Date == ymd("2007-02-02"),]

# Create a datetime column
power_data$Datetime <- ymd_hms(paste(power_data$Date, power_data$Time, sep= " "))

# Create plot
#Get ranges for both axis
yrange <- range(power_data$Sub_metering_1, power_data$Sub_metering_2, power_data$Sub_metering_3)
xrange <- range(power_data$Datetime)
png(filename="plot3.png", width=480, height=480)
plot(xrange, yrange, type="n", xlab="", ylab="Energy sub metering")
lines(power_data$Datetime, power_data$Sub_metering_1, col="black")
lines(power_data$Datetime, power_data$Sub_metering_2, col="red")
lines(power_data$Datetime, power_data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), 
      lwd=c(1.5, 1.5), col=c("black", "red", "blue"))
dev.off()