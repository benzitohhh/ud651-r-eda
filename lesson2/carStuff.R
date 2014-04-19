# load mtcars
data(mtcars)

# cars that have mpg greater than 30, OR hp less than 60
subset(mtcars, mpg >= 30 | hp < 60)