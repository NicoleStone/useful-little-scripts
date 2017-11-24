# adapted from Tara Friedrich "make_barplot_2017_10_25.R" on 20171123
# bins TSS distance info from two homer annotatepeaks.pl output files 
# and makes a barplot to compare peak distributions relative to nearest TSS
# NOTE: manually edited two input files A1 position to be same so that rbind would work

setwd("/Users/nicolestone/Desktop/make.histos")

dynamic = read.table("chip.10.open.dynamic.txt.bed.annotatepeaks.txt", sep="\t", stringsAsFactors=F, header=TRUE, quote = "\"", comment.char = "")
common  = read.table("chip.10.open.stayingopen.txt.bed.annotatepeaks.txt", sep="\t", stringsAsFactors=F, header=TRUE, quote = "\"", comment.char = "")
DISTCOLNAME = "Distance.to.TSS"
#should be empty 
#dynamic[is.na(dynamic$Distance.to.TSS),]

dynamic[,DISTCOLNAME] = as.numeric(as.character(dynamic[,DISTCOLNAME]))/1000
common[,DISTCOLNAME] = as.numeric(as.character(common[,DISTCOLNAME]))/1000

dynamic[,"bin"] = 0
dynamic[which(dynamic[,DISTCOLNAME] < -500),"bin"] <- "less than -500 kb"
dynamic[which(dynamic[,DISTCOLNAME] < -50 & dynamic[, DISTCOLNAME] >= -500),"bin"] <- "-500 to -50 kb"
dynamic[which(dynamic[,DISTCOLNAME] < -2 & dynamic[, DISTCOLNAME] >= -50),"bin"] <- "-50 to -2 kb"
dynamic[which(dynamic[,DISTCOLNAME] < 0 & dynamic[, DISTCOLNAME] >= -2),"bin"] <- "-2 to 0 kb"
dynamic[which(dynamic[,DISTCOLNAME] < 2 & dynamic[, DISTCOLNAME] >= 0),"bin"] <- "0 to 2 kb"
dynamic[which(dynamic[,DISTCOLNAME] < 50 & dynamic[, DISTCOLNAME] >= 2),"bin"] <- "2 to 50 kb"
dynamic[which(dynamic[,DISTCOLNAME] < 500 & dynamic[, DISTCOLNAME] >= 50),"bin"] <- "50 to 500 kb"
dynamic[which(dynamic[, DISTCOLNAME] >= 500),"bin"] <- "greater than 500 kb"
dynamic["type"] = "dynamic"

common[,"bin"] = 0
common[which(common[,DISTCOLNAME] < -500),"bin"] <- "less than -500 kb"
common[which(common[,DISTCOLNAME] < -50 & common[, DISTCOLNAME] >= -500),"bin"] <- "-500 to -50 kb"
common[which(common[,DISTCOLNAME] < -2 & common[, DISTCOLNAME] >= -50),"bin"] <- "-50 to -2 kb"
common[which(common[,DISTCOLNAME] < 0 & common[, DISTCOLNAME] >= -2),"bin"] <- "-2 to 0 kb"
common[which(common[,DISTCOLNAME] < 2 & common[, DISTCOLNAME] >= 0),"bin"] <- "0 to 2 kb"
common[which(common[,DISTCOLNAME] < 50 & common[, DISTCOLNAME] >= 2),"bin"] <- "2 to 50 kb"
common[which(common[,DISTCOLNAME] < 500 & common[, DISTCOLNAME] >= 50),"bin"] <- "50 to 500 kb"
common[which(common[, DISTCOLNAME] >= 500),"bin"] <- "greater than 500 kb"
common["type"] = "common"

# manually edited two input files A1 position to be same so that rbind would work
all = rbind(dynamic, common)
library(ggplot2)

dev.off
new_matrix = rbind(cbind(as.numeric(as.vector(table(all[all$type=="dynamic","bin"]))/length(all$type=="dynamic")), "dynamic"), cbind(as.numeric(as.vector(table(all[all$type=="common","bin"]))/length(all$type=="common")), "common"))
new_matrix2 = cbind(c(names(table(all[all$type=="dynamic","bin"])), names(table(all[all$type=="common","bin"]))), new_matrix)
new_data_frame = data.frame(new_matrix2 ,  stringsAsFactors = TRUE)
colnames(new_data_frame) = c("bin", "percentage", "type")
#new_data_frame = new_data_frame[c(8,3,2,1,4,5,6,7,16,11,10,9,12,13,14,15),]
new_data_frame$percentage = as.numeric(as.character(new_data_frame$percentage))
new_data_frame$bin = factor(new_data_frame$bin, levels=c("less than -500 kb", "-500 to -50 kb", "-50 to -2 kb" , "-2 to 0 kb", "0 to 2 kb" , "2 to 50 kb", "50 to 500 kb", "greater than 500 kb"))
g <- ggplot(new_data_frame, aes(bin, percentage)) +geom_bar(stat = "identity", aes(fill = type), position = "dodge") + theme(axis.text.x = element_text(angle = 90, hjust = 1))
g + scale_fill_grey() + theme(panel.background = element_blank())
ggsave("barplot.10.staticvsdynamic.TSS.2kbfix.pdf")


