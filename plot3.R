library(datasets)

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
data <- subset(df, df$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))


data$DateTime <- strptime(paste(data$Date, " ", data$Time), format = "%Y-%m-%d %H:%M:%S")

png(file = "plot3.png")
plot (data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", ylim=c(0,30))
points (data$DateTime, data$Sub_metering_2, type="l", col="red")
points (data$DateTime, data$Sub_metering_3, type="l", col="blue")

legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
