# load the data
setwd("~/Desktop/EDA_Course_Materials/lesson2")
reddit <- read.csv('reddit.csv')

# show all fields
str(reddit)

# Notice how field "age.range" has type factor (i.e. a set).
# You can see possible values like this:
levels(reddit$age.range)

# To make sure this library is installed:
#install.packages('ggplot2', dependencies = TRUE)

# Plot:
library(ggplot2)
qplot(data = reddit, x = age.range)

# Oh no! The factor has a weird ordering.
# To set an explicit order:
reddit$age.range = ordered(reddit$age.range, levels = c("Under 18", "18-24", "25-34", "35-44", "45-54", "55-64", "65 or Above"))

# And plot again
qplot(data = reddit, x = age.range)
