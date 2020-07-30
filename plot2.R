# restricted_data.csv contains only the data corresponding to January 1 and 2, 2007. See ./import_file/import.R
# Loading file
df <- read.csv('restricted_data.csv', sep = ";", header = TRUE,na.strings = '?')
# Open png device. default is 480 x 480 px
# The dates in the chart are configured by the language of the operating system.
# In my case it is Spanish. 
# You will see "jue", "vie" and "sáb" instead of Thu", "Fri" and "Sat"
png('plot2.png')
plot(strptime(paste0(df$Date,",",df$Time), format = '%d/%m/%Y,%H:%M:%S', tz='Europe/Paris'),df$Global_active_power,type="l",lty=1,xlab = '',ylab = "Global Active Power (kilowatts)")
dev.off()