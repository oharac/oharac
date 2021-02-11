#' Show duplicate items in a dataframe
#'
#' Identifies and returns duplicated values within a given column of a dataframe.
#'
#' @param x A dataframe
#' @param y A character column name within dataframe \code{x}
#' @param na.rm
#'
#' @return A dataframe that includes all rows of \code{x} with duplicated values
#' in the given column \code{y}.
#' @export
#'
#' @examples
show_dupes <- function(x, y, na.rm = FALSE) {
  if(na.rm) x <- x[!is.na(x[[y]]), ]

  # x is data frame, y is field (as character) within that dataframe
  z <- x[x[[y]] %in% x[[y]][duplicated(x[[y]])], ]
  return(z)
}
