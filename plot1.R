data <- read.table("household_power_consumption.txt", header=TRUE, sep=";") ## Read data in table

data$Date <- as.Date(data$Date, "%d/%m/%Y") ## Convert date in common format

## Subset the data
sub.data <- rbind(subset(data, data$Date == "2007-02-01"), subset(data, data$Date == "2007-02-02")) 

y <- as.numeric(as.character(sub.data$Global_active_power)) ## convert column into numeric format


png(file = "plot1.png", width = 480, height = 480, bg = "transparent")
hist(y, 
     xlab = "Global Active Power (kilowatts)", 
     ylab="Frequency", 
     main = "Global Active Power",
     xlim = c(0,6),
     ylim = c(0, 1200),
     col = "Red"
     )

dev.off()
