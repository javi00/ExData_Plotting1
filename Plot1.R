library(datasets)

# first unzip the file and  read like a table
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), sep = ";", header = TRUE, colClasses = "character")

# open a window device 480 x 480


# remove the NA or ? data
dataf <-  subset(data, Global_active_power != "?")
summary(as.numeric(dataf$Global_active_power))
dataf$Date <- as.Date(dataf$Date, "%d/%m/%Y")
dataf$Global_active_power <- as.numeric(dataf$Global_active_power)

