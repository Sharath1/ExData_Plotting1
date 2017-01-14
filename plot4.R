power_data <- read.table('household_power_consumption.txt', 
                         sep = ';', header = TRUE)

pwr_sub <- power_data[power_data$Date %in% c('1/2/2007','2/2/2007'),]
pwr_sub$datetime <- strptime(paste(pwr_sub$Date, pwr_sub$Time, sep = ' '), 
                             '%d/%m/%Y %H:%M:%S')

pwr_sub$Global_active_power <- as.numeric(pwr_sub$Global_active_power)/500
pwr_sub$Global_reactive_power <- as.numeric(pwr_sub$Global_reactive_power)

pwr_sub$Sub_metering_1 <- as.numeric(pwr_sub$Sub_metering_1)
pwr_sub$Sub_metering_2 <- as.numeric(pwr_sub$Sub_metering_2)
pwr_sub$Sub_metering_3 <- as.numeric(pwr_sub$Sub_metering_3)
pwr_sub$Voltage <- as.numeric(pwr_sub$Voltage)

png('plot4.png', width = 480, height = 480)
par(mfrow = c(2,2))

plot(pwr_sub$datetime, pwr_sub$Global_active_power, type = 'l', 
     xlab = '', ylab = 'Global Active Power')

plot(pwr_sub$datetime, pwr_sub$Voltage, type = 'l', 
     xlab = 'Datetime', ylab= 'Voltage')

plot(pwr_sub$datetime, pwr_sub$Sub_metering_1, type = 'l', 
     ylab = 'Energy Submetering', xlab = '')
lines(pwr_sub$datetime, pwr_sub$Sub_metering_2, type = 'l', col = 'red')
lines(pwr_sub$datetime, pwr_sub$Sub_metering_3, type = 'l', col = 'blue')
legend('topright',c('Sub_Metering_1', 'Sub_Metering_2', 'Sub_Metering_3'), 
       lty = 1, lwd = 3, col = c('black','red','blue'))

plot(pwr_sub$datetime, pwr_sub$Global_reactive_power, type = 'l', 
     xlab = 'datetime', ylab = 'Global Reactive Power')

dev.off()

#files removed to clear up space from the machine
rm(pwr_sub)
rm(power_data)