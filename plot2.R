setwd("~/GitHub/ExData_Plotting1")

#get data to plot from pre-saved variable in file plotdata.RData
#see filterData.R for creation of plotdata.RData from original source
load("plotdata.RData")

png(file="plot2.png")
plot(data$Global_active_power, type="l"
     , xaxt="n", xlab=""  #suppress x axis and label
     , ylab="Global Active Power (kilowatts)"
     )
tickLocations <- c(1
                   , which(data$Date == strptime("2007-02-02", "%Y-%m-%d"))[1] #first occurence of second date
                   , nrow(data))  #last data
tickLabels <- c("Thu", "Fri", "Sat")
axis(1, at=tickLocations, labels=tickLabels)
dev.off()