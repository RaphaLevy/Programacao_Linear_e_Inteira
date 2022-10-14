# Import lpSolve package

#install.packages("lpSolve")
library(lpSolve)

# Set transportation costs matrix
costs <- matrix(c(5.50, 7.00, 8.50, 4.50, 3.00,
                  6.00, 6.50, 9.00, 3.50, 2.00,
                  5.00, 7.00, 9.50, 4.00, 2.50,
                  6.50, 5.50, 8.00, 5.00, 3.50), nrow = 4, byrow = TRUE)

# Set customers and suppliers' names
colnames(costs) <- c("R1", "R2", "R3", "R4", "R5")
rownames(costs) <- c("M1", "M2", "M3", "M4")

# Set unequality/equality signs for suppliers
row.signs <- rep("<=", 4)

# Set right hand side coefficients for suppliers
row.rhs <- c(600, 500, 300, 400) ### Oferta soma 1800

# Set unequality/equality signs for customers
col.signs <- rep(">=", 5)

# Set right hand side coefficients for customers
col.rhs <- c(300, 200, 150, 500, 400) ### Demanda soma 1550

# Final value (z)
lp.transport(costs, "max", row.signs, row.rhs, col.signs, col.rhs)

# Variables final values
lp.transport(costs, "max", row.signs, row.rhs, col.signs, col.rhs)$solution

###############################################################################

### A demanda e oferta não estão equilibradas! Precisamos criar um "nó fake" de demanda:

# Set transportation costs matrix
costs <- matrix(c(5.50, 7.00, 8.50, 4.50, 3.00, 0.00,
                  6.00, 6.50, 9.00, 3.50, 2.00, 0.00,
                  5.00, 7.00, 9.50, 4.00, 2.50, 0.00,
                  6.50, 5.50, 8.00, 5.00, 3.50, 0.00), nrow = 4, byrow = TRUE)

# Set customers and suppliers' names
colnames(costs) <- c("R1", "R2", "R3", "R4", "R5", "R6Aux")
rownames(costs) <- c("M1", "M2", "M3", "M4")

# Set unequality/equality signs for suppliers
row.signs <- rep("<=", 4)

# Set right hand side coefficients for suppliers
row.rhs <- c(600, 500, 300, 400) ### Oferta soma 1800

# Set unequality/equality signs for customers
col.signs <- rep(">=", 6)

# Set right hand side coefficients for customers
col.rhs <- c(300, 200, 150, 500, 400, 250) ### Demanda soma 1800

# Final value (z)
lp.transport(costs, "max", row.signs, row.rhs, col.signs, col.rhs)

# Variables final values
lp.transport(costs, "max", row.signs, row.rhs, col.signs, col.rhs)$solution

###############################################################################


