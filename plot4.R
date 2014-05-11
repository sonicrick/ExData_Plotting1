setwd("~/GitHub/ExData_Plotting1")

#get data to plot from pre-saved variable in file plotdata.RData
#see filterData.R for creation of plotdata.RData from original source
load("plotdata.RData")

png(file="plot4.png")
par(mfcol = c(2,2))
tickLocations <- c(1
                   , which(data$Date == strptime("2007-02-02", "%Y-%m-%d"))[1] #first occurence of second date
                   , nrow(data))  #last data
tickLabels <- c("Thu", "Fri", "Sat")

####Plot 1
plot(data$Global_active_power, type="l"
     , xaxt="n", xlab=""  #suppress x axis and label
     , ylab="Global Active Power"
)
axis(1, at=tickLocations, labels=tickLabels)


####Plot 2
#set frame
plot(data$Sub_metering_1, type="l", col="black"
     , xaxt="n", xlab=""  #suppress x axis and label
     , ylab="Energy sub metering"
     )
lines(data$Sub_metering_2, col = "red")
lines(data$Sub_metering_3, col = "blue")
axis(1, at=tickLocations, labels=tickLabels)
legend("topright", col = c("black", "red", "blue"), lty="solid", bty="n"
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

####Plot 3
plot(data$Voltage, type="l"
     , xaxt="n", xlab="datetime" #suppress x axis
     , ylab="Voltage"
    )
axis(1, at=tickLocations, labels=tickLabels)


####Plot 4
with(data, plot(Global_reactive_power, type="l"
                , xaxt="n", xlab="datetime" #suppress x axis
    ))
axis(1, at=tickLocations, labels=tickLabels)


dev.off()