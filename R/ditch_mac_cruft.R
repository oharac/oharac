#' Ditch Mac cruft
#'
#' Drops all those annoying Mac-specific files such as \code{.DS_Store} within the
#' current R project directory and subdirectories.
#'
#' @return
#' @export
#'
#' @examples
ditch_mac_cruft <- function() {
  all_files <- list.files(here::here(), all.files = TRUE,
                          recursive = TRUE, full.names = TRUE)

  cruft <- all_files[stringr::str_detect(basename(all_files), pattern = '^\\._|^\\.DS_Store')]

  unlink(cruft)
}
