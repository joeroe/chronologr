# relations.R
# Temporal relations between periods
#
# References:
# - Levy et al. 2021 <https://doi.org/10.1016/j.jas.2020.105225> 
# - Levy in press.

starts_before_end_of <- function(x, y, strict = FALSE) {
  lt(start_of(x), end_of(y), strict)
}

ends_after_start_of <- function(x, y, strict = FALSE) {
  gt(start_of(x), end_of(y), strict)
}

starts_before_start_of <- function(x, y, strict = FALSE) {
  lt(start_of(x), start_of(y), strict)
}

starts_after_start_of <- function(x, y, strict = FALSE) {
  gt(start_of(x), start_of(y), strict)
}

ends_before_end_of <- function(x, y, strict = FALSE) { 
  lt(end_of(x), end_of(y), strict)
}

ends_after_end_of <- function(x, y, strict = FALSE) { 
  gt(end_of(x), end_of(y), strict)
}

ends_before_start_of <- function(x, y, strict = FALSE) {
  lt(end_of(x), start_of(y), strict)
}

starts_after_end_of <- function(x, y, strict = FALSE) { 
  gt(start_of(x), end_of(y), strict)
}

meets <- function(x, y, strict = FALSE) {
  end_of(x) == start_of(y)
}

met_by <- function(x, y, strict = FALSE) {
  start_of(x) == end_of(y)
}

contemporary_with <- function(x, y, strict = FALSE) {
  gt(end_of(x), start_of(y), strict) & 
    lt(start_of(x), end_of(y), strict)
}

starts_during <- function(x, y, strict = FALSE) {
  start_of(y) |>
    lt(start_of(x), strict) |>
    lt(end_of(y), strict)
}

includes_start_of <- function(x, y, strict = FALSE) { 
  start_of(x) |>
    lt(start_of(y), strict) |>
    lt(end_of(x), strict)
}

starts_with <- function(x, y, strict = FALSE) { 
  start_of(x) == end_of(y)
}

ends_with <- function(x, y, strict = FALSE) {
  end_of(x) == end_of(y)
}

overlaps_before <- function(x, y, strict = FALSE) { 
  start_of(x) |>
    lt(start_of(y), strict) |>
    lt(end_of(x), strict) |>
    lt(end_of(y), strict)
}

overlaps_after <- function(x, y, strict = FALSE) { 
  start_of(y) |>
    lt(start_of(x), strict) |>
    lt(end_of(y), strict) |>
    lt(end_of(x), strict)
}

includes <- function(x, y, strict = FALSE) { 
  lt(start_of(x), start_of(y), strict) &
    gt(end_of(x), end_of(y), strict)
}

included_in <- function(x, y, strict = FALSE) { 
  gt(start_of(x), start_of(y), strict) &
    lt(end_of(x), end_of(y), strict)
}

begins <- function(x, y, strict = FALSE) { 
  (start_of(x) == start_of(y)) &
    lt(end_of(x), end_of(y), strict)
}

begun_by <- function(x, y, strict = FALSE) { 
  (start_of(x) == start_of(y)) &
    gt(end_of(x), end_of(y), strict)
}

ends <- function(x, y, strict = FALSE) { 
  (end_of(x) == end_of(y)) &
    gt(start_of(x), start_of(y))
}

ended_by <- function(x, y, strict = FALSE) { 
  (end_of(x) == end_of(y)) &
    lt(start_of(x), start_of(y))
}

equals <- function(x, y, strict = FALSE) { 
  (start_of(x) == start_of(y)) &
    (end_of(x) == end_of(y))
}


# Helper functions --------------------------------------------------------

#' @noRd
#' @keywords internal
lt <- function(x, y, strict = FALSE) {
  ifelse(strict, x < y, x <= y)
}

#' @noRd
#' @keywords internal
gt <- function(x, y, strict = FALSE) {
  ifelse(strict, x > y, x >= y)
}

#' @noRd
#' @keywords internal
start_of <- function(x) {
  x[1]
}

#' @noRd
#' @keywords internal
end_of <- function(x) {
  x[2]
}
