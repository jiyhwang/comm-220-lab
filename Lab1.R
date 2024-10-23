# *in RStudio, first go under Session -> Set Working -> To Source File
# you'll need a few libraries...

install.packages(pkgs=c('urltools','pwr','lsr')) # run this once... 

library(urltools) # to clean our headlines
library(tidyverse)
# load in CSV file, quick check, cleaning...

# reading in a comma-separate value (CSV) file; variable names in header (TRUE)
headlines = read.csv('lab_1_data-1.csv',header=TRUE)

# let's look at the first row... 
headlines[1,]

# we need to decode the title into a more readable format... so:
headlines$title = url_decode(headlines$title)

headlines[1:5]$source

## Lab 1 cont'd

# how many of each source?
table(headlines$source)

# creating new col for num of characters
headlines$nchar = nchar(headlines$title[1])

nchar(headlines$title[500])

headlines$nchar = nchar(headlines$title)

hist(headlines$nchar)

# checking how sources are named
table(headlines$source)

# subsetting histogram for business insider
hist(headlines$nchar[headlines$source=='Business Insider'])

# subsetting histogram for NYT
hist(headlines$nchar[headlines$source=='New York Times'])

# row that has max num of characters - business and nyt combined
which.max(headlines$nchar)

# creating new sheet for nyt
nyt = headlines[headlines$source=='New York Times',]

# new sheet for BI
biz = headlines[headlines$source=='Business Insider',]

# longest headline for nyt
nyt[which.max(nyt$nchar),]

#calculating average nchars for both sources
aggregate(nchar~source,data=headlines,mean)

