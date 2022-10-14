# Import lpSolve package
library(lpSolve)

# Set coefficients of the objective function
f.obj <- c(7, 11, 3, 2,
           1, 6, 0, 1,
           9, 15 , 8, 5)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1,
                 -1, 0, 0, 0, -1, 0, 0, 0, -1, 0, 0, 0,
                  0, -1, 0, 0, 0, -1, 0, 0, 0, -1, 0, 0,
                  0, 0, -1, 0, 0, 0, -1, 0, 0, 0, -1, 0,
                  0, 0, 0, -1, 0, 0, 0, -1, 0, 0, 0, -1), nrow = 7, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=",
           "<=",
           "<=",
           "<=",
           "<=",
           "<=",
           "<=")

# Set right hand side coefficients
f.rhs <- c(6,
           1,
           10,
           -2,
           -3,
           -5,
           -7)

# Final value (z)
lp("min", f.obj, f.con, f.dir, f.rhs)

# Variables final values
lp("min", f.obj, f.con, f.dir, f.rhs)$solution


