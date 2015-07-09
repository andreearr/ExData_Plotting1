dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

glob_act_pow <- as.numeric(subSetData$Global_active_power)
hist(glob_act_pow, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, "plot1.png")
dev.off()