dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

glob_act_pow <- as.numeric(subSetData$Global_active_power)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
with(subSetData, plot(datetime, glob_act_pow, type = "l", ylab = "Global Active Power(kilowatts)", xlab =""))
dev.copy(png, "plot2.png")
dev.off()