Notes from PBPL 28820
================
Cristian E. Nuno
April 08, 2018

-   [Preface](#preface)
-   [Introduction](#introduction)
    -   [Wage Data](#wage-data)
    -   [Stock Market Data](#stock-market-data)
    -   [Gene Expression Data](#gene-expression-data)

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

Wage Data
---------

In particular, we wish to understand the association between an employee’s age and education, as well as the calendar year, on his wage.

The `Wage` data set involves predicting a **continuous** or **quantitative** output value, which is referred to as a **regression** problem.

``` r
# age v wage
plot(
  x = Wage$age
  , y = Wage$wage
  , pch = 19
  , col = "#CCCCCC"
  , main = "Age v. Wage"
  , xlab = "Age"
  , ylab = "Wage"
  , las = 1
  , bty = "n"
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

![](notes_files/figure-markdown_github/Wage%20Plots-1.png)

``` r
# year v wage
plot(
  x = Wage$year
  , y = Wage$wage
  , las = 1
  , pch = 19
  , col = "#CCCCCC"
  , main = "Year v. Wage"
  , xlab = "Year"
  , ylab = "Wage"
  , bty = "n"
)
lines(
  x = lowess(
    x = Wage$year
    , y = Wage$wage
  )
  , col = "darkgoldenrod2"
  , lwd = 2
)
```

![](notes_files/figure-markdown_github/Wage%20Plots-2.png)

``` r
# education level v wage
boxplot(
  formula = wage~education
  , data = Wage
  , las = 1
  , frame = FALSE
  , col = rainbow( n = length( levels( Wage$education ) ) )
  , main = "Distribution of Wages by Education Level"
  , xaxt = "n"
)
axis(
  side = 1
  , at = 1:length( levels( Wage$education ) )
  , labels = 1:length( levels( Wage$education ) )
)
legend(
  x = "topleft"
  , legend = levels( Wage$education )
  , col = rainbow( n = length( levels( Wage$education ) ) )
  , bty = "n"
  , pch = 15
  , cex = 0.85
  , title = "Education Levels"
)
```

![](notes_files/figure-markdown_github/Wage%20Plots-3.png)

Stock Market Data
-----------------

When we wish to predict a non-numerical value - a **categorical** or **qualitative** output, this is known as a **classification** problem. Let's examine the `Smarket` data set.

``` r
down.up.color.schema <-
  c("dodgerblue", "firebrick")

par( mfrow = c( nr = 1, nc = 3 ) )
# yesterday's change in S&P
boxplot(
  formula = Lag1~Direction
  , data = Smarket
  , frame = FALSE
  , col = down.up.color.schema
  , main = "Yesterday"
  , ylab = "% Change in S&P"
  , xlab = "Today's Direction"
)
boxplot(
  formula = Lag2~Direction
  , data = Smarket
  , frame = FALSE
  , col = down.up.color.schema
  , main = "Two Days Previous"
  , ylab = "% Change in S&P"
  , xlab = "Today's Direction"
)
boxplot(
  formula = Lag3~Direction
  , data = Smarket
  , frame = FALSE
  , col = down.up.color.schema
  , main = "Three Days Previous"
  , ylab = "% Change in S&P"
  , xlab = "Today's Direction"
)
```

![](notes_files/figure-markdown_github/Stock%20Barplots-1.png)

Gene Expression Data
--------------------

The previous two applications illustrate data sets with both input and output variables.

There are situations in which we *only observe input variables, with no corresponding output*.

-   Ex: market setting uses demographic data to understand which types of current customers are similar to one another by **grouping individuals according to their observed characteristics**. This is known as a *clustering* problem.

Let's examine the `NCI60` data set.

### Principal Component Analysis

The following visualization is an example of [principal component analysis](https://tgmstat.wordpress.com/2013/11/21/introduction-to-principal-component-analysis-pca/) and [how to conduct it](https://www.r-bloggers.com/computing-and-visualizing-pca-in-r/) using `R`.

``` r
# apply PCA - scale. = TRUE is highly 
# advisable, but default is FALSE. 
NCI60$pca.data <- 
  prcomp(
    x = NCI60$data
    , center = TRUE           # zero center results
    , scale. = TRUE           # Scale to have unit variance before analysis takes place
  )

# Visualize results
plot( 
  x = NCI60$pca.data$x[, "PC1"]
  , y = NCI60$pca.data$x[, "PC2"]
  , main = "6,830 expression measurements for each cell line\ndown to two numbers or dimensions using PCA"
  , cex.main = 0.85
  , col = "palegreen4"
  , pch = 19
  , xlab = expression( "Z"[1] )
  , ylab = expression( "Z"[2] )
  )
```

![](notes_files/figure-markdown_github/Gene%20Expression%20Scatter%20Plots-1.png)

``` r
# create color schema to visualize 
# the four groups of cell lines
```
