
#Download "household_power_consumption.txt" file to 
#working directory
#  
#Import full text file into RStudio
#
#Rename full text file as 'alldata'
#
# (Use the Import Dataset function in RStudio)
#
# LoadR packages - readr, dplyr
#
#subset 'alldata' for relevant dates i.e 2007-02-01
#and2007-02-02

data<-slice(alldata,66637:69516) 


#Concatenate the date and time
data2= paste(data$Date,data$Time) 


#Convert date and time
data2<-strptime(data2,"%d/%m/%Y %H:%M:%OS")


# Plot
hist(as.numeric(as.character(data$Global_active_power )),
     main= "Global Active Power", xlab ="Global Active Power (kilowatts", ylab=
 "Frequency", col="red")  


#Saveto file
 dev.copy(png, file="plot1.png", height=480,width=480)     
 dev.off() 
 