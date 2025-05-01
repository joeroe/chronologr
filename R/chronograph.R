# chronograph.R
# S7 class crg_chronograph – a chronological network model described by
# relations between constrained periods

#' @export
Chronograph <- new_class(
  "Chronograph",
  properties = list(periods = class_vector, synchronisms = class_vector)
)
