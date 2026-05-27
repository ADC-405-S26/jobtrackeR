test_that("returns a ggplot object", {
  result <- pipeline_stage(jobs)
  expect_s3_class(result, "ggplot")
})

test_that("errors on non data frame input", {
  expect_error(pipeline_stage("not a df"))
})

test_that("errors when status column does not exist", {
  expect_error(pipeline_stage(jobs, status_col = "wrong_col"))
})