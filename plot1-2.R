#Download zip file ' exdata-data=NEI_data' to working
# directory and unzipped file

#Read files

NEI<-readRDS("summarySCC_PM25.rds") 
SCC<-readRDS("Source_Classification_Code.rds") 

#Plot

par("mar"=c(5.1,4.5,4.1,2.1)) 

png(filename="plot1.png",width=480,height=480,units="px") 

usemissions<-aggregate(NEI$Emissions,list(NEI$year),FUN="sum") 

plot(usemissions,type="l",xlab="Year",main="Total Emissions
     in USA from 1999 to 2008" ,          ylab="total PM2.5 emission" ) 

dev.off() 