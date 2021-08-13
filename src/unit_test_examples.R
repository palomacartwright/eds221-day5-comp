# Testing testthat

# Requres packages: 
# install.packages('testthat')
# install.packages('devtools')
# install.packages('remotes')

# Create a function that takes any numeric data frame (all variables are numbers), finds the mean of all columns, then finds the maximum column mean, and the minimum column mean from that data frame, and returns those min & max mean values in a vector (min_mean_val, max_mean_val)

# apply(X = df, MARGIN = 2, FUN = mean, na.rm = TRUE)

library(testthat)

#' Title: Mean Range function 
#' This function calculates the mean of every column in a data frame and returns the the max and min means in a vector 
#' @param dataframe 
#'
#' @return
#' @export
#'
#' @examples
mean_range <- function(dataframe){
  col_means <- apply(X = dataframe, MARGIN = 2, FUN = mean, na.rm = TRUE)
  max_col_mean <- max(col_means)
  min_col_mean <- min(col_means)
  return(c(min_col_mean, max_col_mean))
 
}

mean_range(mtcars)

expect_length(mean_range(mtcars), 2)
expect_true(mean_range(mtcars)[1] < mean_range(mtcars)[2])
class(mean_range(mtcars))
expect_type(mean_range(mtcars), "double")

