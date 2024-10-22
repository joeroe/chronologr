# crg_relation.R
# Temporal relations

#' Temporal relations
#'
#' Functions expressing different types of temporal relation between two
#' periods.
#'
#' @param type Character. One of the types of relations defined below.
#' @param x Unique character label of the first period
#' @param y Unique character label of the second period
#'
#' @export
#'
#' @examples
#' # Expresses that the periods labelled 'X' and 'Y' are equal:
#' crg_relation("equals", "X", "Y")
#'
#' # Which is equivalent to:
#' crg_relation("equals", "X", "Y")
crg_relation <- function(type = "equals", x, y) {

}

#' @rdname crg_relation
#' @export
crg_equals <- function(x, y) {
  warn("'equals' relation has not yet been implemented",
          class = "crg_not_yet_implemented")
  "equals"
}
