# Import lpSolve package
library(lpSolve)

#Node 0

# Set coefficients of the objective function
f.obj <- c(1, 5)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-4, 3,
                  3, 2), nrow = 2, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=",
           "<=")


# Set right hand side coefficients
f.rhs <- c(6,
           18)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs)$solution

###################################################

#Node 1 (x2 <= 5)

# Set coefficients of the objective function
f.obj <- c(1, 5)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-4, 3,
                   3, 2,
                   0, 1), nrow = 3, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=",
           "<=",
           "<=")
          

# Set right hand side coefficients
f.rhs <- c(6,
           18,
           5)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs)$solution

###################################################

#Node 2 (x2 >= 6)

# Set coefficients of the objective function
f.obj <- c(1, 5)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-4, 3,
                  3, 2,
                  0, 1), nrow = 3, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=",
           "<=",
           ">=")


# Set right hand side coefficients
f.rhs <- c(6,
           18,
           6)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs)$solution

### x2 >= 6 é inválido

###################################################

#Node 3 (x2 <= 5, x1 <= 2)

# Set coefficients of the objective function
f.obj <- c(1, 5)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-4, 3,
                  3, 2,
                  0, 1,
                  1, 0), nrow = 4, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=",
           "<=",
           "<=",
           "<=")


# Set right hand side coefficients
f.rhs <- c(6,
           18,
           5,
           2)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs)$solution

###################################################

#Node 4 (x2 <= 5, x1 >= 3)

# Set coefficients of the objective function
f.obj <- c(1, 5)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-4, 3,
                  3, 2,
                  0, 1,
                  1, 0), nrow = 4, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=",
           "<=",
           "<=",
           ">=")


# Set right hand side coefficients
f.rhs <- c(6,
           18,
           5,
           3)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs)$solution

###################################################

#Node 5 (x2< = 5, x1 <= 2, x2 <= 4)

# Set coefficients of the objective function
f.obj <- c(1, 5)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-4, 3,
                  3, 2,
                  0, 1,
                  1, 0,
                  0, 1), nrow = 5, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=",
           "<=",
           "<=",
           "<=",
           "<=")


# Set right hand side coefficients
f.rhs <- c(6,
           18,
           5,
           2,
           4)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs)$solution

###################################################

#Node 6 (x2 <= 5, x1 <= 2, x2 >= 5)

# Set coefficients of the objective function
f.obj <- c(1, 5)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-4, 3,
                  3, 2,
                  0, 1,
                  1, 0,
                  0, 1), nrow = 5, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=",
           "<=",
           "<=",
           "<=",
           ">=")


# Set right hand side coefficients
f.rhs <- c(6,
           18,
           5,
           2,
           5)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs)$solution

### x2 <= 5, x1 <= 2, x2 >= 5 é inválido

###################################################

#Node 7 (x2 <= 5, x1 >= 3, x2 <= 4)

# Set coefficients of the objective function
f.obj <- c(1, 5)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-4, 3,
                  3, 2,
                  0, 1,
                  1, 0,
                  0, 1), nrow = 5, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=",
           "<=",
           "<=",
           ">=",
           "<=")


# Set right hand side coefficients
f.rhs <- c(6,
           18,
           5,
           3,
           4)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs)$solution

###################################################

#Node 8 (x2 <= 5, x1 >= 3, x2 >= 5)

# Set coefficients of the objective function
f.obj <- c(1, 5)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-4, 3,
                  3, 2,
                  0, 1,
                  1, 0,
                  0, 1), nrow = 5, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=",
           "<=",
           "<=",
           ">=",
           ">=")


# Set right hand side coefficients
f.rhs <- c(6,
           18,
           5,
           3,
           5)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs)$solution

### x2 <= 5, x1 >= 3, x2 >= 5 é inválido

###################################################

#Node 9 (x2 <= 5, x1 >= 3, x2 <= 4, x1 <= 3)

# Set coefficients of the objective function
f.obj <- c(1, 5)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-4, 3,
                  3, 2,
                  0, 1,
                  1, 0,
                  0, 1,
                  1, 0), nrow = 6, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=",
           "<=",
           "<=",
           ">=",
           "<=",
           "<=")


# Set right hand side coefficients
f.rhs <- c(6,
           18,
           5,
           3,
           4,
           3)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs)$solution

### z max = 23

###################################################

#Node 10 (x2 <= 5, x1 >= 3, x2 <= 4, x1 >= 4)

# Set coefficients of the objective function
f.obj <- c(1, 5)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-4, 3,
                  3, 2,
                  0, 1,
                  1, 0,
                  0, 1,
                  1, 0), nrow = 6, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=",
           "<=",
           "<=",
           ">=",
           "<=",
           ">=")


# Set right hand side coefficients
f.rhs <- c(6,
           18,
           5,
           3,
           4,
           4)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs)$solution

###################################################

#Node 0* (para garantir a otimalidade)

# Set coefficients of the objective function
f.obj <- c(1, 5)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-4, 3,
                  3, 2), nrow = 2, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=",
           "<=")


# Set right hand side coefficients
f.rhs <- c(6,
           18)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:2)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:2)$solution

###################################################

