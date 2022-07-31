#' Join dataframes using datatable functionality
#'
#' A join function for very large dataframes with similar syntax to
#' \code{dplyr::left_join},
#' but using faster \code{data.table::merge()}.
#'
#' @param df1 a large dataframe
#' @param df2 a large dataframe
#' @param by a column to be used as a join key.  Column name must be same
#' in both \code{df1] and \code{df2].
#' @param type What type of join? options 'left', 'full', 'inner'.
#'
#' @return A joined dataframe
#' @export
#'
#' @examples
dt_join <- function(df1, df2, by, type, allow.cartesian = FALSE) {
  ### allow.cartesian for when resulting rows is greater than
  ### nrow(df1) + nrow(df2)
  a <- case_when(type == 'left' ~ c(FALSE, TRUE, FALSE), ### all, all.x, all.y
                 type == 'full' ~ c(TRUE, TRUE, TRUE),
                 type == 'inner' ~ c(FALSE, FALSE, FALSE))

  ### if all = FFF, behaves like inner join; if all = TTT,
  ### behaves like full join; if all = FTF, behaves like left_join?
  dt1 <- data.table::data.table(df1, key = by)
  dt2 <- data.table::data.table(df2, key = by)
  dt_full <- data.table::merge(dt1, dt2,
                               all = a[1], all.x = a[2], all.y = a[3],
                               allow.cartesian = allow.cartesian)
  return(as.data.frame(dt_full))
}
