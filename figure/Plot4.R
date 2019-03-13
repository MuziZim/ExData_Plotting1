dataset <- read.table("./household_power_consumption.txt", sep = ";")
dataset$V1 <- as.Date(dataset$V1, format = '%d/%m/%Y')
dataset$V2 <- paste(dataset$V1, dataset$V2)
dataset$V2 <- strptime(dataset$V2, format = "%Y-%m-%d %H:%M:%S")
data <- subset(dataset, dataset$V1 == "2007-02-01" | dataset$V1 == "2007-02-02")

par(mfrow=c(2,2))

plot(data$V2, data$V3, type = "o", pch = 26, xlab = "", ylab = "Global Active Power (kilowatts)")

plot(data$V2, data$V5, type = "o", pch = 26, ylab = "Voltage", xlab = "datetime")

plot(data$V2, data$V7, type = "o", pch = 26, xlab = "", ylab = "Energy sub metering")
lines(data$V2, data$V8, col = "red")
lines(data$V2, data$V9, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$V2, data$V4, type = "o", pch = 26, ylab = "Global_reactive_power", xlab = "datetime")

dev.copy(png, "plot4.png")
dev.off()