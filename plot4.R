plot4 <- function() {
  
  #Read the data from the file using the read.table function
  epcdata <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", as.is=TRUE, na.strings = "?")
  
  #Extract the required data for the two dates specified in the problem
  epcreqdata <- epcdata[(epcdata$Date=="1/2/2007" | epcdata$Date == "2/2/2007"),]

  #Build a new column by combining the date and time columns
  epcreqdata <- cbind(epcreqdata, strptime(paste(epcreqdata$Date, epcreqdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))

  #Call the new column 'dateandtime'. This column will be used to build the plot
  test3 <- colnames(epcreqdata)
  test3[10] <- "dateandtime"
  colnames(epcreqdata) <- test3
  
  #Open the png graphic device with the desired specifications
  png("plot4.png", width = 480, height = 480)
  
  #Set up the graph area
  par(mfcol = c(2,2), mar = c(4,4,2,1), oma = c(0, 0, 2, 0))
  
  with(epcreqdata, {
    
    #Plot in the top left corner
    {
      plot(dateandtime, Global_active_power, type="n", ylab = "Global Active Power", xlab = "")
      
      lines(dateandtime, Global_active_power)
    }
    
    #Plot in the bottom left corner
    {
       plot(dateandtime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="n")
     
       lines(dateandtime, Sub_metering_1)
       
       lines(dateandtime, Sub_metering_2, col="red")
       
       lines(dateandtime, Sub_metering_3, col="blue")
             
       #Add a legend on the top right with border
       legend("topright", pch = 32, col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    }
    
    #Plot in the top right corner
    {
      plot(dateandtime, Voltage, type="n", ylab = "Voltage", xlab = "datetime")
      
      lines(dateandtime, Voltage)
    }
    
    #Plot in the bottom right corner
    {
      plot(dateandtime, Global_reactive_power, type="n", ylab = "Global_reactive_power", xlab = "datetime")
      
      lines(dateandtime, Global_reactive_power) 
    }
    
  })
  
  #Shut the PNG graphic device off
  dev.off()
  
  
}