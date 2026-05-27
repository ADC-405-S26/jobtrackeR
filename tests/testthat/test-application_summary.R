
test_that("returns a data frame", {
  result <- application_summary(jobs)
  expect_s3_class(result, "data.frame")
})

test_that("has correct column names", {
  result <- application_summary(jobs)
  expect_named(result, c("status", "count", "percent"))
})

test_that("errors on non data frame input", {
  expect_error(application_summary("not a df"))
})

test_that("errors when column does not exist", {
  expect_error(application_summary(jobs, status_col = "wrong_col"))
})