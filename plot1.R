library(dplyr)

power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data<- filter(power, Date == "1/2/2007" | Date == "2/2/2007")


png(filename ="Plot1.png", width = 480, height = 480)
hist(as.numeric(data$Global_active_power), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()

