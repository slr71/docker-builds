#' Box-plots of (normalized) counts distribution per sample
#'
#' Box-plots of raw and normalized counts distributions per sample to assess the effect of the normalization
#'
#' @param object a \code{DESeqDataSet} object from DESeq2 or a \code{DGEList} object from edgeR
#' @param group factor vector of the condition from which each sample belongs
#' @param col colors of the boxplots (one per biological condition)
#' @param outfile TRUE to export the figure in a png file
#' @return A file named countsBoxplots.png in the figures directory containing boxplots of the raw and normalized counts
#' @author Marie-Agnes Dillies and Hugo Varet

countsBoxplots <- function(object=out.DESeq2$dds, col=col, group=target[,varInt], output.file="countsBoxplots.png"){
  counts <- counts(object)
  counts <- removeNull(counts)
  norm.counts <- counts(object, normalized = TRUE)
  norm.counts <- removeNull(norm.counts)    

  png(filename=output.file,width=2.5*min(2200,1800+800*ncol(norm.counts)/10),height=2000,res=300)
  par(mfrow=c(1,2))
	
  col <- unlist(strsplit(ret.opts$colors, ","))

  # raw counts
  boxplot(log2(counts+1), col = col[as.integer(group)], las = 2,
        main = "Raw counts distribution", ylab = expression(log[2] ~ (raw ~ count + 1)))
  legend("top", xpd=TRUE, inset=c(-0.07,0), levels(group), fill=col[1:nlevels(group)], horiz=TRUE)
  # norm counts
  boxplot(log2(norm.counts+1), col = col[as.integer(group)], las = 2,
        main = "Normalized counts distribution", ylab = expression(log[2] ~ (norm ~ count + 1)))
  legend("top", xpd=TRUE, inset=c(-0.07,0), levels(group), fill=col[1:nlevels(group)], horiz=TRUE)

  dev.off()
}
