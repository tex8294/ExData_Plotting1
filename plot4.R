library(dplyr)

power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data_temp<- filter(power, Date == "1/2/2007" | Date == "2/2/2007")
date_time <- as.POSIXct(paste(data_temp$Date, data_temp$Time), format="%d/%m/%Y %H:%M:%S")
data <- data_temp %>%
  select(Global_active_power, Global_reactive_power, Voltage, Sub_metering_1, Sub_metering_2, Sub_metering_3)%>%
  mutate(time = date_time)



png(filename ="Plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))

#plot 1
with(data, plot(time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

#plot 2
with(data, plot(time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, lines(time, Sub_metering_2, type = "l", col ="red"))
with(data, lines(time, Sub_metering_3, type = "l", col = "blue"))
legend(x ="topright", bty = "n",  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

#plot 3
with(data, plot(time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

#plot 4
with(data, plot(time, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()