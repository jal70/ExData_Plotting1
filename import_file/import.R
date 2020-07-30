#Download file
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,destfile = "../data/household_power_consumption.zip", method = "libcurl")
#Reading first 10 lines
readLines("../data/household_power_consumption.txt",n=10L)
# It's a csv text file (sep=";")
# Header: "Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3"
# Read only meanningfull lines
# Solution sugested here:
# https://stackoverflow.com/questions/23197243/how-to-read-only-lines-that-fulfil-a-condition-from-a-csv-into-r
library(sqldf)
subHousehold <- read.csv.sql("../data/household_power_consumption.txt", sql = "select * from file where (Date == '1/2/2007' or Date == '2/2/2007')", eol = "\n",sep=";")
# close connection ? :'(
# saving subset to file restricted_data.csv
write.table(subHousehold,file='../restricted_data.csv',sep = ';')
