read.csv("hw1_data.csv")
data <- read.csv("hw1_data.csv", nrows=2)
data
hwdata <- read.csv("hw1_data.csv")
nrow(hwdata)
ncol(hwdata)
hwdata[c(152:153),]
hwdata[47,]

#missing values in ozone column
naVals <- is.na(hwdata["Ozone"])
table(naVals)

#mean of ozone column
ozone = as.vector(na.omit(hwdata[['Ozone']]))
mean(ozone)

#mean of Solar.R of the subset with Ozone > 31 and Temp > 90
s <- subset(hwdata, Ozone>31)
s <- subset(s, Temp>90)
mean(s[["Solar.R"]])

#mean of Temp when Month is 6
mean(subset(hwdata,Month==6)[["Temp"]])

#maximum ozone value in May
max(subset(hwdata, Month==5)[["Ozone"]], na.rm=TRUE)
