data <- read.table("household_power_consumption.txt", header=TRUE, sep=";") ## Read data in table

data$Date <- as.Date(data$Date, "%d/%m/%Y") ## Convert date in common format

## Subset the data
sub.data <- rbind(subset(data, data$Date == "2007-02-01"), subset(data, data$Date == "2007-02-02")) 

time.data <- paste(sub.data$Date, sub.data$Time) ## Paste columns with date and time in one place
x <- strptime(time.data, "%Y-%m-%d %H:%M:%S") ## Convert time in common format

sub.metering1 <- as.numeric(as.character(sub.data$Sub_metering_1)) ## convert data into numeric format
sub.metering2 <- as.numeric(as.character(sub.data$Sub_metering_2)) ## convert data into numeric format
sub.metering3 <- as.numeric(as.character(sub.data$Sub_metering_3)) ## convert data into numeric format
y <- paste(sub.metering1,sub.metering2,sub.metering3)

## Plot
png(file = "plot3.png", width = 480, height = 480, bg = "transparent")

plot(x, sub.metering1, type = "l", xlab = "", ylab="Energy sub metering")
lines(x, sub.metering2, col = "Red")
lines(x, sub.metering3, col = "Blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("Black", "Red", "Blue"), lty=1)

dev.off()
