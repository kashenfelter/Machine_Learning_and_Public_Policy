Notes from PBPL 28820
================
Cristian E. Nuno
April 03, 2018

``` r
# load necessary packages
# install.packages( pkgs = "ISLR" )
library( ISLR )
```

Preface
=======

> “It’s tough to make predictions, especially about the future.” – Yogi Berra

Introduction
============

-   Statistical learning = understanding data
    -   Supervised: Building a statistical model for predicting, or estimating, an output based on one or more inputs
    -   Unsupervised: There are inputs but no supervising output

In particular, we wish to understand the association between an employee’s age and education, as well as the calendar year, on his wage.

``` r
plot(
  x = Wage$age
  , y = Wage$wage
  , pch = 19
  , col = "#CCCCCC"
  , main = "Wage v. Age"
)
lines( 
  x = lowess(
    x = Wage$age
    , y = Wage$wage
  )
  , col = "darkgoldenrod2"
  , lwd = 4
)
```

![](notes_files/figure-markdown_github/Correlation%20Plots-1.png)
