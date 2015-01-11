plot2 <- function() {
  
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
  png("plot2.png", width = 480, height = 480)
  
  #Plot the graph area with the desired labels
  plot(epcreqdata$dateandtime, epcreqdata$Global_active_power, type="n", ylab = "Global Active Power (kilowatts)", xlab = "")
  
  #Draw lines to generate the required graph
  lines(epcreqdata$dateandtime, epcreqdata$Global_active_power)
  
  #Shut the PNG graphic device off 
  dev.off()
  
  
}