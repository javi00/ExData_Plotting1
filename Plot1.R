
# first unzip the file and  read like a table
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), sep = ";", header = TRUE, colClasses = "character")

# remove the NA or ? if the data
dataf <-  subset(data, Global_active_power != "?")
# review fo data
summary(as.numeric(dataf$Global_active_power))

#convert Date column to Date class
dataf$Date <- as.Date(dataf$Date, "%d/%m/%Y")

#subset by date 2007-02-01 and 2007-02-02
dataff <-  subset(dataf, Date >= "2007-02-01" & Date <= "2007-02-02")

# convert the column "character to numeric
dataff$Global_active_power <- as.numeric(dataff$Global_active_power)

#open device png

png(filename = "C:\\plot1.png", width = 480, height = 480, units = "px", bg = "white")

#  plot
hist(dataff$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
# close device
dev.off()




