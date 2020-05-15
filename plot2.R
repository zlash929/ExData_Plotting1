## COURSERA
## Exploratory Data Analysis
## R v3.6.2

# Load and format data
data <- read.table("household_power_consumption.txt", header = T, na.strings = "?", sep = ";")
dataSub <- data[which(data$Date=="1/2/2007" | data$Date== "2/2/2007"),]
dataSub$datetime <- paste(dataSub$Date, dataSub$Time)
dataSub$datetime <- strptime(dataSub$datetime, "%d/%m/%Y %H:%M:%S")
dataSub$Global_active_power <- as.numeric(dataSub$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(dataSub$datetime, dataSub$Global_active_power, type = "l", xlab = "", ylab ="Global Active Power (kilowatts)")
dev.off()