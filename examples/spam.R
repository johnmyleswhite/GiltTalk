df <- data.frame(IsSpam = factor(c(1, 2, 0, 1)),
                 MentionsViagra = c(0, 1, 0, 1),
                 MentionsNigeria = c(1, 1, 0, 0))

p <- ggplot(df, aes(x = MentionsNigeria, y = MentionsViagra, color = IsSpam)) +
  geom_point(size = 5) +
  xlim(-0.1, 1.1) +
  ylim(-0.1, 1.1) +
  xlab("E-Mail Mentions Nigeria") +
  ylab("E-Mail Mentions Nigeria") +
  theme_bw() +
  theme(panel.grid.major = element_blank()) +
  theme(panel.grid.minor = element_blank()) +
  theme(panel.background = element_blank()) +
  theme(axis.ticks = element_blank()) +
  theme(legend.position = "none") +
  ggtitle("Learning to Classify Spam")
print(p)
ggsave("is_spam.pdf", height = 7, width = 7)

p1 <- p + geom_abline(aes(intercept = 0.5, slope = -1))
print(p1)
ggsave("is_spam_boundary1.pdf", height = 7, width = 7)

p2 <- p + geom_abline(aes(intercept = 0.75, slope = -1))
print(p2)
ggsave("is_spam_boundary2.pdf", height = 7, width = 7)

p3 <- p + geom_abline(aes(intercept = 0.25, slope = -1))
print(p3)
ggsave("is_spam_boundary3.pdf", height = 7, width = 7)
