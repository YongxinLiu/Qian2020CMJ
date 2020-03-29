# Read example data #----
df = read.csv("pvalues_input.csv", header=TRUE)
df = df[order(df$Raw.p),]

# Pvaule adjustment by bonferroni #----
df$Bonferroni = p.adjust(df$Raw.p, method = "bonferroni")
# fdr is Benjamini–Hochberg #----
df$BH = p.adjust(df$Raw.p, method = "fdr")  
df =df[,-1]

# plotting #----
library(reshape2)
md <- melt(df, id="Raw.p")
library(ggplot2)
ggplot(data=md, aes(x=Raw.p, y=value, color=variable)) + geom_line(size=1) +
  annotate('segment', x=0, xend=1, y=0, yend=1, size=1, lty=2, color='black') +
  theme_classic(base_size=16)



 