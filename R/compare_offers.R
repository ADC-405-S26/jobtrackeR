#' Compare job offers adjusted for cost of living
#'
#' Filters applications with "Offered" status and computes a cost-of-living
#' adjusted salary for each, allowing fair comparison across different locations.
#'
#' @param df A data frame containing job application data.
#' @param status_col Character. Name of the status column. Default is `"status"`.
#' @param salary_col Character. Name of the salary column. Default is `"salary"`.
#' @param col_col Character. Name of the cost of living index column.
#'   Default is `"cost_of_living"`. A value of 100 represents the US average.
#'
#' @return A data frame of offered positions with an added `adjusted_salary` column,
#'   sorted from highest to lowest adjusted salary.
#'
#' @examples
#' compare_offers(jobs)
#'
#' @export
compare_offers <- function(df,
                           status_col   = "status",
                           salary_col   = "salary",
                           col_col      = "cost_of_living") {
  
  checkmate::assert_data_frame(df, min.rows = 1)
  checkmate::assert_string(status_col)
  checkmate::assert_string(salary_col)
  checkmate::assert_string(col_col)
  checkmate::assert_names(names(df),
                          must.include = c(status_col, salary_col, col_col))
  
  offers <- df[df[[status_col]] == "Offered", ]
  
  if (nrow(offers) == 0) {
    stop("No applications with status 'Offered' found in the data.", call. = FALSE)
  }
  
  offers$adjusted_salary <- round(offers[[salary_col]] / offers[[col_col]] * 100, 0)
  offers <- offers[order(-offers$adjusted_salary), ]
  rownames(offers) <- NULL
  
  return(offers)
}

