library(dplyr)
library(ggplot2)
library(lattice)
library(data.table)

my_data  <- read.delim('household_power_consumption.txt', header = TRUE, 
                       stringsAsFactors = FALSE,na.strings = '?', sep = ';', 
                       quote = '', skip = 66636, nrows = 2880)
colnames(my_data) <- c('Date', 'Time', 'GlobalActivePower', 
                       'GlobalReactivePower', 'Voltage', 'GlobalIntensity', 
                       'SubMetering1', 'SubMetering2', 'SubMetering3')

my_data$DateTime <- strptime(paste(my_data$Date, my_data$Time), 
                             format = '%d/%m/%Y %H:%M:%S')

par(mfrow = c(2,2))
with(my_data, plot(DateTime, GlobalActivePower, type = 'l', xlab = NA ))
with(my_data, plot(DateTime, Voltage, type = 'l'))
plot(my_data$DateTime, my_data$SubMetering1,type = 'l', col = 'black', xlab = NA
     , ylab = 'Energy sub metering')
lines(my_data$DateTime, my_data$SubMetering2,type = 'l', col = 'red')
lines(my_data$DateTime, my_data$SubMetering3,type = 'l', col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 
                              'Sub_metering_3'),col = c('black', 'red', 'blue'),
       lwd = 1)
with(my_data, plot(DateTime, GlobalReactivePower, type = 'l', 
                   ylab = 'Global_reactive_power'))
