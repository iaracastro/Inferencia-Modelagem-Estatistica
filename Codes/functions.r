model_ic <- function(model) {
    return(c(AIC(model), BIC(model), AICc(model)))
}

# Bias
bias <- function(y, y_hat) {
    return(
        mean(y_hat - y)
    )
}

#Root Mean Squared Error
rmse <- function(y, y_hat) {
    return(
        sqrt(sum((y_hat - y)**2) / length(y))
    )
}

# Mean Absolute Error
mae <- function(y, y_hat) {
    return(
        sum(abs(y_hat - y)) / length(y)
    )
}

#Mean Absolute Relative Error
mare <- function(y, y_hat) {
    return(
        sum(abs(y_hat - y) / abs(ifelse(y != 0, y, 0.1))) / length(y)
    )
}

# Error
errors <- function(model, data, y) {
    y_hat <- predict(model, newdata = data, type = "response")
    return(c(bias(y, y_hat), rmse(y, y_hat), mae(y, y_hat)))
}

# Accuracy
model_evaluation <- function(model, data, y, use_r2 = FALSE, classifier = FALSE) {
    if (classifier) {
        data <- c(accuracy(model, data, y), model_ic(model))
        return(data.frame(Accuracy = data[1], AIC = data[2], BIC = data[3], AICc = data[4]))
    } else {
        data <- c(errors(model, data, y), NaN, model_ic(model))
        if (use_r2) {
            print(summary(model))
            data[4] <- summary(model)$r.squared
        }
        return(data.frame(Bias = data[1], RMSE = data[2], MARE = data[3], R2 = data[4],
                        AIC = data[5], BIC = data[6], AICc = data[7]))
    }
}


get_confusion_matrix <- function(y, y_hat) {
  # Creating a table of actual vs. predicted values
  confusion_matrix <- table(Actual = y, Predicted = y_hat)
  
  # Adding row and column names to the confusion matrix
  rownames(confusion_matrix) <- c("Negative", "Positive")
  colnames(confusion_matrix) <- c("Negative", "Positive")
  
  # Returning the confusion matrix
  return(confusion_matrix)
}

get_accuracy <- function(y, y_hat) {
    # Getting the confusion matrix
    confusion_matrix <- get_confusion_matrix(y, y_hat)
    
    # Calculating the accuracy
    accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
    
    # Returning the accuracy
    return(accuracy)
}

get_recall <- function(y, y_hat) {
    # Getting the confusion matrix
    confusion_matrix <- get_confusion_matrix(y, y_hat)
    
    # Calculating the recall
    recall <- confusion_matrix[2, 2] / sum(confusion_matrix[2, ])
    
    # Returning the recall
    return(recall)
}

get_precision <- function(y, y_hat) {
    # Getting the confusion matrix
    confusion_matrix <- get_confusion_matrix(y, y_hat)
    
    # Calculating the precision
    precision <- confusion_matrix[2, 2] / sum(confusion_matrix[, 2])
    
    # Returning the precision
    return(precision)
}

f1_score <- function(y, y_hat) {
    # Getting the recall and precision
    recall <- get_recall(y, y_hat)
    precision <- get_precision(y, y_hat)
    
    # Calculating the F1 score
    f1_score <- 2 * (precision * recall) / (precision + recall)
    
    # Returning the F1 score
    return(f1_score)
}


fig <- function(width, heigth) {
    options(repr.plot.width = width, repr.plot.height = heigth)
}   

