
# Read in the data (assuming you data is in a folder "data" in your working directory)
hpc <- read.table(unz("./data/exdata_data_household_power_consumption.zip", 
                      "household_power_consumption.txt"), header=T, sep = ";")
# Make dates read as date and select the first two days of February 2007
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc_select <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")

# Create DateTime
hpc_select$DateTime <- as.POSIXct(paste(hpc_select$Date, hpc_select$Time), format="%Y-%m-%d %H:%M:%S")

# Create Plot 4
par(mfrow = c(2, 2))
# top_left
with(hpc_select, plot(DateTime, Global_active_power, type = "n", 
                      xlab = "", ylab = "Global Active Power (kilowatts)"))
with(hpc_select, lines(DateTime, Global_active_power))
# top_right
with(hpc_select, plot(DateTime, Voltage, type = "n", 
                      xlab = "datetime", ylab = "Voltage"))
with(hpc_select, lines(DateTime, Voltage))
# bottom_left
with(hpc_select, plot(DateTime, c(Sub_metering_1), type = "n", 
                      xlab = "", ylab = "Energy sub metering"))
with(hpc_select, lines(DateTime, Sub_metering_1, col = "black"))
with(hpc_select, lines(DateTime, Sub_metering_2, col = "red"))
with(hpc_select, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", pch = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n", cex = 0.75)
# bottom_right
with(hpc_select, plot(DateTime, Global_reactive_power, type = "n", 
                      xlab = "datetime", ylab = "Global_reactive_power"))
with(hpc_select, lines(DateTime, Global_reactive_power))

# Copy to png
dev.copy(png, file = "plot4.png")
dev.off()
