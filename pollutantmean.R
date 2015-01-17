pollutanmean <- function(directory, pollutant, id = 1:332){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the csv files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the 
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector ( ignoring NA values)
  
  filenames <- list.files(path = directory, 
                          pattern = "*.csv",
                          full.names=TRUE)
  v <- c()
  for(current in filenames){
      df <- read.csv(current)
      v1 <- subset(df, is.element(ID, id))[[pollutant]]
      v <- c(v, v1)
  }
  mean(v, na.rm = TRUE)
}
