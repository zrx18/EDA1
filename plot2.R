data <- read.table("household_power_consumption.txt", header=TRUE, sep=";") ## Read data in table

data$Date <- as.Date(data$Date, "%d/%m/%Y") ## Convert date in common format

## Subset the data
sub.data <- rbind(subset(data, data$Date == "2007-02-01"), subset(data, data$Date == "2007-02-02")) 

time.data <- paste(sub.data$Date, sub.data$Time) ## Paste columns with date and time in one place
x <- strptime(time.data, "%Y-%m-%d %H:%M:%S") ## Convert time in common format

y <- as.numeric(as.character(sub.data$Global_active_power)) ## convert column into numeric format

## Plot
png(file = "plot2.png", width = 480, height = 480, bg = "transparent")

plot(x, y, type = "l", xlab = "",
     ylab="Global Active Power (kilowatts)"
     )

dev.off()
