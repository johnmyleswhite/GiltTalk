#knn <- read.csv("knn.csv")

data(iris)
knn <- iris

p <- ggplot(knn, aes(x = Sepal.Length, y = Sepal.Width, color = factor(Species))) +
  geom_point(size = 3) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Learning to Classify Species of Flowers") +
  theme_bw() +
  theme(panel.grid.major = element_blank()) +
  theme(panel.grid.minor = element_blank()) +
  theme(panel.background = element_blank()) +
  theme(axis.ticks = element_blank()) +
  theme(legend.position = "none")
print(p)
ggsave("knn.pdf", height = 7, width = 7)

p <- ggplot(knn, aes(x = Sepal.Length, y = Sepal.Width, color = factor(Species))) +
  geom_point(size = 3) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Learning to Classify Species of Flowers") +
  theme_bw() +
  theme(panel.grid.major = element_blank()) +
  theme(panel.grid.minor = element_blank()) +
  theme(panel.background = element_blank()) +
  theme(axis.ticks = element_blank()) +
  theme(legend.position = "none") +
  annotation_custom(grob=circleGrob(r=unit(0.75,"npc")), xmin=5, xmax=6.5, ymin=2, ymax=3) +
  annotation_custom(grob=circleGrob(r=unit(0.75,"npc")), xmin=6.5, xmax=8, ymin=2.75, ymax=3.75) +
  annotation_custom(grob=circleGrob(r=unit(0.75,"npc")), xmin=4.5, xmax=6, ymin=3.25, ymax=4.25)
print(p)
ggsave("knn_borders.pdf", height = 7, width = 7)
