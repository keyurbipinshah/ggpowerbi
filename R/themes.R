#' @title Complete themes
#'
#' @name pbitheme
#'
#' @description These are complete themes from Microsoft Power BI which control
#' all non-data display.
#'
#' @param base_size base font size
#'
#' @param base_family base font family
#'
#' @param base_line_size base size for line elements
#'
#' @param base_rect_size base size for rect elements
#'
#' @details
#' \describe{
#'    \item{theme_pbi}{A theme similar to one shown in Microsoft Power BI}
#' }
#'
#' @examples
#' if (require(ggplot2)) {
#'    mtcars2 <- within(mtcars, {
#'     vs <- factor(vs, labels = c("V-shaped", "Straight"))
#'     am <- factor(am, labels = c("Automatic", "Manual"))
#'     cyl <- factor(cyl)
#'     gear <- factor(gear)
#'    })
#'
#'   p1 <- ggplot(mtcars2) +
#'     geom_point(aes(x = wt, y = mpg, colour = gear)) +
#'     labs(title = "Fuel economy declines as weight increases",
#'          subtitle = "(1973-74)",
#'          caption = "Data from the 1974 Motor Trend US magazine.",
#'          tag = "Figure 1",
#'          x = "Weight (1000 lbs)",
#'          y = "Fuel economy (mpg)",
#'          colour = "Gears")
#'
#'   p1 + theme_pbi()
#' }
#'
#' # Theme examples with panels
#'
#' if (require(ggplot2)) {
#'   p2 <- p1 + facet_grid(vs ~ am)
#'
#'   p2 + theme_pbi()
#' }
#'
#' @importFrom ggplot2 theme_bw theme
#'
#' @importFrom ggplot2 element_text element_blank element_line element_rect
#'
#' @export
#'
theme_pbi <- function(base_size = 11, base_family = "", base_line_size = base_size / 22,
                      base_rect_size = base_size / 22) {
  theme_bw(base_size = base_size, base_family = base_family,
           base_line_size = base_line_size, base_rect_size = base_rect_size) +
    theme(plot.title = element_text(colour = "firebrick3"),
          plot.subtitle = element_text(colour = "#777777"),
          plot.caption = element_text(colour = "#777777"),
          legend.title.align = 0.5,
          axis.ticks = element_blank(),
          panel.grid = element_line(colour = "#EAEAEA"),
          axis.text = element_text(colour = "#777777"),
          legend.text = element_text(colour = "#777777"),
          panel.border = element_rect(colour = "#EAEAEA"),
          panel.grid.minor = element_blank(),
          strip.background = element_rect(colour = "grey85"),
          strip.text = element_text(colour = "white"))
}
