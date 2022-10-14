# Import lpSolve package

library(lpSolve)

# Set transportation costs matrix
costs <- matrix(c(150, 200, 70,
                  70, 120, 80,
                  80, 50, 170), nrow = 3, byrow = TRUE)

# Set customers and suppliers' names
colnames(costs) <- c("Tucson (A)", "Sacramento (B)", "Charlestown (C)") ### Customers
rownames(costs) <- c("Chicago (1)", "Austin (2)", "Salem (3)") ### Suppliers

# Set unequality/equality signs for suppliers
row.signs <- rep("<=", 3)

# Set right hand side coefficients for suppliers
row.rhs <- c(10, 8, 10)

# Set unequality/equality signs for customers
col.signs <- rep(">=", 3)

# Set right hand side coefficients for customers
col.rhs <- c(10, 8, 10)

# Final value (z)
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)

# Variables final values
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)$solution

###############################################################################

# Import lpSolve package

library(lpSolve)

# Set transportation costs matrix
costs <- matrix(c(150, 200, 70,
                  70, 120, 80,
                  80, 50, 170), nrow = 3, byrow = TRUE)

# Set customers and suppliers' names
colnames(costs) <- c("Tucson (A)", "Sacramento (B)", "Charlestown (C)") ### Customers
rownames(costs) <- c("Chicago (1)", "Austin (2)", "Salem (3)") ### Suppliers

# Set unequality/equality signs for suppliers
row.signs <- rep("=", 3)

# Set right hand side coefficients for suppliers
row.rhs <- c(10, 8, 10)

# Set unequality/equality signs for customers
col.signs <- rep("=", 3)

# Set right hand side coefficients for customers
col.rhs <- c(10, 8, 10)

# Final value (z)
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)

# Variables final values
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)$solution

###############################################################################
