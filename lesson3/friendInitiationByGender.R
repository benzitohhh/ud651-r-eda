# load data
setwd('~/Desktop/ud651-r-eda/lesson3')
pf <- read.csv('pseudo_facebook.tsv', sep = '\t')

nInitiations <- by(pf$friendships_initiated, pf$gender, sum)
nUsers <- by(pf$friendships_initiated, pf$gender, length)
meanInitiationsPerUser = nInitiations / nUsers


qplot(x = gender,
      y = friendships_initiated,
      data = subset(pf, !is.na(gender)),
      geom = 'boxplot') +
  coord_cartesian(ylim = c(0, 200))
  

