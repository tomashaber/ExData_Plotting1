Sys.setlocale("LC_TIME", "English")
if (!require("data.table")) {
  install.packages("data.table")
}

require("data.table")

from <- 66638 # line number where relevant data starts
to <- 69517 # line number where relevant data ends

data <- read.table("household_power_consumption.txt", header = F, sep =";", skip = 66637, nrows = 2879, na.string="?")

names(data) <- c("Date","Time","Global_active_power",
                 "Global_reactive_power","Voltage","Global_intensity",
                 "Sub_metering_1","Sub_metering_2","Sub_metering_3")

png("plot4.png", width = 480, height = 480)
data$date_time <- strptime(paste(data$Date, data$Time, sep=" "), 
                           format="%d/%m/%Y %H:%M:%S")
x <- data$date_time

par(mfrow=c(2,2))

plot(x, data$Global_active_power,type="l", xlab="", ylab="Global Active Power")
plot(x, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(x, data$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")

lines(x, data$Sub_metering_2, col="red")
lines(x, data$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1,box.lwd=0)
plot(x, data$Global_reactive_power, type="n",
     xlab="datetime", ylab="Global_reactive_power")
lines(x, data$Global_reactive_power)

dev.off()