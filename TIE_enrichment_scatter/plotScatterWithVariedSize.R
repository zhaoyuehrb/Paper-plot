library(ggplot2)
library(ggrepel)

files <- list.files(path="data", pattern="*.csv", full.names=TRUE, recursive=FALSE)
for (file in files) {
  
  keyword <- substr(file, 6, 11)
  df <- read.table(file, sep = ',',header = T)
  ggplot(data = df, aes(x = TIS, y = ER)) + 
    ylim(-0.25,0.72) +
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
  ggsave(paste(keyword,'ER vs TIS in Gene Groups.png'),width = 9, height = 7)


}
