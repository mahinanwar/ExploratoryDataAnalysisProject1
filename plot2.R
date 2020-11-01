library(dplyr)
library(ggplot2)
library(lattice)
library(data.table)

my_data  <- read.delim('household_power_consumption.txt', header = TRUE, stringsAsFactors = FALSE,
                       na.strings = '?', sep = ';', quote = '', skip = 66636, nrows = 2880)
colnames(my_data) <- c('Date', 'Time', 'GlobalActivePower', 
                       'GlobalReactivePower', 'Voltage', 'GlobalIntensity', 
                       'SubMetering1', 'SubMetering2', 'SubMetering3')

my_data$DateTime <- strptime(paste(my_data$Date, my_data$Time), 
                             format = '%d/%m/%Y %H:%M:%S')
plot(my_data$DateTime, my_data$GlobalActivePower, type = 'l', xlab = NA ,
     ylab = 'Global Active Power (kilowatts)' )
