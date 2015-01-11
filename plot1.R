plot1 <- function() {
  
  #Read the data from the file using the read.table function
  epcdata <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", as.is=TRUE, na.strings = "?")
  
  #Extract the required data for the two dates specified in the problem
  epcreqdata <- epcdata[(epcdata$Date=="1/2/2007" | epcdata$Date == "2/2/2007"),]
  
  #Open the png graphic device with required specifications
  png("plot1.png", width = 480, height = 480)
  
  #Generate a histogram for Global_active_power in red color with the specified labels
  hist(epcreqdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
  
  #Shut the graphic device off
  dev.off()

}