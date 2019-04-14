#' @title Microsoft PowerBI palettes
#'
#' @description Creates nice looking color palettes from Microsoft PowerBI
#'
#' \code{pbi_pal} makes the color palettes from Microsoft PowerBI available
#'  as R palettes. Names of 8 palettes are as follows:
#'  \enumerate{
#'   \item \code{default}
#'   \item \code{city park}
#'   \item \code{classroom}
#'   \item \code{colorblind safe}
#'   \item \code{electric}
#'   \item \code{high contrast}
#'   \item \code{sunset}
#'   \item \code{twilight}
#'  }
#'
#' @param palette A palette name from \code{names(pbi_palettes)}, defaults to
#' \code{default} palette
#'
#' @param direction Sets the order of colours in the scale. If -1, the order of
#' colours is reversed. Defaults to 1
#'
#' @return A function with paramater \code{n}, number of colors required from
#'  the palette \code{name} palette
#'
#' @author Keyur Shah
#'
#' @examples
#' pbi_pal("default", direction = 1)(10)
#'
#' @export
#'
pbi_pal <- function(palette = "default", direction = 1) {
  if (!is.character(palette) || !palette %in% names(pbi_palettes)) {
    warning("Unknown palette ", palette)
    palette <- "default"
  }
  palette <- pbi_palettes[[palette]]
  max_len <- length(palette)
  function(n) {
    if (direction == -1) {
      palette <- rev(palette)
    }
    # if (n >= max_len) {
    #   palette <- palette
    # } else {
    #   palette <- palette[seq_len(n)]
    # }
    n_grps <- n %/% max_len
    alphas <- seq(from = 1, by = -1 / (1 + n_grps), length.out = (1 + n_grps))
    palette <- lapply(alphas, function(x) transparentize(palette, x))
    palette <- unlist(palette)[seq_len(n)]
    palette
  }
}
