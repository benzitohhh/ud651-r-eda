# load data
setwd('~/Desktop/ud651-r-eda/lesson3')
pf <- read.csv('pseudo_facebook.tsv', sep = '\t')


qplot(x=www_likes, data=subset(pf, !is.na(gender)),
      geom = 'freqpoly', color = gender) +
  scale_x_continuous() +
  scale_x_log10()

# to see the data numerically...
# use by

by(pf$www_likes, pf$gender, sum)

