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

## remove_na()

Replaces all NAs in a data frame with a specified value (or default value of 0)

```r {remove_na example}
  test_df <- data.frame(a = c(1,2,3,4,NA), b = c(NA, 3, 4, 5, 6))
  test_df
  
  test_df %>%
      remove_na()
```

## remove_nan()

Replaces all NaNs in a data frame with a specified value (or default value of 0)

```r {remove_na example}
  test_df <- data.frame(a = c(1,2,3,4,NaN), b = c(NaN, 3, 4, 5, 6))
  test_df
  
  test_df %>%
      remove_nan()
```
