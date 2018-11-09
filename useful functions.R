# function that takes a data frame object and standardizes the column names
library(stringr)

name_clean <- function(df) {
        colnames(df) <- str_remove_all(tolower(colnames(df)), "[[:punct:]]")
        colnames(df) <- str_replace_all(tolower(colnames(df)), " ", "_")
        return(df)
}

'%!in%' <- function(x,y)!('%in%'(x,y))
