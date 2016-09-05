#Download zip file ' exdata-data=NEI_data' to working
# directory and unzipped file

#Read file

NEI<-readRDS("summarySCC_PM25.rds") 
SCC<-readRDS("Source_Classification_Code.rds") 

#Subset Baltimore City

bc<-NEI[NEI$fips=="24510",] 

#Plot

par("mar"=c(5.1,4.5,4.1,2.1)) 

png(filename="plot2.png",width=480,height=480, units="px")

bcemissions<-aggregate(bc$Emissions,list(bc$year),FUN="sum")

plot(bcemissions,type="l",xlab="Year",main="Total Emissions
     in Balitimore City (1999 to 2008)", 
     ylab="total PM2.5 emission") 

dev.off() 