#Import the isoform expression tables
setwd("merge_table/")
tr <- c()
tables <- list()
list_files <- list.files(pattern = ".txt")

#Extract the number of transcipt among the different samples (uniq)
for (i in 1:length(list_files)){
  tables[[i]] <- read.table(list_files[i],header=T, sep="\t", na.strings="", stringsAsFactors = F)
  tr <- c(tr,tables[[i]]$TrID)
}

uniq_transcript <- unique(tr)
S <- length(uniq_transcript)

#Create a variable for the namble of samples
num.cells <- length(tables)

#Open an empty data frame 
final_all_samples <- data.frame(genes=vector("character", length=S), trans=uniq_transcript, stringsAsFactors = F)
head(final_all_samples)

#Fill the dataframe first with the number of column for PSI values
for(j in 1:num.cells){
  final_all_samples[, paste("PSI", j, sep = "")] <- vector("numeric", S)
}

#Then with the Gene Id that correspond to each isoform
gene.id <- NA
k <- 1
for(i in 1:S){
  while(is.na(gene.id)){
    gene.id <- ifelse(length(tables[[k]]$GeneID[tables[[k]]$TrID==uniq_transcript[i]]) > 0, tables[[k]]$GeneID[tables[[k]]$TrID==uniq_transcript[i]], NA)
    k <- k + 1
  }
  final_all_samples$genes[i] <- gene.id
  k <- 1
  gene.id <- NA
#Then for the PSI value of each sample (put an NA if not present the value)
  for(j in 3:(num.cells+2)){
    final_all_samples[i, j] <- ifelse(length(tables[[j-2]]$PSI[tables[[j-2]]$TrID==uniq_transcript[i]]) > 0, tables[[j-2]]$PSI[tables[[j-2]]$TrID==uniq_transcript[i]], NA)
  }
}
