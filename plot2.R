HPC <- read.csv("~/Coursera/Course3/Week1/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", 
                stringsAsFactors=FALSE)
HPC$Date = as.Date(HPC$Date, format = "%d/%m/%Y")

HPD = HPC[HPC$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")) ,]

HPD$Time2 = as.POSIXlt(paste(HPD$Date, HPD$Time, sep=" "))

HPD$Global_active_power = as.numeric(HPD$Global_active_power)

par(mfrow=c(1,1))

#Creating the plot
plot(HPD$Time2,HPD$Global_active_power, type="n",
     main=NULL,
     xlab="",
     ylab = "Global Active Power (kilowatts)")
lines(HPD$Time2,HPD$Global_active_power)

#Exporting to PNG
dev.copy(png, file="plot2.png")
dev.off()