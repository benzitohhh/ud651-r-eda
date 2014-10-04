# load data
setwd('~/Desktop/ud651-r-eda/lesson3')
pf <- read.csv('pseudo_facebook.tsv', sep = '\t')

# Getting logical...

summary(pf$mobile_likes)

summary(pf$mobile_likes > 0)

pf$mobile_check_in <- ifelse(pf$mobile_likes > 0, 1, 0)
pf$mobile_check_in <- factor(pf$mobile_check_in)

summary(pf$mobile_check_in) / length(pf$mobile_check_in)
