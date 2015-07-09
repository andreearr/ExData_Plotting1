dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

submetering1 <- as.numeric(subSetData$Sub_metering_1)
submetering2 <- as.numeric(subSetData$Sub_metering_2)
submetering3 <- as.numeric(subSetData$Sub_metering_3)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

with(subSetData, plot(datetime, submetering1 , type = "l", ylab = "Energy sub metering", xlab =""))
lines(datetime, submetering2, col= "red")
lines(datetime, submetering3, col= "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, lty = 1, col = c("black", "red", "blue"), )

dev.copy(png, "plot3.png")
dev.off()
