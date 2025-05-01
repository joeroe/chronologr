# crg_add_synchronism.R
# Temporal relations

#' Temporal synchronisms
#'
#' Functions for specifying known temporal relations between two periods within
#' a chronological graph model.
#'
#' @param chronograph A [chronograph()] model
#' @param relation Character. One of the types of relations defined below.
#' @param x,y Numeric indices or character labels of the two periods referred to
#'   by `relation`
#'
#' @export
#'
#' @examples
#' model <- chronograph(periods = c("X", "Y"))
#' crg_add_synchronism(chronograph, "equal_to", "X", "Y")
#' crg_equal_to(chronograph, "X", "Y")
crg_add_synchronism <- function(chronograph, relation, x, y) {
  # TODO: verify that x and y exist in chronograph
  new_sync <- new_synchronism(relation, x, y)
  chronograph@synchronisms <- c(chronograph@synchronisms, new_sync)
  chronograph
}

#' @rdname crg_add_synchronism
#' @export
crg_equal_to <- function(chronograph, x, y) {
  crg_add_synchronism(chronograph, "equals", x, y)
}

# TODO: other synchronisms
