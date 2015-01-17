joindf <- function(directory)
{
  filenames <- list.files(path = directory, 
                          pattern = "*.csv",
                          full.names=TRUE)
  result <- data.frame()
  for(f in filenames){
    df <- read.csv(f)
    result <- rbind(result, df)
  }
  return(result)
}