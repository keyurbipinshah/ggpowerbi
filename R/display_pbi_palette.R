#' @title Display Microsoft Power BI Palettes
#'
#' @param palette A palette name from \code{names(pbi_palettes)}, defaults to
#' \code{default} palette
#'
#' @param n Number of colours from the palette to display
#'
#' @return Plot of colours
#'
#' @author Keyur Shah
#'
#' @examples
#' display_pbi_pal("classic", 5)
#'
#' @importFrom graphics image
#'
#' @export
#'
display_pbi_pal <- function(palette = "classic", n = length(pbi_palettes[[palette]])) {
  if (!is.character(palette) || !palette %in% names(pbi_palettes)) {
    warning("Unknown palette ", palette)
    palette <- "classic"
  }
  palette_name <- palette
  palette <- pbi_pal(palette = palette)(n)
  graphics::image(1:n, 1, as.matrix(seq_len(n)), col = palette,
                  xlab = palette_name, ylab = "", xaxt = "n",
                  yaxt = "n", bty = "n")
}
