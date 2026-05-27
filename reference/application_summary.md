# Summarize job application statuses

Returns a summary table showing the count and percentage of applications
in each status category, along with the overall response rate.

## Usage

``` r
application_summary(df, status_col = "status")
```

## Arguments

- df:

  A data frame containing job application data.

- status_col:

  Character. Name of the column containing application status values.
  Default is `"status"`.

## Value

A data frame with columns `status`, `count`, and `percent`.

## Examples

``` r
application_summary(jobs)
#> Response rate (non-Applied): 66.7%
#>        status count percent
#> 1     Applied    10    33.3
#> 2    Rejected    10    33.3
#> 3 Interviewed     7    23.3
#> 4     Offered     3    10.0
application_summary(jobs, status_col = "status")
#> Response rate (non-Applied): 66.7%
#>        status count percent
#> 1     Applied    10    33.3
#> 2    Rejected    10    33.3
#> 3 Interviewed     7    23.3
#> 4     Offered     3    10.0
```
