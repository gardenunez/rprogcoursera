source('utils.R')
corr <- function(directory, threshold = 0){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the csv files
  
  ## 'threshold' is a numeric vector of length 1 indicating the 
  ## number of completely observed observations ( on all 
  ## variables) required to compute the correlation between 
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  filenames <- list.files(path = directory, 
                          pattern = "*.csv",
                          full.names=TRUE)
  v <- c()
  data <- joindf(directory)
  for(i in 1:332){
    df <- subset(data, ID == i)
    sdf <- subset(df, !is.na(df$sulfate))
    df <- subset(sdf, !is.na(sdf$nitrate))
    if(nrow(df) > threshold){
      v <- c(v,cor(df$nitrate, df$sulfate))
    }
  }
  v
}
