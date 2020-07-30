# restricted_data.csv contains only the data corresponding to January 1 and 2, 2007. See ./import_file/import.R
# Loading file
df <- read.csv('restricted_data.csv', sep = ";", header = TRUE,na.strings = '?')
# Open png device. default is 480 x 480 px
# The dates in the chart are configured by the language of the operating system.
# In my case it is Spanish. 
# You will see "jue", "vie" and "sáb" instead of Thu", "Fri" and "Sat"
png('plot4.png')
# define column array
par(mfcol=c(2,2))
# (1,1) plot
plot(strptime(paste0(df$Date,",",df$Time), format = '%d/%m/%Y,%H:%M:%S', tz='Europe/Paris'),df$Global_active_power,type="l",lty=1,xlab = '',ylab = "Global Active Power (kilowatts)")
# (2,1) plot
plot(strptime(paste0(df$Date,",",df$Time), format = '%d/%m/%Y,%H:%M:%S', tz='Europe/Paris'),
     df$Sub_metering_1,type="l",
     lty=1,xlab = '',ylab = "Energy Sub metering")
lines(strptime(paste0(df$Date,",",df$Time), format = '%d/%m/%Y,%H:%M:%S', tz='Europe/Paris'),
      df$Sub_metering_2,col="red")
lines(strptime(paste0(df$Date,",",df$Time), format = '%d/%m/%Y,%H:%M:%S', tz='Europe/Paris'),
      df$Sub_metering_3,col="blue")
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'),lty = c(1,1,1),box.lty=0)
# (1,2) plot
plot(strptime(paste0(df$Date,",",df$Time), format = '%d/%m/%Y,%H:%M:%S', tz='Europe/Paris'),df$Voltage,type="l",lty=1,xlab = 'datetime',ylab = "Voltage")
# (2,2) plot
plot(strptime(paste0(df$Date,",",df$Time), format = '%d/%m/%Y,%H:%M:%S', tz='Europe/Paris'),df$Global_reactive_power,type="l",lty=1,xlab = 'datetime',ylab = "Global_reactive_power")
dev.off()
