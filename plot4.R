## Read the data


setwd("//cib.net/shareparis/Home13/silvaol/PRIVE/COURSERA/Data Science R")

data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


## Subset to use only two days
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Join date and time
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Change the format
globalActivePower <- as.numeric(subSetData$Global_active_power)
voltage <- as.numeric(subSetData$Voltage)
globalRP <- as.numeric(subSetData$Global_reactive_power)

#make the four graphs
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subSetData$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering",col="black")
lines(datetime, subSetData$Sub_metering_2, type="l", col="red")
lines(datetime, subSetData$Sub_metering_3, type="l", col="blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1 , lwd=2, col = c("black", "red", "blue"))
plot(datetime, globalRP, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()