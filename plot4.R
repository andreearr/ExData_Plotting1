dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

glob_act_pow <- as.numeric(subSetData$Global_active_power)
submetering1 <- as.numeric(subSetData$Sub_metering_1)
submetering2 <- as.numeric(subSetData$Sub_metering_2)
submetering3 <- as.numeric(subSetData$Sub_metering_3)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
volt <- as.numeric(subSetData$Voltage)
Global_reactive_power <- as.numeric(subSetData$Global_reactive_power)

par(mfrow = c(2,2))

with(subSetData, plot(datetime, glob_act_pow, type = "l", ylab = "Global Active Power", xlab =""))

with(subSetData, plot(datetime, volt, type = "l", ylab = "Voltage"))

with(subSetData, plot(datetime, submetering1 , type = "l", ylab = "Energy sub metering", xlab =""))
lines(datetime, submetering2, col= "red")
lines(datetime, submetering3, col= "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, lty = 1, col = c("black", "red", "blue"), )

with(subSetData, plot(datetime, Global_reactive_power, type = "l"))

dev.copy(png, "plot4.png",  width=650, height=650)
dev.off()

