## project #1 for Exploratory Data Analysis
## by John H. Woo

## Plot 1.
## appears to be a histogram plot

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

## Open a png device
png(file="plot1.png")

## Now let's do the histogram plot
hist(data_0$Global_active_power,
     col="red", ## red
     main="Global Active Power", ## title
     xlab="Global Active Power (kilowatts)")

## close the device
dev.off()

