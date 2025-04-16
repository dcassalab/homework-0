library(tidyverse)
load(rda/murders.rda)

murders %>% mutate(abb = reorder(abb.rate)) %>%
  ggplot(aes(abb, rate)) +
  geom_bar(width = 0.5, dtat = "identity", color = "black") +
  coard_flip()

ggsave()