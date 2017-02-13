
library(lubridate)

# Read data

data_1 <- read.table("Data/household_power_consumption.txt", 
                     sep = ";", header = TRUE)

# Tidying data

data_1$Date <- dmy(data_1$Date)
data_2 <- data_1[data_1$Date >= "2007-02-01" & data_1$Date <= "2007-02-02", ]

data_2$Date_1 <- paste0(data_2$Date, data_2$Time)
data_2$Date_1 <- ymd_hms(data_2$Date_1)

data_2$Global_active_power <- as.numeric(data_2$Global_active_power)/1000*2
data_2$Global_reactive_power <- as.numeric(data_2$Global_reactive_power)
data_2$Voltage <- as.numeric(data_2$Voltage)
data_2$Sub_metering_1 <- as.numeric(data_2$Sub_metering_1)
data_2$Sub_metering_2 <- as.numeric(data_2$Sub_metering_2)
data_2$Sub_metering_3 <- as.numeric(data_2$Sub_metering_3)

# Build the graph

png("plot4.png", width=480, height = 480)
par(mfrow=c(2,2))
plot(data_2$Date_1, data_2$Global_active_power, type = "l",
     xlab="", ylab="Global Active Power", cex=0.2)
plot(data_2$Date_1, data_2$Voltage, type = "l",
     xlab="datetime", ylab="Voltage")
plot(data_2$Date_1, data_2$Sub_metering_1, type="l", 
     ylab="Energy sub metering", xlab="")
lines(data_2$Date_1, data_2$Sub_metering_2, type="l", col = "red")
lines(data_2$Date_1, data_2$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=, lwd=2.5, col=c("black", "red", "blue"),bty="o")
plot(data_2$Date_1, data_2$Global_reactive_power, type="l", xlab="datetime",
     ylab="Global Reactive Power")
dev.off()
