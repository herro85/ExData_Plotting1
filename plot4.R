library(datasets)

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
data <- subset(df, df$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))


data$datetime <- strptime(paste(data$Date, " ", data$Time), format = "%Y-%m-%d %H:%M:%S")

png(file = "plot4.png")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

#Cast back to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
plot (data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

data$Voltage <- as.numeric(as.character(data$Voltage))
plot (data$datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

#graph 3
plot (data$datetime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", ylim=c(0,30))
points (data$datetime, data$Sub_metering_2, type="l", col="red")
points (data$datetime, data$Sub_metering_3, type="l", col="blue")

legend("topright", bty = "n", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#graph4
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
plot (data$datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", ylim=c(0.0,0.5))

dev.off()
