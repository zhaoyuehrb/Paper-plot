library(ggplot2)
library(ggrepel)
df <- read.table('L24_t0.csv', sep = ',',header = T)
ggplot(data = df, aes(x = TIS, y = ER)) + 
  geom_point(aes(color = GeneGroup, size = size)) +
  scale_fill_continuous() +
  geom_text_repel(aes(label = GeneGroup), size = 3,
                  box.padding = unit(0.4, 'lines'),
                  point.padding = unit(0.4, 'lines'),
                  segment.size = 0.2, segment.colour = 'grey50') +
  
  guides(color = FALSE) + 
  ggtitle('test') +
  theme(axis.text.y = element_text(size = 12),
        axis.text.x = element_text(size =12),
        plot.title = element_text(size = rel(1.5), hjust = 0.5))
