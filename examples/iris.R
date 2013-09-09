data(iris)

p <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(size = 3) +
  xlab("Petal Length") +
  ylab("Petal Width") +
  theme_bw() +
  theme(panel.grid.major = element_blank()) +
  theme(panel.grid.minor = element_blank()) +
  theme(panel.background = element_blank()) +
  theme(axis.ticks = element_blank()) +
  #theme(panel.border = element_blank()) +
  theme(legend.position = "none") +
  ggtitle("Learning to Classify Species of Flowers")
print(p)
ggsave("iris.pdf", height = 7, width = 7)

p1 <- p + geom_abline(aes(intercept = 3, slope = -1))
print(p1)
ggsave("iris_boundary1.pdf", height = 7, width = 7)

p2 <- p + geom_abline(aes(intercept = 7, slope = -1.1))
print(p2)
ggsave("iris_boundary2.pdf", height = 7, width = 7)
