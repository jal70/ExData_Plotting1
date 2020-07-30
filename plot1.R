# restricted_data.csv contains only the data corresponding to January 1 and 2, 2007. See ./import_file/import.R
# Loading file
df <- read.csv('restricted_data.csv', sep = ";", header = TRUE,na.strings = '?')
# Open png device. default is 480 x 480 px
png('plot1.png')
# base hist plot function + annotation
hist(df$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col = 'red')
# closing png device
dev.off()
