# chronograph.R
# S3 vector crg_chronograph – a chronological network model described by
# relations between constrained periods

chronograph <- function(periods = character(),
                        relations = character()) {
  # TODO: validation of periods
  # TODO: validation of relations
  new_chronograph(periods, relations)
}

new_chronograph <- function(periods = character(),
                            relations = character()) {
  structure(
    list(
      periods = periods,
      relations = relations
    ),
    class = "crg_chronograph"
  )
}

print.crg_chronograph <- function(x, ...) {
  cat("<Chronograph>\n\n")
  cat("Periods:")
  str(x$periods)
  cat("Relations:")
  str(x$relations)
  invisible(x)
}
