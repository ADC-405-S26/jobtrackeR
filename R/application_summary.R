#' Summarize job application statuses
#'
#' Returns a summary table showing the count and percentage of applications
#' in each status category, along with the overall response rate.
#'
#' @param df A data frame containing job application data.
#' @param status_col Character. Name of the column containing application
#'   status values. Default is `"status"`.
#'
#' @return A data frame with columns `status`, `count`, and `percent`.
#'
#' @examples
#' application_summary(jobs)
#' application_summary(jobs, status_col = "status")
#'
#' @export
application_summary <- function(df, status_col = "status") {
  
  checkmate::assert_data_frame(df, min.rows = 1)
  checkmate::assert_string(status_col)
  checkmate::assert_names(names(df), must.include = status_col)
  
  counts <- as.data.frame(table(df[[status_col]]))
  names(counts) <- c("status", "count")
  counts$percent <- round(counts$count / sum(counts$count) * 100, 1)
  counts <- counts[order(-counts$count), ]
  rownames(counts) <- NULL
  
  message("Response rate (non-Applied): ",
          round(sum(counts$count[counts$status != "Applied"]) /
                  sum(counts$count) * 100, 1), "%")
  
  return(counts)
}
