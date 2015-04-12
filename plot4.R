data <- read.table("household_power_consumption.txt", header=TRUE, sep=";") ## Read data in table

data$Date <- as.Date(data$Date, "%d/%m/%Y") ## Convert date in common format

## Subset the data
sub.data <- rbind(subset(data, data$Date == "2007-02-01"), subset(data, data$Date == "2007-02-02")) 

time.data <- paste(sub.data$Date, sub.data$Time) ## Paste columns with date and time in one place
x <- strptime(time.data, "%Y-%m-%d %H:%M:%S") ## Convert time in common format


png(file = "plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow = c(2,2)) # Set the multiplot

# Plot 1

y <- as.numeric(as.character(sub.data$Global_active_power)) ## convert column into numeric format
plot(x, y, type = "l", xlab = "",
     ylab="Global Active Power"
)

# Plot 2

y <- as.numeric(as.character(sub.data$Voltage)) ## convert data into numeric format
plot(x, y, type = "l", xlab = "datetime",
     ylab="Voltage"
)

# Plot 3

sub.metering1 <- as.numeric(as.character(sub.data$Sub_metering_1)) ## convert data into numeric format
sub.metering2 <- as.numeric(as.character(sub.data$Sub_metering_2)) ## convert data into numeric format
sub.metering3 <- as.numeric(as.character(sub.data$Sub_metering_3)) ## convert data into numeric format
y <- paste(sub.metering1,sub.metering2,sub.metering3)

plot(x, sub.metering1, type = "l", xlab = "", ylab="Energy sub metering")
lines(x, sub.metering2, col = "Red")
lines(x, sub.metering3, col = "Blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("Black", "Red", "Blue"), lty=1, bty = "n", cex = 0.9)

# Plot 4

y <- as.numeric(as.character(sub.data$Global_reactive_power)) ## convert column into numeric format
plot(x, y, type = "l", xlab = "datetime",
     ylab="Global_reactive_power"
)

dev.off()

