# crg_synchronism.R
# S3 vectors of synchronisms – temporal relations between two periods

#' Temporal synchronism
#'
#' A synchronism defines a known relation between two periods.
#'
#' @param relation Function describing the type of relation, see [crg_relation()]
#' @param x Unique character label of the first period
#' @param y Unique character label of the second period
#'
#' @details
#' `x` and `y` are [recycled to a common length][vctrs::theory-faq-recycling].
#'
#' @return A vector of temporal synchronisms
#' @export
#'
#' @examples
#' synchronism(crg_equals, "A", "B")
synchronism <- function(relation = crg_equals,
                        x = character(),
                        y = character()) {
  # TODO: validate relation
  c(x, y) %<-% vec_cast_common(x, y, .to = character())
  c(x, y) %<-% vec_recycle_common(x, y)
  new_synchronism(relation, x, y)
}

new_synchronism <- function(relation = crg_equals,
                            x = character(),
                            y = character()) {
  new_rcrd(list(relation = relation, x = x, y = y), class = "crg_synchronism")
}
