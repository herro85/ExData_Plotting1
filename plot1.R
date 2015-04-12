library(datasets)

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
data <- subset(df, df$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")) & df$Global_active_power != "?")

gap <- df$Global_active_power

#Cast back to numeric
gap <- as.numeric(as.character(gap))

png(file = "plot1.png")
hist(gap, main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()