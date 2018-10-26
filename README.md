# usefulRfunctions
Library of useful R functions that I source/use constantly

## To load as a library in an R script use:
source(url("https://raw.githubusercontent.com/nick-holt/usefulRfunctions/master/useful%20functions.R"))

## name_clean()
Pipeable function that standardizes variable names for a data frame

  mtcars %>% name_clean()
