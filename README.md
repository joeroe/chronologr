
<!-- README.md is generated from README.Rmd. Please edit that file -->

# chronograph

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/chronograph)](https://CRAN.R-project.org/package=chronograph)
[![R-CMD-check](https://github.com/joeroe/chronograph/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/joeroe/chronograph/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/joeroe/chronograph/graph/badge.svg)](https://app.codecov.io/gh/joeroe/chronograph)
<!-- badges: end -->

chronograph is an experimental R port of the
[ChronoLog](https://chrono.ulb.be/) software for modelling chronological
networks (Levy et al. 2021,
<https://doi.org/10.1016/j.jas.2020.105225>).

## Installation

You can install the development version of chronograph from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("joeroe/chronograph")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
# CONCEPT - none of this actually works
library(chronograph)

# MODEL CONSTRUCTION ----------------------------------------------------------
chronograph() |>
  crg_add_period(name = "A", start = c(5, 10), end = c(10, NA), 
                 duration = c(0, 0)) |> # vectorised, so can add multiple periods at once
  crg_add_period(name = "B", start = 5, end = NA, duration = 10) |>
  crg_add_event(name = "a", date = -20) |> # alias for period with duration 0
  crg_add_relation("equals", "A", "B") |>
  crg_equals("A", "B") |> # Equivalent to ^
  add_sequence(c("A", "B")) -> # shortcut for adding a series of relations
  model

model
# crg_chronograph class
#
# Periods:
# period  start  end  duration
# A       5      10   0
# ...
#
# Relations:
# relation  v1  v2
# equal     A   B
# ...


# MODEL IMPORT ----------------------------------------------------------------
existing_model <- read_clog("my-chronolog-model.clog")

model_from_existing_data <- chronograph(
  periods = readr::read_csv("my_periods.csv")
) |>
  crg_add_relation(...)


# TIGHTENING ------------------------------------------------------------------
# turns a chronograph into a constraint graph, maybe private?
# - map over periods, create two nodes for each
# - additional node for origin of time
# - map over relations, create N edges for each
# - thin graph to only the lowest weighted edge between each pair of nodes
crg_as_constgraph(model) 

# Validation (called before tightening, but also user-facing)
# detect cycles with negative total weight (using the graph from crg_as_graph)
crg_validate(model) 

# Tightening
# calls crg_as_graph() and crg_validate(), find all pairs shortest paths (APSP,
# Johnson's algo), return a tightened model
tightened_model <- crg_tighten(model) 

tightened_model
# crg_chronograph_tightened class
# 
# Periods:
# period  start  end  duration
# A       7      7    0
# ...
#
# Relations:
# relation  v1  v2
# equal     A   B
# ...
#
# @shortest_path: ...


# QUERYING TIGHTENED MODELS ---------------------------------------------------
# Simple subsetting with base R or tidyverse functions
tightened_model[tightened_model$period == "A",]
dplyr::filter(tightened_model, period == "A")

# Trace (using @shortest_path)
crg_trace(tightened_model)

# Query parts of the shortest path matrix not 
crg_delay_between(tightened_model, "A", "B")


# ITERATIVE FURTHER MODELLING -------------------------------------------------
model2 <- model |>
  crg_add_period2(...)

tightened_model2 <- crg_tighten()

# etc....
```
