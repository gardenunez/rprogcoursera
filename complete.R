complete <- function(directory, id = 1:332){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the csv files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the 
  ## mean; either "sulfate" or "nitrate".
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases 
  filenames <- list.files(path = directory, 
                          pattern = "*.csv",
                          full.names=TRUE)
  result <- data.frame("id" = numeric(), "nobs" = numeric())
  for(i in id){
    for(current in filenames){
      df <- read.csv(current)
      name <- df[1,4]
      if(name == i)
        {
          sdf <- subset(df, !is.na(df$sulfate))
          n <- nrow(subset(sdf, !is.na(sdf$nitrate)))
          result <- rbind(result, data.frame("id" = df[1,4], "nobs" = n))
      }
      
    }
  }
  result
}