# restricted_data.csv contains only the data corresponding to January 1 and 2, 2007. See ./import_file/import.R
# Loading file
df <- read.csv('restricted_data.csv', sep = ";", header = TRUE,na.strings = '?')
# Open png device. default is 480 x 480 px
# The dates in the chart are configured by the language of the operating system.
# In my case it is Spanish. 
# You will see "jue", "vie" and "sáb" instead of Thu", "Fri" and "Sat"
png('plot3.png')
plot(strptime(paste0(df$Date,",",df$Time), format = '%d/%m/%Y,%H:%M:%S', tz='Europe/Paris'),
     df$Sub_metering_1,type="l",
     lty=1,xlab = '',ylab = "Energy Sub metering")
lines(strptime(paste0(df$Date,",",df$Time), format = '%d/%m/%Y,%H:%M:%S', tz='Europe/Paris'),
      df$Sub_metering_2,col="red")
lines(strptime(paste0(df$Date,",",df$Time), format = '%d/%m/%Y,%H:%M:%S', tz='Europe/Paris'),
      df$Sub_metering_3,col="blue")
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'),lty = c(1,1,1))
dev.off()