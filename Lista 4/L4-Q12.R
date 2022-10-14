# Import lpSolve package
library(lpSolve)

#Node 0

# Set coefficients of the objective function
f.obj <- c(-5, -1, -2, 0, 0)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-2, 1, -1, 1, 0,
                  2, 1, 1, 0, 1), nrow = 2, byrow = TRUE)

# Set unequality signs
f.dir <- c("=",
           "=")


# Set right hand side coefficients
f.rhs <- c(7/2,
           2)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs)$solution

### z max = 0+5

###################################################

### OBS: Tentamos incluir o +5 no Final value (z) e Variables final values, o que não estava 
### dando os resultados corretos. O código desenvolvido originalmente pode ser visto abaixo:

###################################################

#Node 0*

# Set coefficients of the objective function
f.obj <- c(-5, -1, -2, 0, 0)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-2, 1, -1, 1, 0,
                  2, 1, 1, 0, 1), nrow = 2, byrow = TRUE)

# Set unequality signs
f.dir <- c("=",
           "=")


# Set right hand side coefficients
f.rhs <- c(7/2,
           2)

# Final value (z)
lp("max", f.obj+5, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj+5, f.con, f.dir, f.rhs)$solution

#Node 1* (x4 <= 5)

# Set coefficients of the objective function
f.obj <- c(-5, -1, -2, 0, 0)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-2, 1, -1, 1, 0,
                  2, 1, 1, 0, 1,
                  0, 0, 0, 1, 0), nrow = 3, byrow = TRUE)

# Set unequality signs
f.dir <- c("=",
           "=",
           "<=")


# Set right hand side coefficients
f.rhs <- c(7/2,
           2,
           5)

# Final value (z)
lp("max", f.obj+5, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj+5, f.con, f.dir, f.rhs)$solution

###################################################

#Node 2* (x4 >= 6)

# Set coefficients of the objective function
f.obj <- c(-5, -1, -2, 0, 0)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-2, 1, -1, 1, 0,
                  2, 1, 1, 0, 1,
                  0, 0, 0, 1, 0), nrow = 3, byrow = TRUE)

# Set unequality signs
f.dir <- c("=",
           "=",
           ">=")


# Set right hand side coefficients
f.rhs <- c(7/2,
           2,
           6)

# Final value (z)
lp("max", f.obj+5, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj+5, f.con, f.dir, f.rhs)$solution

### x4 >= 6 é inválido

###################################################

#Node 3* (x4 <= 5, x3 <= 1)

# Set coefficients of the objective function
f.obj <- c(-5, -1, -2, 0, 0)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-2, 1, -1, 1, 0,
                  2, 1, 1, 0, 1,
                  0, 0, 0, 1, 0,
                  0, 0, 1, 0, 0), nrow = 4, byrow = TRUE)

# Set unequality signs
f.dir <- c("=",
           "=",
           "<=",
           "<=")


# Set right hand side coefficients
f.rhs <- c(7/2,
           2,
           5,
           1)

# Final value (z)
lp("max", f.obj+5, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj+5, f.con, f.dir, f.rhs)$solution

###################################################

#Node 4* (x4 <= 5, x3 >= 2)

# Set coefficients of the objective function
f.obj <- c(-5, -1, -2, 0, 0)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-2, 1, -1, 1, 0,
                  2, 1, 1, 0, 1,
                  0, 0, 0, 1, 0,
                  0, 0, 1, 0, 0), nrow = 4, byrow = TRUE)

# Set unequality signs
f.dir <- c("=",
           "=",
           "<=",
           ">=")


# Set right hand side coefficients
f.rhs <- c(7/2,
           2,
           5,
           2)

# Final value (z)
lp("max", f.obj+5, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj+5, f.con, f.dir, f.rhs)$solution

### x4 <= 5, x3 >= 2 é inválido

###################################################

#Node 5* (x4 <= 5, x3 <=1, 0<= x5 <=1)

# Set coefficients of the objective function
f.obj <- c(-5, -1, -2, 0, 0)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-2, 1, -1, 1, 0,
                  2, 1, 1, 0, 1,
                  0, 0, 0, 1, 0,
                  0, 0, 1, 0, 0,
                  0, 0, 0, 0, 1,
                  0, 0, 0, 0, 1), nrow = 6, byrow = TRUE)

# Set unequality signs
f.dir <- c("=",
           "=",
           "<=",
           "<=",
           ">=",
           "<=")


# Set right hand side coefficients
f.rhs <- c(7/2,
           2,
           5,
           1,
           0,
           1)

# Final value (z)
lp("max", f.obj+5, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj+5, f.con, f.dir, f.rhs)$solution

### x4 <= 5, x3 <=1, 0<= x5 <=1 vai entrar em loop

###################################################

#Node 6* (x4 <= 5, x3 <=1, x5 >=1)

# Set coefficients of the objective function
f.obj <- c(-5, -1, -2, 0, 0)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-2, 1, -1, 1, 0,
                  2, 1, 1, 0, 1,
                  0, 0, 0, 1, 0,
                  0, 0, 1, 0, 0,
                  0, 0, 0, 0, 1), nrow = 5, byrow = TRUE)

# Set unequality signs
f.dir <- c("=",
           "=",
           "<=",
           "<=",
           ">=")


# Set right hand side coefficients
f.rhs <- c(7/2,
           2,
           5,
           1,
           1)

# Final value (z)
lp("max", f.obj+5, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj+5, f.con, f.dir, f.rhs)$solution

###################################################

#Node 7* (x4 <= 5, x3 <=1, x5 >=1, x4 <= 4)

# Set coefficients of the objective function
f.obj <- c(-5, -1, -2, 0, 0)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-2, 1, -1, 1, 0,
                  2, 1, 1, 0, 1,
                  0, 0, 0, 1, 0,
                  0, 0, 1, 0, 0,
                  0, 0, 0, 0, 1,
                  0, 0, 0, 1, 0), nrow = 6, byrow = TRUE)

# Set unequality signs
f.dir <- c("=",
           "=",
           "<=",
           "<=",
           ">=",
           "<=")


# Set right hand side coefficients
f.rhs <- c(7/2,
           2,
           5,
           1,
           1,
           4)

# Final value (z)
lp("max", f.obj+5, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj+5, f.con, f.dir, f.rhs)$solution

###################################################

#Node 8* (x4 <= 5, x3 <=1, x5 >=1, x4 >= 5)

# Set coefficients of the objective function
f.obj <- c(-5, -1, -2, 0, 0)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-2, 1, -1, 1, 0,
                  2, 1, 1, 0, 1,
                  0, 0, 0, 1, 0,
                  0, 0, 1, 0, 0,
                  0, 0, 0, 0, 1,
                  0, 0, 0, 1, 0), nrow = 6, byrow = TRUE)

# Set unequality signs
f.dir <- c("=",
           "=",
           "<=",
           "<=",
           ">=",
           ">=")


# Set right hand side coefficients
f.rhs <- c(7/2,
           2,
           5,
           1,
           1,
           5)

# Final value (z)
lp("max", f.obj+5, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj+5, f.con, f.dir, f.rhs)$solution

### x4 <= 5, x3 <=1, x5 >=1, x4 >= 5 é inválido

###################################################

#Node 9* (x4 <= 5, x3 <=1, x5 >=1, x4 <= 4, x5 <= 1)

# Set coefficients of the objective function
f.obj <- c(-5, -1, -2, 0, 0)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-2, 1, -1, 1, 0,
                  2, 1, 1, 0, 1,
                  0, 0, 0, 1, 0,
                  0, 0, 1, 0, 0,
                  0, 0, 0, 0, 1,
                  0, 0, 0, 1, 0,
                  0, 0, 0, 0, 1), nrow = 7, byrow = TRUE)

# Set unequality signs
f.dir <- c("=",
           "=",
           "<=",
           "<=",
           ">=",
           "<=",
           "<=")


# Set right hand side coefficients
f.rhs <- c(7/2,
           2,
           5,
           1,
           1,
           4,
           1)

# Final value (z)
lp("max", f.obj+5, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj+5, f.con, f.dir, f.rhs)$solution

###################################################

#Node 10* (x4 <= 5, x3 <=1, x5 >=1, x4 <= 4, x5 >= 2)

# Set coefficients of the objective function
f.obj <- c(-5, -1, -2, 0, 0)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(-2, 1, -1, 1, 0,
                  2, 1, 1, 0, 1,
                  0, 0, 0, 1, 0,
                  0, 0, 1, 0, 0,
                  0, 0, 0, 0, 1,
                  0, 0, 0, 1, 0,
                  0, 0, 0, 0, 1), nrow = 7, byrow = TRUE)

# Set unequality signs
f.dir <- c("=",
           "=",
           "<=",
           "<=",
           ">=",
           "<=",
           ">=")


# Set right hand side coefficients
f.rhs <- c(7/2,
           2,
           5,
           1,
           1,
           4,
           2)

# Final value (z)
lp("max", f.obj+5, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj+5, f.con, f.dir, f.rhs)$solution

