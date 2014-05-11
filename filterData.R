### one-time extraction of data for plotting by plot1.R - plot4.R, to avoid repeated reads

setwd("~/GitHub/ExData_Plotting1")

zipname <- "exdata-data-household_power_consumption.zip"
txtname <- "household_power_consumption.txt"
startDate <- strptime("2007-02-01", "%Y-%m-%d")
endDate <- strptime("2007-02-02", "%Y-%m-%d")

# read just first column to check for rows in the right date range
# ASSUMPTION: data file already sorted ascending by Date
cols <- rep("NULL", 9)
cols[1] <- NA #set only first column, all other columns NULL to be ignored
dateCheck <- read.table(unz(zipname, txtname), header=T, sep=";", colClasses = cols)
dates <- strptime(dateCheck$Date, "%d/%m/%Y")
nStart <- which.max(dates >= startDate) #first row where date is no earlier than startDate
nEnd <- which.min(dates <= endDate) #last row where date is no later than endDate

### read just to get header names
headOnly  <- read.table(unz(zipname, txtname), header=T, sep=";", nrows = 1)

### read just rows from nStart to nEnd
data <- read.table(unz(zipname, txtname), sep=";" , skip=nStart, nrows=(nEnd - nStart))
names(data) <- names(headOnly) #set header name

data$Date <- strptime(data$Date, "%d/%m/%Y")

save(data, file="plotdata.RData")
