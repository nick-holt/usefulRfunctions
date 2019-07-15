# usefulRfunctions
Library of useful R functions I've written to speed up routine tasks. I source/use these constantly.

## To load as a library in an R script use:

```r {source script}
source(url("https://raw.githubusercontent.com/nick-holt/usefulRfunctions/master/useful%20functions.R"))
```
Maybe one day I'll package this, but for now I source from github.

## name_clean()
Pipeable function that standardizes variable names for a data frame

``` r {name_clean() example}
  mtcars %>% 
    name_clean()
```    

## %!in%

The opposite of %in%, meaning it will keep all of the elements of one vector that are not in another vector.

```r {%!in% example}
  mtcars %>%
    filter(cyl %!in% c(4, 6))
```    
    
## prev_quarter_start_date()

Calculates the start date of the previous quarter based on a given date input. Default date is current date.

```r {prev_q_start example}
  prev_quarter_start_date("2019-01-01")
```    

## prev_quarter_end_date()

Calculates the end date of the previous quarter based on a given date input. Default date is current date.

```r {prev_q_end example}
  prev_quarter_end_date("2019-01-01")
```    
