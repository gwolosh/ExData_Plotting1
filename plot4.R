#############################################################
#
# plot4.R create the histogram plot
#
#############################################################
# Get the data for the plot
if (file.exists("data/power.RDS")) {
        power<-readRDS("data/power.RDS")
} else {
        source("PrepData.R")
        power<-getData()
}
# Create png device
png(filename = "plot4.png", width = 480, height = 480)

#fills row by row
par(mfrow=c(2,2))

# create plots
plot(power$datetime,power$Global_active_power, type='l', ylab='Global Active Power', xlab='')

plot(power$datetime, power$Voltage, type='l', ylab='Voltage', xlab='datetime')

plot(power$datetime, power$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(power$datetime, power$Sub_metering_2, type='l', col='red')
lines(power$datetime, power$Sub_metering_3, type='l', col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid')


plot(power$datetime, power$Global_reactive_power, type='l', ylab='Global_reactive_power', xlab='datetime')

# Shut device
dev.off()
