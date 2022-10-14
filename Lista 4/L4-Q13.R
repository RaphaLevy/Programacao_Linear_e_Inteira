# Import lpSolve package
library(lpSolve)

#Node 0 (Resolvendo com variáveis binárias)

# Set coefficients of the objective function
f.obj <- c(6, 4, 4, 1, 1)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(2, 2, 3, 1, 2,
                  1, 0, 0, 0, 0,
                  0, 1, 0, 0, 0,
                  0, 0, 1, 0, 0,
                  0, 0, 0, 1, 0,
                  0, 0, 0, 0, 1), nrow = 6, byrow = TRUE)

# Set unequality signs
f.dir <- c("=",
           ">=",
           ">=",
           ">=",
           ">=",
           ">=")


# Set right hand side coefficients
f.rhs <- c(7,
           0,
           0,
           0,
           0,
           0)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs, all.bin = TRUE)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs, all.bin = TRUE)$solution

###################################################

#Node 0* (Resolvendo sem variáveis binárias)

# Set coefficients of the objective function
f.obj <- c(6, 4, 4, 1, 1)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(2, 2, 3, 1, 2), nrow = 1, byrow = TRUE)

# Set unequality signs
f.dir <- c("=")


# Set right hand side coefficients
f.rhs <- c(7)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:2)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:2)$solution

###################################################

#Node 1 (0 <= x3 <=1)

# Set coefficients of the objective function
f.obj <- c(6, 4, 4, 1, 1)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(2, 2, 3, 1, 2,
                  0, 0, 1, 0, 0,
                  0, 0, 1, 0, 0), nrow = 3, byrow = TRUE)

# Set unequality signs
f.dir <- c("=",
           ">=",
           "<=")


# Set right hand side coefficients
f.rhs <- c(7,
           0,
           1)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:2)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:2)$solution

### 0 <= x3 <=1 vai entrar em loop

###################################################

#Node 2 (x3 >=1)

# Set coefficients of the objective function
f.obj <- c(6, 4, 4, 1, 1)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(2, 2, 3, 1, 2,
                  0, 0, 1, 0, 0), nrow = 2, byrow = TRUE)

# Set unequality signs
f.dir <- c("=",
           ">=")


# Set right hand side coefficients
f.rhs <- c(7,
           1)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:2)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:2)$solution
