# Fitting Labels 
#par(las=2) # make label text perpendicular to axis
#par(mar=c(5,8,4,2)) # increase y-axis margin.
#counts <- table(mtcars$gear)
#barplot(counts, main="Car Distribution", horiz=TRUE, names.arg=c("3 Gears", "4 Gears", "5   Gears"), cex.names=0.8)

#saving files as: Bar.plot.GO.cluster.1.pdf

GO <- read.delim("~/Desktop/GO.Cluster1", header=FALSE)
cluster <- GO$V1
names <- GO$V3
pval <- GO$V4
print(names)

#par(mai=c(0.5,3,1,.25))
par(fin=c(3, 3))
barplot(rev(-log(pval)), main="GO:Cluster1", horiz=TRUE, names.arg=rev(names), cex.names=0.75, las=1, xlab="-Log(p-value)")

###
GO <- read.delim("~/Desktop/GO.Cluster2", header=FALSE)
cluster <- GO$V1
names <- GO$V3
pval <- GO$V4
print(names)

#par(mai=c(0.5,3,1,.25))
barplot(rev(-log(pval)), main="GO:Cluster2", horiz=TRUE, names.arg=rev(names), cex.names=0.75, las=1, xlab="-Log(p-value)")

###
GO <- read.delim("~/Desktop/GO.Cluster3", header=FALSE)
cluster <- GO$V1
names <- GO$V3
pval <- GO$V4
print(names)

#par(mai=c(0.5,3,1,.25))
barplot(rev(-log(pval)), main="GO:Cluster3", horiz=TRUE, names.arg=rev(names), cex.names=0.75, las=1, xlab="-Log(p-value)")

###
GO <- read.delim("~/Desktop/GO.Cluster4", header=FALSE)
cluster <- GO$V1
names <- GO$V3
pval <- GO$V4
print(names)

#par(mai=c(0.5,3,1,.25))
barplot(rev(-log(pval)), main="GO:Cluster4", horiz=TRUE, names.arg=rev(names), cex.names=0.75, las=1, xlab="-Log(p-value)")

###
GO <- read.delim("~/Desktop/GO.Cluster5", header=FALSE)
cluster <- GO$V1
names <- GO$V3
pval <- GO$V4
print(names)


#par(mai=c(0.5,3,1,.25))
barplot(rev(-log(pval)), main="GO:Cluster5", horiz=TRUE, names.arg=rev(names), cex.names=0.75, las=1, xlab="-Log(p-value)")

###
GO <- read.delim("~/Desktop/GO.Cluster6", header=FALSE)
cluster <- GO$V1
names <- GO$V3
pval <- GO$V4
print(names)

#par(mai=c(0.5,3,1,.25))
barplot(rev(-log(pval)), main="GO:Cluster6", horiz=TRUE, names.arg=rev(names), cex.names=0.75, las=1, xlab="-Log(p-value)")

###
GO <- read.delim("~/Desktop/GO.Cluster7", header=FALSE)
cluster <- GO$V1
names <- GO$V3
pval <- GO$V4
print(names)

#par(mai=c(0.5,3,1,.25))
barplot(rev(-log(pval)), main="GO:Cluster7", horiz=TRUE, names.arg=rev(names), cex.names=0.75, las=1, xlab="-Log(p-value)")

###
GO <- read.delim("~/Desktop/GO.Cluster8", header=FALSE)
cluster <- GO$V1
names <- GO$V3
pval <- GO$V4
print(names)

#par(mai=c(0.5,3,1,.25))
barplot(rev(-log(pval)), main="GO:Cluster8", horiz=TRUE, names.arg=rev(names), cex.names=0.75, las=1, xlab="-Log(p-value)")

###

GO <- read.delim("~/Desktop/GO.Cluster9", header=FALSE)
cluster <- GO$V1
names <- GO$V3
pval <- GO$V4
print(names)

#par()
par(fin=c(3, 3))
barplot(rev(-log(pval)), main="GO:Cluster9", horiz=TRUE, names.arg=rev(names), cex.names=0.75, las=1, xlab="-Log(p-value)")
dev.off()
###


#parnotes
#$mai
#[1] 1.0 1.6 0.8 0.4




