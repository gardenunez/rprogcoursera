library(datasets)
data(iris)
mean(iris[iris$Species=="virginica",]$Sepal.Length)

data(mtcars)
tapply(mtcars$mpg, mtcars$cyl, mean)

