# Import lpSolve package
library(lpSolve)

# Set coefficients of the objective function
f.obj <- c("c1", "c2", "c3", "c4", "c5", "c6", "c7", "c8", "c9", "c10")

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(1, 0, 0, 0, 0, 0, 1, 1, 0, 0,
                  0, 0, 1, 0, 1, 0, 0, 0, 0, 0,
                  0, 0, 0, 1, 1, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 1, 1, 1, 1, 0, 0,
                  1, 1, 1, 1, 1, 1, 1, 1, 1, 1), nrow = 5, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=",
           "<=",
           "<=",
           "<=",
           "<=")

# Set right hand side coefficients
f.rhs <- c(2,
           1,
           1,
           2,
           5)

# Final value (z)
lp("min", f.obj, f.con, f.dir, f.rhs)

# Variables final values
lp("min", f.obj, f.con, f.dir, f.rhs)$solution
