power_data <- read.table('household_power_consumption.txt', 
                  sep = ';', header = TRUE)

pwr_sub <- power_data[power_data$Date %in% c('1/2/2007','2/2/2007'),]
pwr_sub$Date <- as.Date(pwr_sub$Date)
pwr_sub$Global_active_power <- as.numeric(pwr_sub$Global_active_power))

png('plot1.png', width = 480, height = 480)
hist(pwr_sub$Global_active_power/500, col = 'red', 
     main = 'Global Active Power', xlab = 'Global Active Power (Kilowatts)')

dev.off()

#files removed to clear up space from the machine
rm(pwr_sub)
rm(power_data)