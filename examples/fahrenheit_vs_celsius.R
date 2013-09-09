df <- data.frame(Fahrenheit = c(212, 32),
                 Celsius = c(100, 0))

p <- ggplot(df, aes(x = Fahrenheit, y = Celsius)) +
  geom_point(size = 5) +
  xlim(0, 250) +
  ylim(-25, 125) +
  theme_bw() +
  theme(panel.grid.major = element_blank()) +
  theme(panel.grid.minor = element_blank()) +
  theme(panel.background = element_blank()) +
  theme(axis.ticks = element_blank()) +
  ggtitle("Learning to Convert Temperatures")
print(p)
ggsave("fahrenheit_vs_celsius_points.pdf", height = 7, width = 7)

p <- p + geom_smooth(method = 'lm', se = FALSE)
print(p)
ggsave("fahrenheit_vs_celsius_line.pdf", height = 7, width = 7)
