#' Show duplicate items in a dataframe
#'
#' Identifies large files in the current working directory to help avoid
#' problems with storing large files via Git/GitHub
#'
#' @param thresh A file size threshold, default = 5e6
#'
#' @return A dataframe that includes file name and file size of all files larger than \code{thresh}
#' @export
#'
#' @examples
#'
find_big_files <- function(thresh = 5e6) {
  fs <- list.files('.', full.names = TRUE, recursive = TRUE)
  fsize <- file.size(fs)
  df <- data.frame(f = fs, size = fsize)
  df$file = basename(df$f)
  df_big <- df[df$size > thresh, ]
  df_big <- df_big[order(df_big$size, decreasing = TRUE), ]
  return(df_big)
}
