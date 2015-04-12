## project #1 for Exploratory Data Analysis
## by John H. Woo

## Plot 4.
## appears to be 4 separate plots

## only data from 2007-02-01 and 2007-02-02.

## read the data
## data are separated by semicolons
## there is a header.
## NA is coded by "?"

print("Wait... reading in the data")
classes<-c(rep("character",2),rep("numeric",7))
data<- read.table("household_power_consumption.txt",
                  sep = ";", colClasses=classes, header=TRUE,
                  na.strings="?")
print("Done!")

## Next we only want the data from 2007-02-01 and 2007-02-02.  
## let's use the subset function.

data_0 <- subset(data,Date=="1/2/2007" | Date=="2/2/2007")

## next we need to combine date and time into a single var
dateandtime<-strptime(paste(data_0$Date,data_0$Time),format="%d/%m/%Y %H:%M:%S")

## open png
png(file="plot4.png")

## set up for 4 plots
par(mfrow=c(2,2))

## First do plot2

plot(dateandtime,
     data_0$Global_active_power,
     type="l", ## line, not circles
     ylab="Global Active Power (kilowatts)", ## y axis label
     xlab="") ## no x axis label

## Next do plot of voltage v datetime

plot(dateandtime,data_0$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")

## Next do plot3?
plot(dateandtime,
     data_0$Sub_metering_1,
     type="l", ## line, not circles
     ylab="Energy sub metering", ## y axis label
     xlab="") ## no x axis label

##now add 2 and 3
lines(dateandtime,
      data_0$Sub_metering_2,
      col="red") ## red

lines(dateandtime,
      data_0$Sub_metering_3,
      col="blue") ## red

##now add legend
legend("topright",lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n") ## no box around the legend

## Next do plot of reactive_power v datetime

plot(dateandtime,data_0$Global_reactive_power,
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime")


dev.off()
