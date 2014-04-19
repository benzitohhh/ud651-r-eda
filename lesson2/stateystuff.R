setwd('~/Desktop/EDA_Course_Materials/lesson2')
statesInfo <- read.csv('stateData.csv')

# This...
subset(statesInfo, state.region == 1)

# ... is equivalent to
statesInfo[statesInfo$state.region == 1, ]
# bracket notation is dataset[ROWS, COLUMNS]