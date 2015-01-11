plot3 <- function() {
  
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
  png("plot3.png", width = 480, height = 480)
  
  #Set up the graph area
  with(epcreqdata, plot(dateandtime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="n"))
  
  #Draw lines in default (black) color for the Sub_metering_1
  with(epcreqdata, lines(dateandtime, Sub_metering_1))
  
  #Draw lines in red color for the Sub_metering_2
  with(epcreqdata, lines(dateandtime, Sub_metering_2, col="red"))
    
  #Draw lines in blue color for the Sub_metering_3
  with(epcreqdata, lines(dateandtime, Sub_metering_3, col="blue"))
    
  #Add legend with the desired specifications in the top right corner of the graph area
  legend("topright", pch = 32, col = c("black", "red", "blue"), lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  #Shut the PNG graphic device off
  dev.off()
  
  
}