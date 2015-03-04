#############################################################
#
# plot2.R create the line plot
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
png(filename = "plot2.png", width = 480, height = 480)
# Plot
plot(power$datetime, power$Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab='')
# Shut device
dev.off()
