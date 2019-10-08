# function that takes a data frame object and standardizes the column names
library(stringr)
library(lubridate)

name_clean <- function(df) {
        colnames(df) <- str_remove_all(tolower(colnames(df)), "[[:punct:]]")
        colnames(df) <- str_replace_all(tolower(colnames(df)), " ", "_")
        colnames(df) <- str_replace_all(colnames(df), "__", "_")
        return(df)
}

# function that is opposite of %in%
'%!in%' <- function(x,y)!('%in%'(x,y))

# function that produces a heatmap tile plot for two factors (likert survey data)
crossTilePlot <- function(x, y) {
        data <- data.frame(x, y) %>%
                filter(!is.na(y)) %>%
                filter(!is.na(x))
        combos <- data %>% expand(x, y)
        missing <- anti_join(combos, data) %>%
                mutate(n = 0)
        data %>%
                group_by(x, y) %>%
                summarize(n = n()) %>%
                bind_rows(missing) %>%
                ggplot(aes(x, y, fill = n)) +
                        geom_tile() +
                        geom_text(aes(label = n)) +
                        scale_fill_gradient(low = "white", high = "lightblue") +
                        xlab(paste0("\n", name_x)) +
                        ylab(paste0(name_y, "\n")) +
                theme(axis.title = element_text(face="bold", size=11)) 
        
}

# return start date for previous quarter based on date input
prev_quarter_start_date <- function(date = today()){
        
        # if we are in q2 return start of q1
        if(quarter(date) - 1 == 1){
                start <- ymd(str_c(year(date), "-01-01"))
                # if q3, return q2 start
        } else if(quarter(date) - 1 == 2) {
                start <- ymd(str_c(year(date), "-04-01"))
                # if q4, return q3 start
        } else if(quarter(date) - 1 == 3) {
                start <- ymd(str_c(year(date), "-07-01"))
                # if q1, return q4 start
        } else if(quarter(date) - 1 == 0) {
                start <- ymd(str_c(year(date)-1, "-10-01"))
        } else {
                start <- "DATE UNKNOWN ERROR"
        }
        
        return(start)
        
}

# return end date for previous quarter based on date input
prev_quarter_end_date <- function(date = today()){
        
        # if we are in q2 return end of q1
        if(quarter(date) - 1 == 1){
                end <- ymd(str_c(year(date), "-03-31"))
        # if q3, return q2 end
        } else if(quarter(date) - 1 == 2) {
                end <- ymd(str_c(year(date), "-06-30"))
        # if q4, return q3 end
        } else if(quarter(date) - 1 == 3) {
                end <- ymd(str_c(year(date), "-09-30"))
        # if q1, return q4 end
        } else if(quarter(date) - 1 == 0) {
                end <- ymd(str_c(year(date)-1, "-12-31"))
        } else {
                end <- "DATE UNKNOWN ERROR"
        }
        
        return(end)
        
}

is_nan <- function(x){
        do.call(cbind, lapply(x, is.nan))
}

# remove NaN's from a df and replace with specified value
remove_nan <- function(df, replacement_value = 0){
        
                df[is_nan(df)] <- replacement_value
        return(df)
        
}

# remove NA's from df and replace with specified value
remove_na <- function(df, replacement_value = 0){
        
                df[is.na(df)] <- replacement_value
        return(df)
        
}

# function for performing is.infinite over a df        
is_infinite <- function(x){
        do.call(cbind, lapply(x, is.infinite))
}

# remove Inf's from a df and replace with specified value        
remove_inf <- function(df, replacement_value = 0){
        
        df[is_infinite(df)] <- replacement_value
        return(df)
        
}
