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

data$date_time <- strptime(paste(data$Date, data$Time, sep=" "), 
                                             format="%d/%m/%Y %H:%M:%S")
png('plot2.png', width = 480, height = 480)


x <- data$date_time
y <- data$Global_active_power

plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")


dev.off()