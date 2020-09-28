
# Read in the data (assuming you data is in a folder "data" in your working directory)
hpc <- read.table(unz("./data/exdata_data_household_power_consumption.zip", 
                      "household_power_consumption.txt"), header=T, sep = ";")

# Make dates read as date and select the first two days of February 2007
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc_select <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")

# Create Plot 1
hpc_select$Global_active_power <- as.numeric(hpc_select$Global_active_power)
hist(hpc_select$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# Copy to png
dev.copy(png, file = "plot1.png")
dev.off()
