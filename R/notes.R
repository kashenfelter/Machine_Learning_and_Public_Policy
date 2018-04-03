#
# Author:   Cristian E. Nuno
# Purpose:  Notes from PBPL 28820
# Date:     April 2, 2018
#

# load necessary packages
# install.packages( pkgs = "ISLR" )
library( ISLR )

# In particular, we wish to understand the association between 
# an employee’s age and education, 
# as well as the calendar year, on his wage
plot(
  x = Wage$age
  , y = Wage$wage
  , pch = 19
  , col = "#CCCCCC"
  , main = "Wage v. Age"
)
lines( x = lowess(
  x = Wage$age
  , y = Wage$wage
)
, col = "darkgoldenrod2"
, lwd = 4
)

# end of script #
