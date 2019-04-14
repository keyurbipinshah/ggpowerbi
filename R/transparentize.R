#' @importFrom grDevices col2rgb rgb
#'
transparentize <- function(cols, alpha = NA) {
  col <- grDevices::col2rgb(cols, TRUE)/255
  if (length(cols) != length(alpha)) {
    if (length(cols) > 1 && length(alpha) > 1) {
      stop("Only one of colour and alpha can be vectorised")
    }
    if (length(cols) > 1) {
      alpha <- rep(alpha, length.out = length(cols))
    }
    else if (length(alpha) > 1) {
      col <- col[, rep(1, length(alpha)), drop = FALSE]
    }
  }
  alpha[is.na(alpha)] <- col[4, ][is.na(alpha)]
  new_col <- grDevices::rgb(col[1, ], col[2, ], col[3, ],
                            alpha)
  new_col[is.na(cols)] <- NA
  new_col
}
