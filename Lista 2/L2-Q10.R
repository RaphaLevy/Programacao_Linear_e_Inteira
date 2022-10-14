# Import lpSolve package

library(lpSolve)

# Set transportation costs matrix
costs <- matrix(c(3, 5, 6, 2, 2,
                  2, 3, 5, 3, 2,
                  3, 0, 4, 2, 2,
                  3, 0, 3, 2, 2,
                  0, 3, 0, 1, 0), nrow = 5, byrow = TRUE)

# Set customers and suppliers' names
colnames(costs) <- c("Adjutant (A)", "Intelligence (B)", "Operations (C)", "Supply (D)", "Training (E)") ### Jobs
rownames(costs) <- c("Mj. Muddle (1)", "Mj. Whiteside (2)", "Cp. Kid (3)", "Cp. Klutch (4)", "Lt. Whiz (5)") ### Staff

# Set unequality/equality signs for suppliers
row.signs <- rep("<=", 5)

# Set right hand side coefficients for suppliers
row.rhs <- c(1,1,1,1,1)

# Set unequality/equality signs for customers
col.signs <- rep(">=", 5)

# Set right hand side coefficients for customers
col.rhs <- c(1,1,1,1,1)

# Final value (z)
lp.transport(costs, "max", row.signs, row.rhs, col.signs, col.rhs)

# Variables final values
lp.transport(costs, "max", row.signs, row.rhs, col.signs, col.rhs)$solution

###############################################################################

# Import lpSolve package

library(lpSolve)

# Set transportation costs matrix
costs <- matrix(c(3, 5, 6, 2, 2,
                  2, 3, 5, 3, 2,
                  3, 0, 4, 2, 2,
                  3, 0, 3, 2, 2,
                  0, 3, 0, 1, 0), nrow = 5, byrow = TRUE)

# Set customers and suppliers' names
colnames(costs) <- c("Adjutant (A)", "Intelligence (B)", "Operations (C)", "Supply (D)", "Training (E)") ### Jobs
rownames(costs) <- c("Mj. Muddle (1)", "Mj. Whiteside (2)", "Cp. Kid (3)", "Cp. Klutch (4)", "Lt. Whiz (5)") ### Staff

# Set unequality/equality signs for suppliers
row.signs <- rep("=", 5)

# Set right hand side coefficients for suppliers
row.rhs <- c(1, 1, 1, 1, 1)

# Set unequality/equality signs for customers
col.signs <- rep("=", 5)

# Set right hand side coefficients for customers
col.rhs <- c(1, 1, 1, 1, 1)

# Final value (z)
lp.transport(costs, "max", row.signs, row.rhs, col.signs, col.rhs)

# Variables final values
lp.transport(costs, "max", row.signs, row.rhs, col.signs, col.rhs)$solution
