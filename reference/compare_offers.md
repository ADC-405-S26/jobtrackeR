# Compare job offers adjusted for cost of living

Filters applications with "Offered" status and computes a cost-of-living
adjusted salary for each, allowing fair comparison across different
locations.

## Usage

``` r
compare_offers(
  df,
  status_col = "status",
  salary_col = "salary",
  col_col = "cost_of_living"
)
```

## Arguments

- df:

  A data frame containing job application data.

- status_col:

  Character. Name of the status column. Default is `"status"`.

- salary_col:

  Character. Name of the salary column. Default is `"salary"`.

- col_col:

  Character. Name of the cost of living index column. Default is
  `"cost_of_living"`. A value of 100 represents the US average.

## Value

A data frame of offered positions with an added `adjusted_salary`
column, sorted from highest to lowest adjusted salary.

## Examples

``` r
compare_offers(jobs)
#>     company              position    location cost_of_living  status
#> 1 Microsoft        Data Scientist  Seattle WA             91 Offered
#> 2 Accenture Management Consultant  Chicago IL             88 Offered
#> 3      Nike            HR Analyst Portland OR             85 Offered
#>   date_applied salary      source adjusted_salary
#> 1   2024-02-01 110000    LinkedIn          120879
#> 2   2024-03-20  95000    Referral          107955
#> 3   2024-03-01  75000 Career Fair           88235
```
