#!/usr/bin/env Rscript
require(hopach)

#rigel
setwd("/data/home/nstone/2018_hopach")

#load chip:input data
HMData <- read.table("chipover.input_log.CPM_Chip_Atac_SignificantPeaks_forR.txt", header=TRUE, sep="\t")
rownames(HMData)<-HMData[,1]
HMData<-HMData[,20:28] #this depends on what columns you want to cluster based on
hmat <- as.matrix(HMData) #make it a matrix
#

pept.dist <- distancematrix(hmat,"cor")
pept.hobj <- hopach(hmat, dmat=pept.dist, clusters="best", initord="clust")

NClust <- pept.hobj$clust$k
Sizes <- pept.hobj$clust$sizes
MedoidPeps <- pept.hobj$clust$medoids
Order <- pept.hobj$clust$order

makeoutput(hmat,pept.hobj,file="20180309_HopachResults.ChIP.txt")

#### end rigel portion.
