# clg_period.R
# S3 vectors of chronological periods

#' Chronological periods
#'
#' This S3 vector class describes periods of time with by their start, end and
#' duration. Uncertainty about each of these elements is expressed as a lower or
#' upper bound, either of both or which can be `NA`.
#'
#' @param start_lower [yr()] or integer vector (see details) with *terminus post quem* dates of the start of the period.
#' @param start_upper [yr()] or integer vector (see details) with *terminus ante quem* dates of the start of the period.
#' @param end_lower [yr()] or integer vector (see details) with *terminus post quem* dates of the end of the period.
#' @param end_upper [yr()] or integer vector (see details) with *terminus ante quem* dates of the end of the period.
#' @param duration_lower Integer vector of lower bounds of the duration of the period.
#' @param duration_upper Integer vector of upper bounds of the duration of the period.
#'
#' @details
#' The duration of a period can be zero, representing a singular event.
#'
#' @return
#' A vector of periods with S3 class `clg_period`.
#'
#' @export
#'
#' @examples
#' period()
period <- function(
  start_lower = yr(),
  start_upper = yr(),
  end_lower = yr(),
  end_upper = yr(),
  duration_lower = integer(),
  duration_upper = integer()
) {
  # TODO: type assertions
  # TODO: era checks

  new_period(start_lower, start_upper, end_lower, end_upper, duration_lower,
             duration_upper)
}

#' Create a period vector
#'
#' Internal low-level constructor for the `clg_period` class
#'
#' @noRd
#' @keywords internal
new_period <- function(
  start_lower = yr(),
  start_upper = yr(),
  end_lower = yr(),
  end_upper = yr(),
  duration_lower = yr(),
  duration_upper = yr()
) {
  if (!is_yr(start_lower)) abort("`start_lower` must be an era_yr vector.")
  if (!is_yr(start_upper)) abort("`start_upper` must be an era_yr vector.")
  if (!is_yr(end_lower)) abort("`end_lower` must be an era_yr vector.")
  if (!is_yr(end_upper)) abort("`end_upper` must be an era_yr vector.")
  if (!is_vector(duration_lower)) abort("`duration_lower` must be an integer vector.")
  if (!is_vector(duration_upper)) abort("`duration_upper` must be an integer vector.")

  new_rcrd(list(
    start_lower = start_lower,
    start_upper = start_upper,
    end_lower = end_lower,
    end_upper = end_upper,
    duration_lower = duration_lower,
    duration_upper = duration_upper
  ),
  class = "clg_period")
}
