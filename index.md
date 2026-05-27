# jobtrackr

jobtrackr helps you track, organize, and analyze your job applications.
It provides four simple tools to summarize application statuses, flag
applications with no response, compare offers adjusted for cost of
living, and visualize your hiring pipeline.

## Installation

``` r
# install.packages("pak")
pak::pak("ADC-405-S26/jobtrackeR")
```

## Quick Start

``` r
library(jobtrackr)
data(jobs)
```

### Summarize your applications

``` r
application_summary(jobs)
#> Response rate (non-Applied): 66.7%
#>        status count percent
#> 1     Applied    10    33.3
#> 2    Rejected    10    33.3
#> 3 Interviewed     7    23.3
#> 4     Offered     3    10.0
```

### Compare offers by cost of living

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

For a full walkthrough of all four functions with real examples and
detailed commentary, see the [Introduction to
jobtrackr](https://adc-405-s26.github.io/jobtrackeR/articles/introduction-to-jobtrackr.html)
vignette.
