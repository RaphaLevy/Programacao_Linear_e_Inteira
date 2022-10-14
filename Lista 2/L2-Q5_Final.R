# Import lpSolve package
library(lpSolve)

# Set coefficients of the objective function
f.obj <- c(-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                  -1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
                  0, -1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
                  0, 0, -1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
                  0, 0, 0, -1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, -1, 0, 0, 1, 0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0, -1, 0, 0, 1, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 1, 0, 0, 0,
                  0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 0, 0, 0,
                  0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 1, 0, 0,
                  0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0,
                  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 0,
                  0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1,
                  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 1,
                  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1), nrow = 17, byrow = TRUE)

# Set unequality signs
f.dir <- c(">=",
           ">=",
           ">=",
           ">=",
           ">=",
           ">=",
           ">=",
           ">=",
           ">=",
           ">=",
           ">=",
           ">=",
           ">=",
           ">=",
           ">=",
           ">=",
           ">=")

# Set right hand side coefficients
f.rhs <- c(1,
           1,
           2,
           3,
           4,
           2,
           2,
           1,
           2,
           6,
           5,
           6,
           5,
           3,
           10,
           3,
           2)

# Final value (z)
lp("min", f.obj, f.con, f.dir, f.rhs)

# Variables final values
lp("min", f.obj, f.con, f.dir, f.rhs)$solution
