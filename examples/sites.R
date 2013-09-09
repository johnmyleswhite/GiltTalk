sites <- read.csv("sites.tsv", sep = "\t")

p <- ggplot(sites, aes(x = log(PageViews), y = log(UniqueVisitors))) +
  geom_point(size = 2.5) +
  geom_smooth(method = "lm", se = FALSE) +
  xlab("Page Views on a Log Scale") +
  ylab("Unique Visitors on a Log Scale") +
  theme_bw() +
  theme(panel.grid.major = element_blank()) +
  theme(panel.grid.minor = element_blank()) +
  theme(panel.background = element_blank()) +
  theme(axis.ticks = element_blank()) +
  ggtitle("Learning to Convert Page Views into Unique Visitors")
print(p)
ggsave("sites.pdf", height = 7, width = 7)
