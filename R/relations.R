# Temporal relations after Levy et al. 2021 and Levy 2025

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

ends_before_end_of <- function(x, y, strict = FALSE) { }
ends_after_end_of <- function(x, y, strict = FALSE) { }

ends_before_start_of <- function(x, y, strict = FALSE) { }
starts_after_end_of <- function(x, y, strict = FALSE) { }

meets <- function(x, y, strict = FALSE) { }
met_by <- function(x, y, strict = FALSE) { }

contemporary_with <- function(x, y, strict = FALSE) { }

starts_during <- function(x, y, strict = FALSE) { }
includes_start_of <- function(x, y, strict = FALSE) { }

starts_with <- function(x, y, strict = FALSE) { }
ends_with <- function(x, y, strict = FALSE) { }

overlaps_before <- function(x, y, strict = FALSE) { }
overlaps_after <- function(x, y, strict = FALSE) { }

includes <- function(x, y, strict = FALSE) { }
included_in <- function(x, y, strict = FALSE) { }

begins <- function(x, y, strict = FALSE) { }
begun_by <- function(x, y, strict = FALSE) { }

ends <- function(x, y, strict = FALSE) { }
ended_by <- function(x, y, strict = FALSE) { }

equals <- function(x, y, strict = FALSE) { }


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
