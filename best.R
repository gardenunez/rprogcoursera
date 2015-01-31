best <- function(state, outcome) {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    outcomes <- c("heart attack", "heart failure", "pneumonia")
    indices <- c(11,17,23)
    
    ##validate state and outcome
    if(!state %in% data$State) 
        stop("invalid state")
    if(!outcome %in% outcomes)
        stop("invalid outcome")
    
    ##filter the data
    column <- indices[match(outcome, outcomes)]
    data <- data[data$State == state, c(2, column)]
    data[, 2] <- as.numeric(data[,2])
    data <- na.omit(data)
    
    ## get min rate and candidate hospital. Sort by name and return the top 1
    minRate <- min(data[, 2])
    candidates <- data[data[, 2] == minRate, ]$Hospital.Name
    return(as.character(sort(candidates)[1]))
}