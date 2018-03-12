#!/usr/bin/env Rscript
require(hopach)

setwd("/data/home/nstone/2018_hopach")

#load normalized counts data, with first column identifyer of gene names, regions, etc.
HMData <- read.table("log.CPM_SignificantPeaks.txt", header=TRUE, sep="\t")
rownames(HMData)<-HMData[,1]
HMData<-HMData[,20:28] #this depends on what columns you want to cluster based on
hmat <- as.matrix(HMData) #make it a matrix

pept.dist <- distancematrix(hmat,"cor")
pept.hobj <- hopach(hmat, dmat=pept.dist, clusters="best", initord="clust")

makeoutput(hmat,pept.hobj,file="20180309_HopachResults.ChIP.txt")

####
