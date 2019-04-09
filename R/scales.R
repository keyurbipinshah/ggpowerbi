#' @title Color and fill scales from Microsoft PowerBI
#'
#' @description The \code{pbi} scales provide default, city park, classroom,
#' colorblind safe, electric, high contrast, sunset and twilight color schemes
#' from Microsoft Power BI. These are well suited to display discrete values.
#'
#' The Microsoft PowerBI scales are not designed to be extended to continuous
#' data.
#'
#' @param ... Other arguments passed on to \code{\link[ggplot2]{discrete_scale}}
#'
#' @param palette A palette name from \code{names(pbi_palettes)}
#'
#' @param direction Sets the order of colours in the scale. If -1, the order of colours
#' is reversed. Defaults to 1
#'
#' @param aesthetics Character string or vector of character strings listing
#' the name(s) of the aesthetic(s) that this scale works with. This can be
#' useful, for example, to apply colour settings to the \code{colour} and
#' \code{fill} aesthetics at the same time via
#' \code{aesthetics = c("colour", "fill")}
#'
#' @examples
#'
#' if (require(ggplot2)) {
#'   ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
#'    geom_point(size = 4) +
#'    theme_bw(base_family = "mono") +
#'    scale_color_pbi(palette = "twilight")
#'
#'   ggplot(mpg, aes(x = manufacturer, fill = manufacturer)) +
#'    geom_bar() +
#'    scale_fill_pbi(palette = "colorblind safe") +
#'    theme_bw(base_family = "serif") +
#'    labs(x = "Manufacturer",
#'         y = "Count",
#'         title = "Manufacturer Counts",
#'         subtitle = "Dodge is highest!")
#' }
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @export
#'
scale_color_pbi <- function(..., palette = "default", direction = 1, aesthetics = "colour") {
  ggplot2::discrete_scale(aesthetics, "pbi", pbi_pal(palette, direction), ...)
}

#' @rdname scale_color_pbi
#'
#' @export
#'
scale_colour_pbi <- scale_color_pbi

#' @rdname scale_color_pbi
#'
#' @export
#'
scale_fill_pbi <- function(..., palette = "default", direction = 1, aesthetics = "fill") {
  ggplot2::discrete_scale(aesthetics, "pbi", pbi_pal(palette, direction), ...)
}
