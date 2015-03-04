
#############################################################
#
# plot3.R create the histogram plot
#
#############################################################

# Prep the data for the pple
source("PrepData.R")
power<-getData()
# Create png device
png(filename = "plot3.png", width = 480, height = 480)
# Plot
plot(power$datetime, power$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(power$datetime, power$Sub_metering_2, type='l', col='red')
lines(power$datetime, power$Sub_metering_3, type='l', col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid')
# Shut device
dev.off()
