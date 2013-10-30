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

present_matrix <- data.frame(present_matrix)
colnames(present_matrix) <- c("Cons_code",paste(rep(2008:2013,each=2)[-12],rep(1:2),sep="_"))
# 
# 
# 
# 
# present_matrix[,1] <- ftse_LI
# present_matrix[,2] <- ftse[match(ftse_2008_1,ftse[,1]),1]
# present_matrix[,3] <- ftse_LI[match(ftse_LI2008_2,ftse_LI)]
# present_matrix[,4] <- ftse_LI[match(ftse_LI,ftse_LI2009_1)]
# present_matrix[,5] <- ftse_LI[match(ftse_LI,ftse_LI2009_2)]
# present_matrix[,6] <- ftse_LI[match(ftse_LI,ftse_LI2010_1)]
# present_matrix[,7] <- ftse_LI[match(ftse_LI,ftse_LI2010_2)]
# present_matrix[,8] <- ftse_LI[match(ftse_LI,ftse_LI2011_1)]
# present_matrix[,9] <- ftse_LI[match(ftse_LI,ftse_LI2011_2)]
# present_matrix[,10] <- ftse_LI[match(ftse_LI,ftse_LI2012_1)]
# present_matrix[,11] <- ftse_LI[match(ftse_LI,ftse_LI2012_2)]
# present_matrix[,12] <- ftse_LI[match(ftse_LI,ftse_LI2013_1)]
# 
# head(present_matrix)
# present_matrix[,2]

write.table(present_matrix,"present.csv",sep=",",row.names=FALSE)


