library(lubridate)

# Read data

data_1 <- read.table("Data/household_power_consumption.txt", 
                     sep = ";", header = TRUE)

# Tidying data

data_1$Date <- dmy(data_1$Date)

# Select data we will use data from the dates 2007-02-01 and 2007-02-02

data_2 <- data_1[data_1$Date >= "2007-02-01" & data_1$Date <= "2007-02-02", ]

#  Histogram  Global active Power

GlobalActivePower <- as.numeric(data_2$Global_active_power)/1000*2

png("plot1.png", width=480, height = 480)
hist(GlobalActivePower, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylab="")
dev.off()
