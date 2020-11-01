library(dplyr)
library(ggplot2)
library(lattice)

my_data  <- read.delim('household_power_consumption.txt')
my_table <- table(my_data)