dataset <- read.table("./household_power_consumption.txt", sep = ";")
dataset$V1 <- as.Date(dataset$V1, format = '%d/%m/%Y')
dataset$V2 <- paste(dataset$V1, dataset$V2)
dataset$V2 <- strptime(dataset$V2, format = "%Y-%m-%d %H:%M:%S")
data <- subset(dataset, dataset$V1 == "2007-02-01" | dataset$V1 == "2007-02-02")

hist(as.numeric(data$V3), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

dev.copy(png, "plot1.png")
dev.off()