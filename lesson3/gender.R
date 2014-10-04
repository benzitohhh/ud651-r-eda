# load data
setwd('~/Desktop/ud651-r-eda/lesson3')
pf <- read.csv('pseudo_facebook.tsv', sep = '\t')

# remove records with no gender
pf <- subset(pf, !is.na(pf$gender))

# get histogram
h <- hist(pf$www_likes, breaks=seq(0, 15000, 10), plot=FALSE)

# convert to percentages (rather than frequencies)
h$counts <- h$counts / sum(h$counts) * 100

# plot the first part the distribution
plot(h, xlim=c(0,100))


