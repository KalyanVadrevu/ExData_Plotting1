plot1 <- function() {
  
  epcdata <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", as.is=TRUE, na.strings = "?")
  
  epcreqdata <- epcdata[(epcdata$Date=="1/2/2007" | epcdata$Date == "2/2/2007"),]
  
  epcreqdata$Date <- as.Date(epcreqdata$Date,"%d/%m/%Y")
  
  epcreqdata$Time <- strptime(epcreqdata$Time, "%H:%M:%S")
  
  png("plot1.png", width = 480, height = 480)
    
  hist(epcreqdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
  
  dev.off()

}