setwd("~/GitHub/ExData_Plotting1")

#get data to plot from pre-saved variable in file plotdata.RData
#see filterData.R for creation of plotdata.RData from original source
load("plotdata.RData")

png(file="plot1.png")
hist(data$Global_active_power, main = "Global Active Power"
     , ylab = "Frequency", xlab = "Global Active Power (kilowatts)"
     , col = "red")
dev.off()