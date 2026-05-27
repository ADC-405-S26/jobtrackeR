
<!-- README.md is generated from README.Rmd. Please edit that file -->

# jobtrackr

<!-- badges: start -->

<!-- badges: end -->

Job hunting is daunting, especially in this market nowadays. Between
dozens of applications, different statuses, and offers in different
cities, it is easy to lose track of where everything are.

jobtrackr provides four simple tools to help you organize and analyze
your job search.

## Installation

``` r
# install.packages("pak")
pak::pak("ADC-405-S26/jobtrackeR")
```

## Functions

- `application_summary()` - counts applications by status and returns
  your overall response rate
- `days_since_applied()` - calculates how long each application has been
  waiting and flags ones with no response after a set number of days
- `compare_offers()` - adjusts offer salaries by cost of living so you
  can compare them fairly across cities
- `pipeline_stage()` - visualizes your full hiring funnel from Applied
  to Offered

## Example

``` r
library(jobtrackr)
data(jobs)
application_summary(jobs)
#>        status count percent
#> 1     Applied    10    33.3
#> 2    Rejected    10    33.3
#> 3 Interviewed     7    23.3
#> 4     Offered     3    10.0
```

## Dataset

The package includes `jobs`, a simulated dataset of 30 job applications
with columns for company, position, location, cost of living, status,
date applied, salary, and source.

``` r
head(jobs[, c("company", "position", "status", "salary")])
#>     company         position      status salary
#> 1    Google     Data Analyst Interviewed  95000
#> 2    Amazon   HR Coordinator    Rejected  85000
#> 3  Deloitte Business Analyst     Applied  78000
#> 4 Microsoft   Data Scientist     Offered 110000
#> 5     Apple Jr. Statistician    Rejected  88000
#> 6       IBM    Data Engineer Interviewed  82000
```

## Learn More

For a full walkthrough with real examples and commentary, see the
[Introduction to
jobtrackr](https://adc-405-s26.github.io/jobtrackeR/articles/introduction-to-jobtrackr.html)
vignette.
