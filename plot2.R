
# read the specific rows in the file

hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", na.strings = "?",
                  col.names = colnames(read.table("household_power_consumption.txt",
                                                  nrow = 1, header = TRUE, sep=";")))


#convert date and time

hpc$Time <- with(hpc, paste(Date, Time, sep=" "))
hpc$Date <- NULL
hpc$Time <- strptime(hpc$Time, "%d/%m/%Y %H:%M:%S")

#plot

plot(hpc$Time, hpc$Global_active_power, type="l", xlab = "" , ylab= "Global Active Power (Kilowatts)")


#copy plot to png file

dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()
