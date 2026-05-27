test_that("returns a data frame", {
  result <- compare_offers(jobs)
  expect_s3_class(result, "data.frame")
})

test_that("only returns offered rows", {
  result <- compare_offers(jobs)
  expect_true(all(result$status == "Offered"))
})

test_that("adjusted_salary column exists", {
  result <- compare_offers(jobs)
  expect_true("adjusted_salary" %in% names(result))
})

test_that("errors when no offered applications exist", {
  no_offers <- jobs[jobs$status != "Offered", ]
  expect_error(compare_offers(no_offers))
})