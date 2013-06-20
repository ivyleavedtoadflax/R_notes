
# list files in folder

file_list <- list.files()

# limit to comma separated values files

file_list <- file_list[grep(".csv",file_list)]

# load each file, and assign unique name

for (i in 1:length(file_list)) {

assign(
     paste(
          "ftse_",
          strsplit(file_list[i],".csv")[1],
          sep=""
          ),
     subset(
          read.table(
          file_list[i],
          header=T,
          skip=3,
          sep=","
          ),
#           ,
#           c("Local_Identifier","Constituent_name","")
     )
)

}


ftse_2008_1$year <- 2008
ftse_2008_1$biann <- 1
ftse_2008_2$year <- 2008
ftse_2008_2$biann <- 2
ftse_2009_1$year <- 2009
ftse_2009_1$biann <- 1
ftse_2009_2$year <- 2009
ftse_2009_2$biann <- 2
ftse_2010_1$year <- 2010
ftse_2010_1$biann <- 1
ftse_2010_2$year <- 2010
ftse_2010_2$biann <- 2
ftse_2011_1$year <- 2011
ftse_2011_1$biann <- 1
ftse_2011_2$year <- 2011
ftse_2011_2$biann <- 2
ftse_2012_1$year <- 2012
ftse_2012_1$biann <- 1
ftse_2012_2$year <- 2012
ftse_2012_2$biann <- 2
ftse_2013_1$year <- 2013
ftse_2013_1$biann <- 1

ftse_2009_2 <- subset(ftse_2009_2,,-CUSIP)

ftse <- rbind(
     ftse_2008_1,
     ftse_2008_2,
     ftse_2009_1,
     ftse_2009_2,
     ftse_2010_1,
     ftse_2010_2,
     ftse_2011_1,
     ftse_2011_2,
     ftse_2012_1,
     ftse_2012_2,
     ftse_2013_1
)

write.table(ftse,"ftse_all.csv",sep=",")