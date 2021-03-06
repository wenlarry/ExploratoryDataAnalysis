NEI<-readRDS("summarySCC_PM25.rds") 
SCC<-readRDS("Source_Classification_Code.rds") 

coalscc<-filter(SCC,grepl("Coal",EI.Sector) )

coalnei<-select(NEI,SCC,Emissions,year) 

coalj<-full_join(coalscc,coalnei,by="SCC") 

coalem<-select(coalj,year,Emissions)%>%group_by(year)%>%
summarize(emissions=sum(Emissions,na.rm=TRUE)) 

View(coalem) 

png(filename="plot5.png") 

ggplot(coalem,aes(year,emissions))+geom_line()+geom_point()+
labs(title="Total Emissions from motor vehicle sources
(Baltimore City)", x="Year",y="Total Emissions") 

dev.off() 