# Calculate days since each application was submitted

Computes the number of days between each application date and today (or
a reference date), and flags applications that have received no response
after a specified number of days.

## Usage

``` r
days_since_applied(
  df,
  date_col = "date_applied",
  status_col = "status",
  flag_after = 21,
  reference_date = Sys.Date()
)
```

## Arguments

- df:

  A data frame containing job application data.

- date_col:

  Character. Name of the column containing application dates. Must be of
  class `Date`. Default is `"date_applied"`.

- status_col:

  Character. Name of the status column. Default is `"status"`.

- flag_after:

  Numeric. Number of days after which an "Applied" application is
  considered potentially ghosted. Default is `21`.

- reference_date:

  A `Date` object to calculate days from. Defaults to
  [`Sys.Date()`](https://rdrr.io/r/base/Sys.time.html).

## Value

The original data frame with two added columns: `days_waiting` and
`possibly_ghosted` (logical).

## Examples

``` r
days_since_applied(jobs)
#>          company              position         location cost_of_living
#> 1         Google          Data Analyst      New York NY            100
#> 2         Amazon        HR Coordinator        Austin TX             82
#> 3       Deloitte      Business Analyst       Chicago IL             88
#> 4      Microsoft        Data Scientist       Seattle WA             91
#> 5          Apple      Jr. Statistician San Francisco CA            110
#> 6            IBM         Data Engineer        Austin TX             82
#> 7           Meta       Product Analyst      New York NY            100
#> 8          Tesla    Operations Analyst        Austin TX             82
#> 9           Nike            HR Analyst      Portland OR             85
#> 10    Salesforce            BI Analyst San Francisco CA            110
#> 11      JPMorgan     Financial Analyst      New York NY            100
#> 12 Goldman Sachs          Risk Analyst      New York NY            100
#> 13        Target  Supply Chain Analyst   Minneapolis MN             78
#> 14        Disney     Marketing Analyst       Orlando FL             89
#> 15        Oracle       Systems Analyst        Austin TX             82
#> 16     Accenture Management Consultant       Chicago IL             88
#> 17           PWC       Audit Associate       Chicago IL             88
#> 18      Lockheed      Systems Engineer    Fort Worth TX             80
#> 19        Boeing          Data Analyst       Chicago IL             88
#> 20        Pfizer      Research Analyst      New York NY            100
#> 21            EY         Tax Associate        Dallas TX             80
#> 22          KPMG      Advisory Analyst       Atlanta GA             83
#> 23          Uber    Operations Manager San Francisco CA            110
#> 24        Airbnb     Community Manager San Francisco CA            110
#> 25       Spotify          Data Analyst      New York NY            100
#> 26       Twitter        Policy Manager San Francisco CA            110
#> 27      LinkedIn             Recruiter      New York NY            100
#> 28       Dropbox       Product Manager San Francisco CA            110
#> 29         Slack         HR Generalist San Francisco CA            110
#> 30          Zoom      Customer Success      San Jose CA            105
#>         status date_applied salary      source days_waiting possibly_ghosted
#> 1  Interviewed   2024-01-10  95000    LinkedIn          868            FALSE
#> 2     Rejected   2024-01-15  85000    Referral          863            FALSE
#> 3      Applied   2024-01-20  78000      Indeed          858             TRUE
#> 4      Offered   2024-02-01 110000    LinkedIn          846            FALSE
#> 5     Rejected   2024-02-05  88000 Career Fair          842            FALSE
#> 6  Interviewed   2024-02-10  82000      Indeed          837            FALSE
#> 7      Applied   2024-02-15  98000    Referral          832             TRUE
#> 8     Rejected   2024-02-20  92000    LinkedIn          827            FALSE
#> 9      Offered   2024-03-01  75000 Career Fair          817            FALSE
#> 10     Applied   2024-03-05 105000      Indeed          813             TRUE
#> 11 Interviewed   2024-03-08  90000    LinkedIn          810            FALSE
#> 12    Rejected   2024-03-10 115000    Referral          808            FALSE
#> 13     Applied   2024-03-12  72000      Indeed          806             TRUE
#> 14    Rejected   2024-03-15  76000    LinkedIn          803            FALSE
#> 15 Interviewed   2024-03-18  88000      Indeed          800            FALSE
#> 16     Offered   2024-03-20  95000    Referral          798            FALSE
#> 17     Applied   2024-03-22  82000 Career Fair          796             TRUE
#> 18    Rejected   2024-03-25  89000    LinkedIn          793            FALSE
#> 19     Applied   2024-03-28  87000      Indeed          790             TRUE
#> 20 Interviewed   2024-04-01  93000    LinkedIn          786            FALSE
#> 21    Rejected   2024-04-03  80000 Career Fair          784            FALSE
#> 22     Applied   2024-04-05  84000      Indeed          782             TRUE
#> 23 Interviewed   2024-04-08 102000    LinkedIn          779            FALSE
#> 24    Rejected   2024-04-10 108000    Referral          777            FALSE
#> 25     Applied   2024-04-12  96000      Indeed          775             TRUE
#> 26    Rejected   2024-04-15  99000    LinkedIn          772            FALSE
#> 27     Applied   2024-04-17  91000 Career Fair          770             TRUE
#> 28 Interviewed   2024-04-20 112000    Referral          767            FALSE
#> 29    Rejected   2024-04-22  78000      Indeed          765            FALSE
#> 30     Applied   2024-04-25  85000    LinkedIn          762             TRUE
days_since_applied(jobs, flag_after = 14)
#>          company              position         location cost_of_living
#> 1         Google          Data Analyst      New York NY            100
#> 2         Amazon        HR Coordinator        Austin TX             82
#> 3       Deloitte      Business Analyst       Chicago IL             88
#> 4      Microsoft        Data Scientist       Seattle WA             91
#> 5          Apple      Jr. Statistician San Francisco CA            110
#> 6            IBM         Data Engineer        Austin TX             82
#> 7           Meta       Product Analyst      New York NY            100
#> 8          Tesla    Operations Analyst        Austin TX             82
#> 9           Nike            HR Analyst      Portland OR             85
#> 10    Salesforce            BI Analyst San Francisco CA            110
#> 11      JPMorgan     Financial Analyst      New York NY            100
#> 12 Goldman Sachs          Risk Analyst      New York NY            100
#> 13        Target  Supply Chain Analyst   Minneapolis MN             78
#> 14        Disney     Marketing Analyst       Orlando FL             89
#> 15        Oracle       Systems Analyst        Austin TX             82
#> 16     Accenture Management Consultant       Chicago IL             88
#> 17           PWC       Audit Associate       Chicago IL             88
#> 18      Lockheed      Systems Engineer    Fort Worth TX             80
#> 19        Boeing          Data Analyst       Chicago IL             88
#> 20        Pfizer      Research Analyst      New York NY            100
#> 21            EY         Tax Associate        Dallas TX             80
#> 22          KPMG      Advisory Analyst       Atlanta GA             83
#> 23          Uber    Operations Manager San Francisco CA            110
#> 24        Airbnb     Community Manager San Francisco CA            110
#> 25       Spotify          Data Analyst      New York NY            100
#> 26       Twitter        Policy Manager San Francisco CA            110
#> 27      LinkedIn             Recruiter      New York NY            100
#> 28       Dropbox       Product Manager San Francisco CA            110
#> 29         Slack         HR Generalist San Francisco CA            110
#> 30          Zoom      Customer Success      San Jose CA            105
#>         status date_applied salary      source days_waiting possibly_ghosted
#> 1  Interviewed   2024-01-10  95000    LinkedIn          868            FALSE
#> 2     Rejected   2024-01-15  85000    Referral          863            FALSE
#> 3      Applied   2024-01-20  78000      Indeed          858             TRUE
#> 4      Offered   2024-02-01 110000    LinkedIn          846            FALSE
#> 5     Rejected   2024-02-05  88000 Career Fair          842            FALSE
#> 6  Interviewed   2024-02-10  82000      Indeed          837            FALSE
#> 7      Applied   2024-02-15  98000    Referral          832             TRUE
#> 8     Rejected   2024-02-20  92000    LinkedIn          827            FALSE
#> 9      Offered   2024-03-01  75000 Career Fair          817            FALSE
#> 10     Applied   2024-03-05 105000      Indeed          813             TRUE
#> 11 Interviewed   2024-03-08  90000    LinkedIn          810            FALSE
#> 12    Rejected   2024-03-10 115000    Referral          808            FALSE
#> 13     Applied   2024-03-12  72000      Indeed          806             TRUE
#> 14    Rejected   2024-03-15  76000    LinkedIn          803            FALSE
#> 15 Interviewed   2024-03-18  88000      Indeed          800            FALSE
#> 16     Offered   2024-03-20  95000    Referral          798            FALSE
#> 17     Applied   2024-03-22  82000 Career Fair          796             TRUE
#> 18    Rejected   2024-03-25  89000    LinkedIn          793            FALSE
#> 19     Applied   2024-03-28  87000      Indeed          790             TRUE
#> 20 Interviewed   2024-04-01  93000    LinkedIn          786            FALSE
#> 21    Rejected   2024-04-03  80000 Career Fair          784            FALSE
#> 22     Applied   2024-04-05  84000      Indeed          782             TRUE
#> 23 Interviewed   2024-04-08 102000    LinkedIn          779            FALSE
#> 24    Rejected   2024-04-10 108000    Referral          777            FALSE
#> 25     Applied   2024-04-12  96000      Indeed          775             TRUE
#> 26    Rejected   2024-04-15  99000    LinkedIn          772            FALSE
#> 27     Applied   2024-04-17  91000 Career Fair          770             TRUE
#> 28 Interviewed   2024-04-20 112000    Referral          767            FALSE
#> 29    Rejected   2024-04-22  78000      Indeed          765            FALSE
#> 30     Applied   2024-04-25  85000    LinkedIn          762             TRUE
```
