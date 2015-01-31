rankall <- function(outcome, num = "best") {
    outcomes <- c('heart attack', 'heart failure', 'pneumonia')
    indices <- c(11, 17, 23)
    
    if (!outcome %in% outcomes) stop("invalid outcome")
    
    data <- read.csv("outcome-of-care-measures.csv")
    
    column <- indices[match(outcome, outcomes)]
    data <- data[, c(2, 7, column)]
    data[, 3] <- as.numeric(as.character(data[, 3]))
    data <- na.omit(data)
    names(data) <- c("hospital", "state", "rate")
    
    results <- NULL
    
    for(state in levels(data$state)) {
        hospitalsState <- data[data$state == state, ]
        if (num == "best"){
            n <- 1
        }
        else if (num == "worst") {
            n <- nrow(hospitalsState)
        } else {
            n <- as.numeric(num)
            
        }
        result <- hospitalsState[order(hospitalsState$rate,
                                       hospitalsState$hospital),
                                 c(1, 2)][n, ]
        result$state <- rep(state, nrow(result))
        results <- rbind(results, result)
    }
    
    rownames(results) <- NULL
    return(results)
}