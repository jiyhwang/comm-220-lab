# *in RStudio, first go under Session -> Set Working -> To Source File
# you'll need a few libraries...

install.packages(pkgs=c('urltools','pwr','lsr')) # run this once... 

library(urltools) # to clean our headlines
library(tidyverse)
# load in CSV file, quick check, cleaning...

# reading in a comma-separate value (CSV) file; variable names in header (TRUE)
headlines = read.csv('lab_1_data-1.csv',header=TRUE)
headlines

# dollar/money amount mentions...
headlines$money_ref = 1:nrow(headlines) %in% grep('\\$',headlines$title)
headlines$money_ref

#lab 2 results, running t-test to compare average number of headline characters
headlines$num_chars <- nchar(headlines$title)
nyt <- headlines$num_chars[headlines$source=="New York Times"]
nyt
biz <- headlines$num_chars[headlines$source=="Business Insider"]
biz
t.test(nyt,biz)