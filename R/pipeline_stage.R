#' Visualize the job application pipeline
#'
#' Creates a bar chart showing how many applications reached each stage of the
#' hiring process, from Applied through to Offered. Helps identify where
#' the most drop-off occurs in your job search.
#'
#' @param df A data frame containing job application data.
#' @param status_col Character. Name of the status column. Default is `"status"`.
#'
#' @return A `ggplot2` bar chart object showing application counts by stage.
#'
#' @examples
#' pipeline_stage(jobs)
#'
#' @export
pipeline_stage <- function(df, status_col = "status") {
  
  stage <- count <- NULL
  
  checkmate::assert_data_frame(df, min.rows = 1)
  checkmate::assert_string(status_col)
  checkmate::assert_names(names(df), must.include = status_col)
  
  valid_stages <- c("Applied", "Interviewed", "Offered", "Rejected")
  stage_order  <- c("Applied", "Interviewed", "Offered")
  
  unknown <- setdiff(unique(df[[status_col]]), valid_stages)
  if (length(unknown) > 0) {
    warning("Unknown status values found and ignored: ",
            paste(unknown, collapse = ", "), call. = FALSE)
  }
  
  pipeline_df <- df[df[[status_col]] %in% stage_order, ]
  counts      <- as.data.frame(table(pipeline_df[[status_col]]))
  names(counts) <- c("stage", "count")
  counts$stage  <- factor(counts$stage, levels = stage_order)
  
  ggplot2::ggplot(counts, ggplot2::aes(x = stage, y = count, fill = stage)) +
    ggplot2::geom_col(width = 0.6, show.legend = FALSE) +
    ggplot2::geom_text(ggplot2::aes(label = count),
                       vjust = -0.5, size = 4.5) +
    ggplot2::scale_fill_manual(
      values = c("Applied" = "#4C9BE8",
                 "Interviewed" = "#F4A261",
                 "Offered" = "#2A9D8F")) +
    ggplot2::labs(
      title = "Job Application Pipeline",
      x     = "Stage",
      y     = "Number of Applications"
    ) +
    ggplot2::theme_minimal(base_size = 13)
}
