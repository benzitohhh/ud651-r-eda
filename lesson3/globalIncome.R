setwd('~/Desktop/ud651-r-eda/lesson3')
incomes = read.csv('./GDPpercapitaconstant2000US.csv', header = TRUE, row.names = 1)

# Show richest countries in 2011
incomes[order(incomes$X2011,
              decreasing=TRUE),
              'X2011',
              drop=FALSE]

# Show countries with income between 20-30k
subset(incomes,
        X2011 >= 20000 & X2011 < 30000,
        select = 'X2011',
        )

barplot(incomes[order(incomes$X2011), 'X2011'])

library('ggplot2')
qplot(x = X2011,
      data = incomes,
      binwidth=10000,
      color=I('black'),
      fill=I('#099DD9'))

summary(incomes$X2011)

