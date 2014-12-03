HPC <- read.csv("~/Coursera/Course3/Week1/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", 
                stringsAsFactors=FALSE)
HPC$Date = as.Date(HPC$Date, format = "%d/%m/%Y")

HPD = HPC[HPC$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")) ,]

HPD$Time2 = as.POSIXlt(paste(HPD$Date, HPD$Time, sep=" "))

HPD$Global_active_power = as.numeric(HPD$Global_active_power)

HPD$Sub_metering_1 = as.numeric(HPD$Sub_metering_1)
HPD$Sub_metering_2 = as.numeric(HPD$Sub_metering_2)
HPD$Sub_metering_3 = as.numeric(HPD$Sub_metering_3)

par(mfrow=c(1,1))

#Creating the plot
plot(HPD$Time2,HPD$Sub_metering_1,
     type="n",
     main=NULL,
     xlab="",
     ylab = "Energy sub metering")
lines(HPD$Time2,HPD$Sub_metering_1)
lines(HPD$Time2,HPD$Sub_metering_2, col="red")
lines(HPD$Time2,HPD$Sub_metering_3, col="blue")
legend("topright",
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       cex=0.6,
       y.intersp=0.6,
       )

#Exporting to PNG
dev.copy(png, file="plot3.png")
dev.off()