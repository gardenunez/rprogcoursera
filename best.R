source('utils.R')
best <- function(state, outcome) {
    ## Read outcome data
    data <- getOutcomeData(state, outcome)
    
    ## get min rate and candidate hospital. Sort by name and return the top 1
    minRate <- min(data[, 2])
    candidates <- data[data[, 2] == minRate, ]$Hospital.Name
    return(as.character(sort(candidates)[1]))
}