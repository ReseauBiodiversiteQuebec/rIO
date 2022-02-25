test_that("post envelopes works", {
      response <- post_envelopes(
        geom_ewkt = "SRID=4326;POLYGON((-76.355 37.009,-76.350 37.010,-76.349 37.001,-76.354 37.001,-76.355 37.009))",
        taxa_scientific_name = "Binto binto",
        category = "current",
        year = 2022,
        scenario = "Fake. To be ignored",
        threshold_desc = NULL
    )
  testthat::expect_null(response, "list")
})
