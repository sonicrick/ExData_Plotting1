setwd("~/GitHub/ExData_Plotting1")

#get data to plot from pre-saved variable in file plotdata.RData
#see filterData.R for creation of plotdata.RData from original source
load("plotdata.RData")

png(file="plot3.png")

#set frame
plot(data$Sub_metering_1, type="l", col="black"
     , xaxt="n", xlab=""  #suppress x axis and label
     , ylab="Energy sub metering"
     )
tickLocations <- c(1
                   , which(data$Date == strptime("2007-02-02", "%Y-%m-%d"))[1] #first occurence of second date
                   , nrow(data))  #last data
tickLabels <- c("Thu", "Fri", "Sat")
axis(1, at=tickLocations, labels=tickLabels)

#plot lines

lines(data$Sub_metering_2, col = "red")
lines(data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty="solid"
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()