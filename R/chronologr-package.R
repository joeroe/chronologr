# S7 method registration
.onLoad <- function(...) {
  S7::methods_register()
}

# Enable usage of <S7_object>@name in package code
#' @rawNamespace if (getRversion() < "4.3.0") importFrom("S7", "@")
NULL

#' @keywords internal
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL

#' Internal rlang methods
#'
#' @import rlang
#' @keywords internal
#' @name chronologr-rlang
NULL

#' Internal rlang methods
#'
#' @import rlang
#' @keywords internal
#' @name chronologr-rlang
NULL

#' Internal vctrs methods
#'
#' @import vctrs
#' @keywords internal
#' @name chronologr-vctrs
NULL

#' Internal zeallot methods
#'
#' @import zeallot
#' @keywords internal
#' @name chronologr-zeallot
NULL

#' Internal era methods
#'
#' @import era
#' @keywords internal
#' @name chronologr-era
NULL
