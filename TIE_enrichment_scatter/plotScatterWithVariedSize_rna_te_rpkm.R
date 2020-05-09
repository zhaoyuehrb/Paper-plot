library(ggplot2)
library(ggrepel)
library(stringr)
files <- list.files(path="data/RNA", pattern="*.csv", full.names=TRUE, recursive=FALSE)
for (file in files) {
  
  keyword <- strsplit(file,split='/', fixed=TRUE)[[1]][3]
  keyword <- str_sub(keyword,end=-5)
  df <- read.table(file, sep = ',',header = T)
  ggplot(data = df, aes(x = TIS, y = RNA)) + 
    ylim(-1.2,3.8) +
    geom_point(aes(color = GeneGroup, size = size)) +
    scale_fill_continuous() +
    geom_text_repel(aes(label = GeneGroup), size = 3,
                    box.padding = unit(0.4, 'lines'),
                    point.padding = unit(0.4, 'lines'),
                    segment.size = 0.2, segment.colour = 'grey50') +
    
    guides(color = FALSE) + 
    ggtitle(keyword) +
    theme(axis.text.y = element_text(size = 12),
          axis.text.x = element_text(size =12),
          plot.title = element_text(size = rel(1.5), hjust = 0.5))
  ggsave(paste(keyword,'RNA_fc vs TIS in Gene Groups.png'),width = 9, height = 7)
}



files <- list.files(path="data/rna_rpkm/", pattern="*.csv", full.names=TRUE, recursive=FALSE)
for (file in files) {
  
  keyword <- strsplit(file,split='/', fixed=TRUE)[[1]][3]
  keyword <- str_sub(keyword,end=-5)
  df <- read.table(file, sep = ',',header = T)
  ggplot(data = df, aes(x = TIS, y = RNA)) + 
    ylim(-10,2600) +
    geom_point(aes(color = GeneGroup, size = size)) +
    scale_fill_continuous() +
    geom_text_repel(aes(label = GeneGroup), size = 3,
                    box.padding = unit(0.4, 'lines'),
                    point.padding = unit(0.4, 'lines'),
                    segment.size = 0.2, segment.colour = 'grey50') +
    
    guides(color = FALSE) + 
    ggtitle(keyword) +
    theme(axis.text.y = element_text(size = 12),
          axis.text.x = element_text(size =12),
          plot.title = element_text(size = rel(1.5), hjust = 0.5))
  ggsave(paste(keyword,'RNA_cdRPKM vs TIS in Gene Groups.png'),width = 9, height = 7)
}



files <- list.files(path="data/TE/", pattern="*.csv", full.names=TRUE, recursive=FALSE)
for (file in files) {
  
  keyword <- strsplit(file,split='/', fixed=TRUE)[[1]][3]
  keyword <- str_sub(keyword,end=-5)
  df <- read.table(file, sep = ',',header = T)
  ggplot(data = df, aes(x = TIS, y = TE)) + 
    ylim(-1.4,1.5) +
    geom_point(aes(color = GeneGroup, size = size)) +
    scale_fill_continuous() +
    geom_text_repel(aes(label = GeneGroup), size = 3,
                    box.padding = unit(0.4, 'lines'),
                    point.padding = unit(0.4, 'lines'),
                    segment.size = 0.2, segment.colour = 'grey50') +
    
    guides(color = FALSE) + 
    ggtitle(keyword) +
    theme(axis.text.y = element_text(size = 12),
          axis.text.x = element_text(size =12),
          plot.title = element_text(size = rel(1.5), hjust = 0.5))
  ggsave(paste(keyword,'TE vs TIS in Gene Groups.png'),width = 9, height = 7)
}

