library(lubridate)
#Read in data and do date/time conversion using lubridate methods
power_data <- read.csv('household_power_consumption.txt', sep=";", na.strings='?', stringsAsFactors=FALSE)
power_data$Date <- dmy(power_data$Date)
power_data$Time <- hms(power_data$Time)

#Extract the dates we want
power_data <- power_data[power_data$Date == ymd("2007-02-01") | power_data$Date == ymd("2007-02-02"),]

#Plot Data to file
png(filename="plot1.png", width=480, height=480)
hist(power_data$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()