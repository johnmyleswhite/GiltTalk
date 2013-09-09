# Data from http://www.wrcc.dri.edu/cgi-bin/cliMAIN.pl?waseat

df <- read.csv("weather.tsv", sep = "\t")

p <- ggplot(df, aes(x = DayOfYear, y = Precipitation)) +
  geom_point(size = 2.5) +
  ylim(0, 0.25) +
  xlim(0, 366) +
  xlab("Day of Year") +
  ylab("Probability of Precipitation") +
  ggtitle("Chance of Rain in Seattle over the Course of the Year") +
  theme_bw() +
  theme(panel.grid.major = element_blank()) +
  theme(panel.grid.minor = element_blank()) +
  theme(panel.background = element_blank()) +
  theme(axis.ticks = element_blank())
print(p)
ggsave("weather.pdf", height = 7, width = 7)

p <- p + geom_smooth(se = FALSE)
print(p)
ggsave("weather_smooth.pdf", height = 7, width = 7)
