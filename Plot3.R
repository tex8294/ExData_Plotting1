library(dplyr)

power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data_temp<- filter(power, Date == "1/2/2007" | Date == "2/2/2007")
date_time <- as.POSIXct(paste(data_temp$Date, data_temp$Time), format="%d/%m/%Y %H:%M:%S")
data <- data_temp %>%
  select(Global_active_power)%>%
  mutate(time = date_time)



png(filename ="Plot2.png", width = 480, height = 480)

with(data, plot(time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()