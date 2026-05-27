#' Calculate days since each application was submitted
#'
#' Computes the number of days between each application date and today (or a
#' reference date), and flags applications that have received no response
#' after a specified number of days.
#'
#' @param df A data frame containing job application data.
#' @param date_col Character. Name of the column containing application dates.
#'   Must be of class `Date`. Default is `"date_applied"`.
#' @param status_col Character. Name of the status column. Default is `"status"`.
#' @param flag_after Numeric. Number of days after which an "Applied" application
#'   is considered potentially ghosted. Default is `21`.
#' @param reference_date A `Date` object to calculate days from. Defaults to
#'   `Sys.Date()`.
#'
#' @return The original data frame with two added columns: `days_waiting` and
#'   `possibly_ghosted` (logical).
#'
#' @examples
#' days_since_applied(jobs)
#' days_since_applied(jobs, flag_after = 14)
#'
#' @export
days_since_applied <- function(df,
                               date_col       = "date_applied",
                               status_col     = "status",
                               flag_after     = 21,
                               reference_date = Sys.Date()) {
  
  checkmate::assert_data_frame(df, min.rows = 1)
  checkmate::assert_string(date_col)
  checkmate::assert_string(status_col)
  checkmate::assert_number(flag_after, lower = 1)
  checkmate::assert_names(names(df), must.include = c(date_col, status_col))
  
  if (!inherits(df[[date_col]], "Date")) {
    stop(paste0("Column '", date_col, "' must be of class Date. ",
                "Try converting with as.Date()."), call. = FALSE)
  }
  
  df$days_waiting <- as.numeric(reference_date - df[[date_col]])
  
  df$possibly_ghosted <- df[[status_col]] == "Applied" &
    df$days_waiting > flag_after
  
  return(df)
}
