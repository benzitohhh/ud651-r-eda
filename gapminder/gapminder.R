setwd('~/Desktop/ud651-r-eda/gapminder')
gDat = read.csv('./gapminderDataFiveYear.txt', header = TRUE, sep="\t")

library(lattice)

xyplot(lifeExp ~ year, data = gDat)

xyplot(lifeExp ~ gdpPercap, gDat)

xyplot(lifeExp ~ gdpPercap, gDat, subset = country == "Argentina")

xyplot(lifeExp ~ gdpPercap, gDat, subset = country == "Argentina", type = c("p", "r"))

xyplot(lifeExp ~ gdpPercap | continent, gDat, subset = year == 2007)

xyplot(lifeExp ~ gdpPercap | country, gDat, subset = year == 2007)

xyplot(lifeExp ~ gdpPercap, gDat, group = continent, subset = year == 1992, 
       auto.key = TRUE)

table(gDat$year)
