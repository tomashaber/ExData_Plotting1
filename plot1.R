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

png('plot1.png', width = 480, height = 480)

hist(data$Global_active_power, freq = T, 
     xlab = "Global active power (kilowatts)", main = "Global active power",
     col = c("red"))


dev.off()