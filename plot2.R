## project #1 for Exploratory Data Analysis
## by John H. Woo

## Plot 2.
## appears to be a plot with 3 lines.

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

## Open the device
png(file="plot2.png")

## Now let's do the plot
plot(dateandtime,
     data_0$Global_active_power,
     type="l", ## line, not circles
     ylab="Global Active Power (kilowatts)", ## y axis label
     xlab="") ## no x axis label

## Now let's copy to the png
dev.off()

