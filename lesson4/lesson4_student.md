Lesson 4
========================================================

***

### Scatterplots and Perceived Audience Size
Notes:

***

### Scatterplots
Notes:




***

#### What are some things that you notice right away?
Response:

***

### ggplot Syntax
Notes:




***

### Overplotting
Notes:




#### What do you notice in the plot?
Response:

***

### Coord_trans()
Notes:




#### Look up the documentation for coord_trans() and add a layer to the plot that transforms friend_count using the square root function. Create your plot!




#### What do you notice?

***

### Alpha and Jitter
Notes:




***

### Overplotting and Domain Knowledge
Notes:

***

### Conditional Means
Notes:




Create your plot!




***

### Overlaying Summaries with Raw Data
Notes:




#### What are some of your observations of the plot?
Response:

***

### Moira: Histogram Summary and Scatterplot
See the Instructor Notes of this video to download Moira's paper on perceived audience size and to see the final plot.

Notes:

***

### Correlation
Notes:




Look up the documentation for the cor.test function.

What's the correlation between age and friend count? Round to three decimal places.
Response:

***

### Correlation on Subsets
Notes:


```r
with(, cor.test(age, friend_count))
```

```
## Error: argument "data" is missing, with no default
```


***

### Correlation Methods
Notes:

***

## Create Scatterplots
Notes:




***

### Strong Correlations
Notes:




What's the correlation betwen the two variables? Include the top 5% of values for the variable in the calculation and round to 3 decimal places.




Response:

***

### Moira on Correlation
Notes:

***

### More Caution with Correlation
Notes:


```r
install.packages("alr3")
```

```
## Error: trying to use CRAN without setting a mirror
```

```r
library(alr3)
```

```
## Error: there is no package called 'alr3'
```


Create your plot!




***

### Noisy Scatterplots
a. Take a guess for the correlation coefficient for the scatterplot.

b. What is the actual correlation of the two variables?
(Round to the thousandths place)




***

### Making Sense of Data
Notes:




***

### A New Perspective

What do you notice?
Response:

Watch the solution video and check out the Instructor Notes!
Notes:

***

### Understanding Noise: Age to Age Months
Notes:




***

### Age with Months Means




Programming Assignment



***

### Noise in Conditional Means




***

### Smoothing Conditional Means
Notes:




***

### Which Plot to Choose?
Notes:

***

### Analyzing Two Variables
Reflection:

***

Click **KnitHTML** to see all of your hard work and to have an html
page of this lesson, your answers, and your notes!

