
library(lubridate)

# Read data

data_1 <- read.table("Data/household_power_consumption.txt", 
                     sep = ";", header = TRUE)

# Tidying data

data_1$Date_1 <- paste0(data_1$Date, data_1$Time)
data_1$Date_1 <- dmy_hms(data_1$Date_1)
data_1$Date <- dmy(data_1$Date)

data_1$Sub_metering_1 <- as.numeric(data_1$Sub_metering_1)
data_1$Sub_metering_2 <- as.numeric(data_1$Sub_metering_2)
data_1$Sub_metering_3 <- as.numeric(data_1$Sub_metering_3)

# Select data we will use data from the dates 2007-02-01 and 2007-02-02

data_2 <- data_1[data_1$Date >= "2007-02-01" & data_1$Date <= "2007-02-02", ]

# Build the graph

png("plot3.png", width=480, height = 480)
plot(data_2$Date_1, data_2$Sub_metering_1, type="l", 
     ylab="Energy sub metering", xlab="")
lines(data_2$Date_1, data_2$Sub_metering_2, type="l", col = "red")
lines(data_2$Date_1, data_2$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

