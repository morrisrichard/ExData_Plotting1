
# Read in the data (assuming you data is in a foler "data" in your working directory)
hpc <- read.table(unz("./data/exdata_data_household_power_consumption.zip", 
                      "household_power_consumption.txt"), header=T, sep = ";")
# Make dates read as date and select the first two days of February 2007
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc_select <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")

# Create DateTime
hpc_select$DateTime <- as.POSIXct(paste(hpc_select$Date, hpc_select$Time), format="%Y-%m-%d %H:%M:%S")

# Create Plot 2
with(hpc_select, plot(DateTime, Global_active_power, type = "n", 
                      xlab = "", ylab = "Global Active Power (kilowatts)"))
with(hpc_select, lines(DateTime, Global_active_power))

# Copy to png
dev.copy(png, file = "plot2.png")
dev.off()