#' A theme for `ggplot`
#'
#' @param base_size
#'
#' @return `ggplot` `theme` object
#' @export
#'
#' @examples
theme_ohara <- function(base_size = 9) {
  theme(axis.ticks = element_blank(),
        text             = element_text(family = 'Helvetica',
                                        color = 'gray30', size = base_size),
        plot.title       = element_text(size = rel(1.25), hjust = 0, face = 'bold'),
        panel.background = element_blank(),
        legend.position  = 'right',
        panel.border     = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(colour = 'grey90', size = .25),
        legend.key       = element_rect(colour = NA, fill = NA),
        axis.line        = element_blank())
}
