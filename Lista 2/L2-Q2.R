# Import lpSolve package

install.packages("lpSolve")
library(lpSolve)

# Set transportation costs matrix
costs <- matrix(c(7, 11, 3, 2,
                  1, 6, 0, 1,
                  9, 15 , 8, 5), nrow = 3, byrow = TRUE)

# Set customers and suppliers' names
colnames(costs) <- c("Customer A", "Customer B", "Customer C", "Customer D")
rownames(costs) <- c("Supplier 1", "Supplier 2", "Supplier 3")

# Set unequality/equality signs for suppliers
row.signs <- rep("<=", 3)

# Set right hand side coefficients for suppliers
row.rhs <- c(6, 1, 10)

# Set unequality/equality signs for customers
col.signs <- rep(">=", 4)

# Set right hand side coefficients for customers
col.rhs <- c(2, 3, 5, 7)

# Final value (z)
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)

# Variables final values
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)$solution

###############################################################################

# Set unequality/equality signs for suppliers
row.signs <- rep("=", 3)

# Set right hand side coefficients for suppliers
row.rhs <- c(6, 1, 10)

# Set unequality/equality signs for customers
col.signs <- rep("=", 4)

# Set right hand side coefficients for customers
col.rhs <- c(2, 3, 5, 7)

# Final value (z)
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)

# Variables final values
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)$solution

