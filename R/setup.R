
#' Set up common packages and directories
#'
#' Attach `tidyverse`, `RColorBrewer` packages; create aliases to locations
#' on Mazu (optional)
#'
#' @param dirs Should paths to Mazu be loaded? default `TRUE`
#'
#' @return nothing to return
#' @export
#'
#' @examples
setup <- function(dirs = TRUE) {

  library(tidyverse)
  library(RColorBrewer)

  if(dirs) {
    # set the neptune data_edit share based on operating system
    assign('dir_M',
           c('Windows' = '//mazu.nceas.ucsb.edu/ohi',
             'Darwin'  = '/Volumes/ohi',
             'Linux'   = '/home/shares/ohi')[[ Sys.info()[['sysname']] ]] %>%
             path.expand(),
           envir = .GlobalEnv)

    assign('dir_O',
           c('Darwin'  = '/Volumes/ohara',
             'Linux'   = '/home/ohara')[[ Sys.info()[['sysname']] ]] %>%
             path.expand(),
           envir = .GlobalEnv)
  }

  ### Set up some options
  # options(scipen = "999")           ### Turn off scientific notation
  # options(stringsAsFactors = FALSE) ### Ensure strings come in as character types
  return(invisible(TRUE))
}
