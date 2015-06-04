library(lubridate)
#Read in data and do date conversion using lubridate methods
power_data <- read.csv('household_power_consumption.txt', sep=";", na.strings='?', stringsAsFactors=FALSE)
power_data$Date <- dmy(power_data$Date)

#Extract the dates we want
power_data <- power_data[power_data$Date == ymd("2007-02-01") | power_data$Date == ymd("2007-02-02"),]

# Create a datetime column
power_data$Datetime <- ymd_hms(paste(power_data$Date, power_data$Time, sep= " "))

#Plot graph
png(filename="plot2.png", width=480, height=480)
plot(power_data$Datetime, power_data$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(power_data$Datetime, power_data$Global_active_power)
dev.off()
