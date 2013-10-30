require(reshape)
require(ggplot2)


ftse <- read.table("ftse_all.csv",sep=",",header=T)

ftse_melt <- melt(
     ftse,
     id.vars = c(
          "year",
          "biann",
          "Cons_code",
          "SEDOL",
          "ISIN",
          "Local_Identifier",
          "Constituent_name",
          "Country_code",
          "ISO_Code",
          "Exchange_code",
          "Industry_Code",
          "Supersector_Code",
          "Sector_Code",
          "Subsector_Code"
     ),
     measure.vars = names(ftse)[13:56]
)


# ggplot(
#      data=subset(ftse_melt,Local_Identifier == levels(ftse_melt$Local_Identifier)[20:40] & variable == "Overall_Rating_.Absolute."),
#      aes(x=factor(year),y=value)
# )+
#      geom_point()+
#      geom_path()+
#      facet_wrap(~Local_Identifier)

# vals <- rnorm(3)
# n    <- length(vals)
# lhs  <- paste("a",    1:n,     sep="")
# rhs  <- paste("vals[",1:n,"]", sep="")
# eq   <- paste(paste(lhs, rhs, sep="<-"), collapse=";")
# eval(parse(text=eq))

names(ftse)


lhs<- paste("ftse", rep(2008:2013,each=2), rep(1:2), sep="_")
rhs <- paste(
     "as.character(subset(ftse,year==",rep(2008:2013,each=2),"&biann==",rep(1:2),",Cons_code)[[1]])",
     sep=""
     )
eq <- paste(paste(lhs, rhs, sep="<-"), collapse=";")
eval(parse(text=eq))


present_matrix <- matrix(ncol=12,nrow=length(unique(ftse[,1])))

present_matrix[,1] <- as.character(unique(ftse[,1]))

# for(k in 1:12) { 
# 
# #for (i in 1:length(present_matrix[,1])) {
#      
#      i <- 1
#  
#      present_matrix[i,k] <- present_matrix[i,1] %in% subset(ftse,year==2013 ,Cons_code)[[1]]
# #}

}

rowReps <- rep(1:806,11)
colReps <- rep(2:12,each=806)
yearReps <- rep(rep(2008:2013,each=2)[-12],length.out=length(rowReps))
biannReps <- rep(1:2,length.out=length(rowReps))

lhs <- paste("present_matrix[",rowReps,",",colReps,"]",sep="")
rhs <- paste("present_matrix[",rowReps,",1] %in% subset(ftse,year==",yearReps,"&biann==",biannReps,",Cons_code)[[1]]",sep="")
eq <- paste(paste(lhs, rhs, sep="<-"), collapse=";")
eval(parse(text=eq))

included_matrix <- matrix(ncol=12,nrow=length(unique(ftse[,1])))
included_matrix[,1] <- as.character(unique(ftse[,1]))


     
# for (j in 2:13) {     
#      
#      yearRep <- c(0,rep(2008:2013,each=2)[-12])
#      biannRep <- c(0,rep(1:2,length.out=11))
# 
#  for (i in 1:length(included_matrix[,1])) {
#       
# try(    
# included_matrix[i,2] <-
#      as.character(subset(ftse,Cons_code==included_matrix[i,1]&year==yearRep[j]&biann==biannRep[j],Included_in_F4G_Series)[[1]])
# )
#      
#  }
# 
#  
# }
 

for (i in 1:length(included_matrix[,1])) {
     
     try( 
         included_matrix[i,2] <- 
          as.character(subset(ftse,Cons_code==included_matrix[i,1]&year==2008&biann==1,Included_in_F4G_Series)[[1]])
          )
     try( 
          included_matrix[i,3] <- 
               as.character(subset(ftse,Cons_code==included_matrix[i,1]&year==2008&biann==2,Included_in_F4G_Series)[[1]])
     )
     try( 
          included_matrix[i,4] <- 
               as.character(subset(ftse,Cons_code==included_matrix[i,1]&year==2009&biann==1,Included_in_F4G_Series)[[1]])
     )
     try( 
          included_matrix[i,5] <- 
               as.character(subset(ftse,Cons_code==included_matrix[i,1]&year==2009&biann==2,Included_in_F4G_Series)[[1]])
     )
     try( 
          included_matrix[i,6] <- 
               as.character(subset(ftse,Cons_code==included_matrix[i,1]&year==2010&biann==1,Included_in_F4G_Series)[[1]])
     )
     try( 
          included_matrix[i,7] <- 
               as.character(subset(ftse,Cons_code==included_matrix[i,1]&year==2010&biann==2,Included_in_F4G_Series)[[1]])
     )
     try( 
          included_matrix[i,8] <- 
               as.character(subset(ftse,Cons_code==included_matrix[i,1]&year==2011&biann==1,Included_in_F4G_Series)[[1]])
     )
     try( 
          included_matrix[i,9] <- 
               as.character(subset(ftse,Cons_code==included_matrix[i,1]&year==2011&biann==2,Included_in_F4G_Series)[[1]])
     )
     try( 
          included_matrix[i,10] <- 
               as.character(subset(ftse,Cons_code==included_matrix[i,1]&year==2012&biann==1,Included_in_F4G_Series)[[1]])
     )
     try( 
          included_matrix[i,11] <- 
               as.character(subset(ftse,Cons_code==included_matrix[i,1]&year==2012&biann==2,Included_in_F4G_Series)[[1]])
     )
     try( 
          included_matrix[i,12] <- 
               as.character(subset(ftse,Cons_code==included_matrix[i,1]&year==2013&biann==1,Included_in_F4G_Series)[[1]])
     )
     
}


included_matrix <- data.frame(included_matrix)
colnames(included_matrix) <- c("Cons_code",paste(rep(2008:2013,each=2)[-12],rep(1:2),sep="_"))
write.table(included_matrix,"included.csv",sep=",",row.names=FALSE)





present_matrix <- data.frame(present_matrix)
colnames(present_matrix) <- c("Cons_code",paste(rep(2008:2013,each=2)[-12],rep(1:2),sep="_"))

names(ftse)

write.table(present_matrix,"present.csv",sep=",",row.names=FALSE)


