library(ggplot2)
data(diamonds) # load diamonds dataset that comes with ggplot

str(diamonds) # to show type of each feature

levels(diamonds$color) # to show levels of ordered factor

# Histogram of price of diamonds
qplot(x = price,
      data = diamonds,
      binwidth=500,
      color=I('black'),
      fill=I('#099DD9'))
  
summary(diamonds$price)

# How many diamonds cost...
dim(diamonds[diamonds$price >= 15000,])

# Breakout histogram of diamond prices by cut.
qplot(x = price,
      data = diamonds,
      binwidth=500,
      color=I('black'),
      fill=I('#099DD9')) +
  facet_wrap(~cut, ncol=1)

# Some overviews by cut
sort(by(diamonds$price, diamonds$cut, max))
sort(by(diamonds$price, diamonds$cut, min))

# Breakout histogram of diamond prices by cut,
# But with free scales for the y
qplot(x = price,
      data = diamonds,
      binwidth=500,
      color=I('black'),
      fill=I('#099DD9')) +
  facet_wrap(~cut, ncol=1, scales='free_y')

# Histogram of price per carat
qplot(x = price / carat,
      data = diamonds,
      binwidth=500,
      color=I('black'),
      fill=I('#099DD9'))

# Breakout histogram of diamond prices per carat by cut,
qplot(x = price / carat,
      data = diamonds,
      binwidth=500,
      color=I('black'),
      fill=I('#099DD9')) +
  facet_wrap(~cut, ncol=1, scales='free_y')

# Breakout histogram of diamond prices per carat log10 by cut,
# But with free scales for the y
qplot(x = log10(price / carat),
      data = diamonds,
      binwidth=0.1,
      color=I('black'),
      fill=I('#099DD9')) +
  facet_wrap(~cut, ncol=1, scales='free_y')
# Woah... seems to look much more symmetrical and normal


qplot(x = log10(price),
      data = diamonds,
      binwidth=0.1,
      color=I('black'),
      fill=I('#099DD9')) +
  facet_wrap(~clarity, ncol=1, scales='free_y')

# Boxplot of price by clarity
qplot(x = clarity,
      y = price / carat,
      data = diamonds,
      geom = 'boxplot') +
  coord_cartesian(ylim=c(0,6000))

# Boxplot of price by cut
qplot(x = cut,
      y = price / carat,
      data = diamonds,
      geom = 'boxplot') +
  coord_cartesian(ylim=c(0,6000))

# Boxplot of price by color
qplot(x = color,
      y = price / carat,
      data = diamonds,
      geom = 'boxplot') +
  coord_cartesian(ylim=c(0,6000))

summary(subset(diamonds, diamonds$color == 'D'))
summary(subset(diamonds, diamonds$color == 'J'))

qplot(x=carat,
      data=diamonds,
      geom='freqpoly',
      binwidth = 0.001,
      #breaks = seq(0, 5, 0.001)
      #color=gende
      
      ) +
  scale_x_continuous(lim = c(1.01, 1.2))
#  scale_x_continuous(lim = c(0, 5.5))

