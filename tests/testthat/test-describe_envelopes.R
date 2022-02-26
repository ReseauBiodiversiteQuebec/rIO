test_that("describe all envelopes works", {
  envelopes <- describe_envelopes()
  testthat::expect_true(nrow(envelopes) > 1)
})

test_that("describe filtered envelopes works", {
  envelopes <- describe_envelopes(year = 2022)
  testthat::expect_true(nrow(envelopes) > 1)
})