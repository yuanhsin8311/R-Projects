## dplyr package:
# It provides simple “verbs”, functions that correspond to the most common data manipulation tasks, to help translate those thoughts into code.
# It uses efficient data storage backends, so you spend less time waiting for the computer.

# databases: Besides in-memory data frames, dplyr also connects to out-of-memory, remote databases. 
             And by translating your R code into the appropriate SQL, it allows you to work with both 
             types of data using the same set of tools.
# window-functions: a window function is a variation on an aggregation function. 
                    Where an aggregate function uses n inputs to produce 1 output, 
                    a window function uses n inputs to produce n outputs.

# Data: nycflights13

To explore the basic data manipulation verbs of dplyr, we’ll start with the built in nycflights13 data frame. 
This dataset contains all 336776 flights that departed from New York City in 2013. 
The data comes from the US Bureau of Transportation Statistics, and is documented in ?nycflights13

library(nycflights13)
dim(flights)
#> [1] 336776     19
head(flights)
#> # A tibble: 6 x 19
#>    year month   day dep_time sched_dep_time dep_delay arr_time
#>   <int> <int> <int>    <int>          <int>     <dbl>    <int>
#> 1  2013     1     1      517            515         2      830
#> 2  2013     1     1      533            529         4      850
#> 3  2013     1     1      542            540         2      923
#> 4  2013     1     1      544            545        -1     1004
#> ... with 2 more rows, and 12 more variables: sched_arr_time <int>,
#>   arr_delay <dbl>, carrier <chr>, flight <int>, tailnum <chr>,
#>   origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>, hour <dbl>,
#>   minute <dbl>, time_hour <time>

dplyr can work with data frames as is, but if you’re dealing with large data, it’s worthwhile to convert them to a 
tbl_df: this is a wrapper around a data frame that won’t accidentally print a lot of data to the screen.

# Single table verbs

Dplyr aims to provide a function for each basic verb of data manipulation:

1. filter() (and slice())
2. arrange()
3. select() (and rename())
4. distinct()
5. mutate() (and transmute())
6. summarise()
7. sample_n() (and sample_frac())

If you’ve used plyr before, many of these will be familar.

# 1. Filter rows with filter()

filter() allows you to select a subset of rows in a data frame. 
The first argument is the name of the data frame. 
The second and subsequent arguments are the expressions that filter the data frame:

For example, we can select all flights on January 1st with:

filter(flights, month == 1, day == 1)
#> # A tibble: 842 x 19
#>    year month   day dep_time sched_dep_time dep_delay arr_time
#>   <int> <int> <int>    <int>          <int>     <dbl>    <int>
#> 1  2013     1     1      517            515         2      830
#> 2  2013     1     1      533            529         4      850
#> 3  2013     1     1      542            540         2      923
#> 4  2013     1     1      544            545        -1     1004
#> ... with 838 more rows, and 12 more variables: sched_arr_time <int>,
#>   arr_delay <dbl>, carrier <chr>, flight <int>, tailnum <chr>,
#>   origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>, hour <dbl>,
#>   minute <dbl>, time_hour <time>
This is equivalent to the more verbose code in base R:

flights[flights$month == 1 & flights$day == 1, ]
filter() works similarly to subset() except that you can give it any number of filtering conditions, which are joined together with & (not && which is easy to do accidentally!). You can also use other boolean operators:

filter(flights, month == 1 | month == 2)
To select rows by position, use slice():

slice(flights, 1:10)
#> # A tibble: 10 x 19
#>    year month   day dep_time sched_dep_time dep_delay arr_time
#>   <int> <int> <int>    <int>          <int>     <dbl>    <int>
#> 1  2013     1     1      517            515         2      830
#> 2  2013     1     1      533            529         4      850
#> 3  2013     1     1      542            540         2      923
#> 4  2013     1     1      544            545        -1     1004
#> ... with 6 more rows, and 12 more variables: sched_arr_time <int>,
#>   arr_delay <dbl>, carrier <chr>, flight <int>, tailnum <chr>,
#>   origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>, hour <dbl>,
#>   minute <dbl>, time_hour <time>










































