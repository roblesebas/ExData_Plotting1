library(lubridate)


# Read data

data_1 <- read.table("Data/household_power_consumption.txt", 
                     sep = ";", header = TRUE)

# Tidying data

data_1$Date_1 <- paste0(data_1$Date, data_1$Time)
data_1$Date_1 <- dmy_hms(data_1$Date_1)
data_1$Date <- dmy(data_1$Date)

# Select data we will use data from the dates 2007-02-01 and 2007-02-02

data_2 <- data_1[data_1$Date >= "2007-02-01" & data_1$Date <= "2007-02-02", ]
data_2$Global_active_power <- as.numeric(data_2$Global_active_power)/1000*2

# Build the graph

png("plot2.png", width=480, height = 480)
plot(y = data_2$Global_active_power, x = data_2$Date_1, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
