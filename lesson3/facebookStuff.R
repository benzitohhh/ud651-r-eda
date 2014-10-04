# load data
setwd('~/Desktop/ud651-r-eda/lesson3')
pf <- read.csv('pseudo_facebook.tsv', sep = '\t')

# get a summary of the data
summary(pf)

# show record with max "likes"
pf[which.max(pf$likes),]

# make sure ggplot is installed
#install.packages('ggplot2')
library(ggplot2)

# Plot histogram of days of month
qplot(x=dob_day, data=pf) +
  scale_x_discrete(breaks=1:31)

# Now, let's break the above chart
# into 12 charts (one for each month of year)
# aka Faceting
qplot(x=dob_day, data=pf) +
  scale_x_discrete(breaks=1:31) +
  facet_wrap(~dob_month, ncol = 3)

# Now plot friend count
qplot(x=friend_count, data=pf, binwidth=30)

# Plot friend count (without top decile)
q90 <- quantile(pf$friend_count, c(0.90))
data <- pf$friend_count[pf$friend_count < q90[1]]
qplot(data, binwidth=30)

# Better yet.. just use xlim
qplot(x=friend_count, data=pf, binwidth=30, xlim=c(0, 1000))

# Or alternatively..
qplot(x=friend_count, data=pf, binwidth=30) +
  scale_x_continuous(limits=c(0,1000))

# To specify the x-axis labels:
qplot(x=friend_count, data=pf, binwidth=5) +
  scale_x_continuous(limits=c(0,1000), breaks=seq(0, 1000, 100))

# Now facet into males and females
qplot(x=friend_count, data=pf, binwidth=5) +
  scale_x_continuous(limits=c(0,1000), breaks=seq(0, 1000, 100)) +
  facet_wrap(~gender, ncol = 2)

# Now exclude users where gender not specified
qplot(x=friend_count, data=subset(pf, !is.na(gender)), binwidth=5) +
  scale_x_continuous(limits=c(0,1000), breaks=seq(0, 1000, 100)) +
  facet_wrap(~gender, ncol = 2)

# quick way to get overview of data:
table(pf$gender)

# and to get summary of data split by gender:
by(pf$friend_count, pf$gender, summary)
# Tenure
qplot(x=tenure, data=pf, binwidth=30,
      color=I('black'), fill=I('#099DD9'))

# Tenure (year bins)
qplot(x=tenure/365, data=pf, binwidth=1,
      xlab='Number of years using Facebook',
      ylab='Number of users in sample',
      color=I('black'), fill=I('#099DD9')) +
  scale_x_continuous(breaks=seq(0, 7, 1), limits=c(0,7))

# To see the data in here... (show proportion in each bin)
res <- hist(pf$tenure/365, breaks=seq(0, 10, 1))
round(res$density * 100, digits=2)

# Age
qplot(x=age, data=pf, binwidth=1,
      color=I('black'), fill=I('#099DD9'))

# Transforming data
summary(log10(pf$friend_count))

# Better yet, add 1 to avoid infinities..
summary(log10(pf$friend_count + 1))

# Now show different log transforms for age,
# on smae plot
#install.packages('gridExtra')
library(gridExtra)
p1 <- qplot(x = friend_count, data = pf)
p2 <- qplot(x = log10(friend_count + 1), data = pf)
p3 <- qplot(x = sqrt(friend_count), data = pf)
grid.arrange(p1, p2, p3, ncol = 1)

# ALternate solution to the above, using ggplot.
# Here, the x axis labels show the transoformed values.
# This can be easier to understand
p1 <- ggplot(aes(x= friend_count), data = pf) + geom_histogram()
p2 <- p1 + scale_x_log10()
p3 <- p1 + scale_x_sqrt()
grid.arrange(p1, p2, p3, ncol = 1)

# We can also show histograms as a continuous line.
# And this way, we can show multiple series on one chart easily.
# This is called a "Frequency Polygon".
qplot(x=friend_count, data=subset(pf, !is.na(gender)),
      binwidth = 10, geom='freqpoly', color=gender) +
  scale_x_continuous(lim = c(0, 1000), breaks = seq(0, 1000, 50))

# Now plot friend counts, but showing proportions
qplot(x=friend_count, y=..count../sum(..count..) ,data=subset(pf, !is.na(gender)),
      binwidth = 50, geom='freqpoly', color=gender) +
  scale_x_continuous(lim = c(0, 1000), breaks = seq(0, 1000, 50))

qplot(x=friend_count, y=..count../sum(..count..) ,data=subset(pf, !is.na(gender)),
      binwidth = 50, geom='histogram') +
  scale_x_continuous(lim = c(0, 1000), breaks = seq(0, 1000, 50)) +
  facet_wrap(~gender, ncol=2)

# Determine which gender makes more www_likes
qplot(x=www_likes, y=..count../sum(..count..), data=subset(pf, !is.na(gender)),
      binwidth=50, geom='freqpoly', color=gender) +
  scale_x_continuous(lim = c(0, 200), breaks = seq(0, 1000, 50))

qplot(x=www_likes, data=subset(pf, !is.na(gender)),
      binwidth=50) +
  scale_x_continuous(lim = c(0, 200), breaks = seq(0, 1000, 50)) +
  facet_wrap(~gender, ncol=1)


# create factor for age data
agef <- cut(x=pf$age, breaks=c(12, 14, 16, 18, 21, 25, 30, 40, 50, 60, 70, 150))

# show percentages of different age groups
table(agef) / length(agef) * 100

library('ggplot2')
qplot(agef)

# show gender proportions per age group
qplot(agef, data=pf, fill=gender, position="fill")

# show friend counts per age group
qplot(agef, data=pf, fill=cut(friend_count, breaks=c(0, 100, 200, 500, 5000), include.lowest=TRUE), position="fill")

# show num friends per age group
by(pf$friend_count, agef, summary)


