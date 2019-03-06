# function that takes a data frame object and standardizes the column names
library(stringr)

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
