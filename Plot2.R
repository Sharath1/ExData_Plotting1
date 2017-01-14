power_data <- read.table('household_power_consumption.txt', 
                         sep = ';', header = TRUE)

pwr_sub <- power_data[power_data$Date %in% c('1/2/2007','2/2/2007'),]
pwr_sub$datetime <- strptime(paste(pwr_sub$Date, pwr_sub$Time, sep = ' '), 
                             '%d/%m/%Y %H:%M:%S')
pwr_sub$Global_power_Kwh <- as.numeric(pwr_sub$Global_active_power)/500

png('plot2.png', width = 480, height = 480)
plot(pwr_sub$datetime, pwr_sub$Global_power_Kwh, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()

#files removed to clear up space from the machine
rm(pwr_sub)
rm(power_data)