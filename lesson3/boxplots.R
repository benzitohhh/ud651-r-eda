# load data
setwd('~/Desktop/ud651-r-eda/lesson3')
pf <- read.csv('pseudo_facebook.tsv', sep = '\t')

qplot(x=gender,
      y=friend_count,
      data = subset(pf, !is.na(gender)),
      geom='boxplot',
      ylim=c(0,1000)) # this removes datapoint with count>=1000

qplot(x=gender,
      y=friend_count,
      data = subset(pf, !is.na(gender)),
      geom='boxplot') +
  scale_y_continuous(limits=c(0,1000)) # this ALSO removes datapoint with count>=1000

# But... using coord-cartesian, no datapoints are removed
qplot(x=gender,
      y=friend_count,
      data = subset(pf, !is.na(gender)),
      geom='boxplot') +
  coord_cartesian(ylim = c(0, 1000))

# We can see the numeric data for this like so:
by(pf$friend_count, pf$gender, summary)
