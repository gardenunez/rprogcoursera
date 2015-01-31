source('utils.R')
rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    data <- getOutcomeData(state, outcome)
    if(num == "best"){
        num <- 1}
    else if(num == "worst"){
        num <- nrow(data)
    }
    else{
        num <- as.numeric(num)
        if(num > nrow(data)){
            return(NA)
        }
    }
    return(as.character(data[order(data[,2], data[ ,1]),1][num]))    
}