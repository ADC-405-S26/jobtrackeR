# Visualize the job application pipeline

Creates a bar chart showing how many applications reached each stage of
the hiring process, from Applied through to Offered. Helps identify
where the most drop-off occurs in your job search.

## Usage

``` r
pipeline_stage(df, status_col = "status")
```

## Arguments

- df:

  A data frame containing job application data.

- status_col:

  Character. Name of the status column. Default is `"status"`.

## Value

A `ggplot2` bar chart object showing application counts by stage.

## Examples

``` r
pipeline_stage(jobs)

```
