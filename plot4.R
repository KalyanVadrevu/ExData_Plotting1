plot4 <- function() {
  
  epcdata <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", as.is=TRUE, na.strings = "?")
  
  epcreqdata <- epcdata[(epcdata$Date=="1/2/2007" | epcdata$Date == "2/2/2007"),]

  epcreqdata <- cbind(epcreqdata, strptime(paste(epcreqdata$Date, epcreqdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))

  test3 <- colnames(epcreqdata)
  
  test3[10] <- "dateandtime"
  
  colnames(epcreqdata) <- test3
  
  png("plot4.png", width = 480, height = 480)
  
  par(mfcol = c(2,2), mar = c(4,4,2,1), oma = c(0, 0, 2, 0))
  
  with(epcreqdata, {
    
    {
      plot(dateandtime, Global_active_power, type="n", ylab = "Global Active Power (kilowatts)", xlab = "")
      
      lines(dateandtime, Global_active_power)
    }
    
    
    {
       plot(dateandtime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="n")
     
       lines(dateandtime, Sub_metering_3, col="blue")
       
       lines(dateandtime, Sub_metering_2, col="red")
       
       lines(dateandtime, Sub_metering_1)
       
       legend("topright", pch = 32, col = c("black", "blue", "red"), lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    }
    
    {
      plot(dateandtime, Voltage, type="n", ylab = "Voltage", xlab = "datetime")
      
      lines(dateandtime, Voltage)
    }
    
    {
      plot(dateandtime, Global_reactive_power, type="n", ylab = "Global_reactive_power", xlab = "datetime")
      
      lines(dateandtime, Global_reactive_power) 
    }
    
  })
  
  dev.off()
  
  
}