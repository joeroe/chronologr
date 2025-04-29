test_that("can get start_of() and end_of() a two-element numeric vector", {
  expect_equal(start_of(c(0,1)), 0)
  expect_equal(end_of(c(0,1)), 1)
})

test_that("can get start_of() and end_of() a list of vectors", {
  periods <- list(c(0,1), c(2, 3), c(4, 5))
  expect_equal(start_of(periods), c(0, 2, 4))
  expect_equal(end_of(periods), c(1, 3, 5))
})

test_that("temporal relations functions have logically correct result", {
  # starts_before_end_of()
  expect_true(starts_before_end_of(c(0, 1), c(0, 1)))
  expect_false(starts_before_end_of(c(1, 0), c(1, 0)))

  # ends_after_start_of()
  expect_true(ends_after_start_of(c(1, 0), c(1, 0)))
  expect_false(ends_after_start_of(c(0, 1), c(0, 1)))

  # starts_before_start_of()
  expect_true(starts_before_start_of(c(0, 1), c(2, 3)))
  expect_false(starts_before_start_of(c(2, 3), c(0, 1)))

  # starts_after_start_of()
  expect_true(starts_after_start_of(c(2, 3), c(0, 1)))
  expect_false(starts_after_start_of(c(0, 1), c(2, 3)))

  # ends_before_end_of()
  expect_true(ends_before_end_of(c(0, 1), c(2, 3)))
  expect_false(ends_before_end_of(c(2, 3), c(0, 1)))

  # ends_after_end_of()
  expect_true(ends_after_end_of(c(2, 3), c(0, 1)))
  expect_false(ends_after_end_of(c(0, 1), c(2, 3)))

  # ends_before_start_of()
  expect_true(ends_before_start_of(c(0, 1), c(2, 3)))
  expect_false(ends_before_start_of(c(2, 3), c(0, 1)))

  # starts_after_end_of()
  expect_true(starts_after_end_of(c(2, 3), c(0, 1)))
  expect_false(starts_after_end_of(c(0, 1), c(2, 3)))

  # meets()
  expect_true(meets(c(0, 1), c(1, 2)))
  expect_false(meets(c(0, 1), c(2, 3)))

  # met_by()
  expect_true(met_by(c(1, 2), c(0, 1)))
  expect_false(met_by(c(2, 3), c(0, 1)))

  # contemporary_with()
  expect_true(contemporary_with(c(0, 2), c(1, 3)))
  expect_false(contemporary_with(c(0, 1), c(2, 3)))
  expect_false(contemporary_with(c(2, 3), c(0, 1)))

  # starts_during()
  expect_true(starts_during(c(1, 3), c(0, 2)))
  expect_false(starts_during(c(0, 2), c(1, 3)))
  expect_false(includes_start_of(c(2, 3), c(0, 1)))

  # includes_start_of()
  expect_true(includes_start_of(c(0, 2), c(1, 3)))
  expect_false(includes_start_of(c(1, 3), c(0, 2)))
  expect_false(includes_start_of(c(0, 1), c(2, 3)))

  # starts_with()
  expect_true(starts_with(c(0, 1), c(0, 2)))
  expect_false(starts_with(c(0, 2), c(1, 2)))

  # ends_with()
  expect_true(ends_with(c(0, 2), c(1, 2)))
  expect_false(ends_with(c(0, 1), c(0, 2)))

  # overlaps_before()
  expect_true(overlaps_before(c(0, 2), c(1, 3)))
  expect_false(overlaps_after(c(1, 2), c(0, 3)))
  expect_false(overlaps_after(c(0, 1), c(2, 3)))
  expect_false(overlaps_after(c(0, 3), c(1, 2)))

  # overlaps_after()
  expect_true(overlaps_after(c(1, 3), c(0, 2)))
  expect_false(overlaps_after(c(0, 3), c(1, 2)))
  expect_false(overlaps_after(c(2, 3), c(0, 1)))
  expect_false(overlaps_after(c(1, 2), c(0, 3)))

  # includes()
  expect_true(includes(c(0, 3), c(1, 2)))
  expect_false(includes(c(1, 3), c(0, 2)))
  expect_false(includes(c(0, 2), c(1, 3)))

  # included_in()
  expect_true(included_in(c(1, 2), c(0, 3)))
  expect_false(included_in(c(2, 4), c(0, 3)))
  expect_false(included_in(c(1, 3), c(0, 2)))

  # begins()
  expect_true(begins(c(0, 1), c(0, 2)))
  expect_false(begins(c(0, 1), c(1, 2)))
  expect_false(begins(c(0, 2), c(0, 1)))

  # begun_by()
  expect_true(begun_by(c(0, 2), c(0, 1)))
  expect_false(begun_by(c(1, 2), c(0, 1)))
  expect_false(begun_by(c(0, 1), c(0, 2)))

  # ends()
  expect_true(ends(c(1, 2), c(0, 2)))
  expect_false(ends(c(1, 2), c(0, 3)))
  expect_false(ends(c(0, 2), c(1, 2)))

  # ended_by()
  expect_true(ended_by(c(0, 2), c(1, 2)))
  expect_false(ended_by(c(0, 3), c(1, 2)))
  expect_false(ended_by(c(1, 2), c(0, 2)))

  # equal_to()
  expect_true(equal_to(c(0, 2), c(0, 2)))
  expect_false(equal_to(c(0, 2), c(0, 1)))
  expect_false(equal_to(c(0, 2), c(1, 2)))
})

test_that("temporal relations functions respect 'strict' parameter", {
 # TODO
})

test_that("temporal relations functions are vectorised", {
 # TODO
})
