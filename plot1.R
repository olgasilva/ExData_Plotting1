## Read the data


setwd("//cib.net/shareparis/Home13/silvaol/PRIVE/COURSERA/Data Science R")

data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Change the formats
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
strptime(data$Time, "%H:%M:%S")
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))

## Subset to use only two days
subSetData <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

## make the histogram and save it in png
png("plot1.png",width = 480, height = 480)
hist(subSetData$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()
