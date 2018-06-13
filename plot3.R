## Read the data


setwd("//cib.net/shareparis/Home13/silvaol/PRIVE/COURSERA/Data Science R")

data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


## Subset to use only two days
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Join date and time
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Change the format
globalActivePower <- as.numeric(subSetData$Global_active_power)

#make the graph
png("plot3.png", width=480, height=480)
plot(datetime, subSetData$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering",col="black")
lines(datetime, subSetData$Sub_metering_2, type="l", col="red")
lines(datetime, subSetData$Sub_metering_3, type="l", col="blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()