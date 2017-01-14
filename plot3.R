power_data <- read.table('household_power_consumption.txt', 
                         sep = ';', header = TRUE)

pwr_sub <- power_data[power_data$Date %in% c('1/2/2007','2/2/2007'),]
pwr_sub$datetime <- strptime(paste(pwr_sub$Date, pwr_sub$Time, sep = ' '), 
                             '%d/%m/%Y %H:%M:%S')

pwr_sub$Sub_metering_1 <- as.numeric(pwr_sub$Sub_metering_1)
pwr_sub$Sub_metering_2 <- as.numeric(pwr_sub$Sub_metering_2)
pwr_sub$Sub_metering_3 <- as.numeric(pwr_sub$Sub_metering_3)

png('plot3.png', width = 480, height = 480)
plot(pwr_sub$datetime, pwr_sub$Sub_metering_1, type = 'l', 
ylab = 'Energy Submetering', xlab = '')
lines(pwr_sub$datetime, pwr_sub$Sub_metering_2, type = 'l', col = 'red')
lines(pwr_sub$datetime, pwr_sub$Sub_metering_3, type = 'l', col = 'blue')
legend('topright',c('Sub_Metering_1', 'Sub_Metering_2', 'Sub_Metering_3'), 
       lty = 1, lwd = 3, col = c('black','red','blue'))

dev.off()

#files removed to clear up space from the machine
rm(pwr_sub)
rm(power_data)