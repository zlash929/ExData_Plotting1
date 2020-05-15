## COURSERA
## Exploratory Data Analysis
## R v3.6.2

# Load and format data
data <- read.table("household_power_consumption.txt", header = T, na.strings = "?", sep = ";")
dataSub <- data[which(data$Date=="1/2/2007" | data$Date== "2/2/2007"),]
dataSub$datetime <- paste(dataSub$Date, dataSub$Time)
dataSub$datetime <- strptime(dataSub$datetime, "%d/%m/%Y %H:%M:%S")
png("plot3.png", width = 480, height = 480)
plot(dataSub$datetime, dataSub$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black", yaxt='n')
lines(dataSub$datetime, dataSub$Sub_metering_2, type = "l", col = "red", )
lines(dataSub$datetime, dataSub$Sub_metering_3, type = "l", col = "blue", )
axis(side = 2, at=c(seq(0,30,10)))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1)
dev.off()