
require(reshape)


included <- read.table("included.csv",header=T,sep=",")
present <- read.table("present.csv",header=T,sep=",")

colnames(included) <- c("Cons_code",paste("includedF4G",rep(2008:2013,each=2)[-12],rep(1:2),sep="_"))
colnames(present) <- c("Cons_code",paste("present",rep(2008:2013,each=2)[-12],rep(1:2),sep="_"))

clean <- merge(unique(ftse[1:5]),list(present,included),by="Cons_code")

clean <- unique(clean)

write.table(clean,"clean.csv",sep=",",row.names=FALSE)
