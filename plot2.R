

## Read the data


setwd("//cib.net/shareparis/Home13/silvaol/PRIVE/COURSERA/Data Science R")

dataFile <- "./household_power_consumption.txt"
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


## Subset to use only two days
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Join date and time
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Change the format
globalActivePower <- as.numeric(subSetData$Global_active_power)

#make the graph
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()