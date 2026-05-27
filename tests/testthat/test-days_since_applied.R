test_that("returns a data frame", {
  result <- days_since_applied(jobs)
  expect_s3_class(result, "data.frame")
})

test_that("days_waiting column is added", {
  result <- days_since_applied(jobs)
  expect_true("days_waiting" %in% names(result))
})

test_that("possibly_ghosted column is logical", {
  result <- days_since_applied(jobs)
  expect_type(result$possibly_ghosted, "logical")
})

test_that("errors when date column is not Date class", {
  bad_df <- jobs
  bad_df$date_applied <- as.character(bad_df$date_applied)
  expect_error(days_since_applied(bad_df))
})