#############################################################
#
# plot1.R create the histogram plot
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
png(filename = "plot1.png", width = 480, height = 480)
# Plot
hist(power$Global_active_power, col='Red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
# Shut device
dev.off()
