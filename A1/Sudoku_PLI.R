install.packages("ompr")
install.packages("ompr.roi")
install.packages("ROI.plugin.glpk")

library(ompr)
library(dplyr)
n <- 9
model <- MIPModel() %>%
  
  # O número k armazenado na posição i,j
  add_variable(x[i, j, k], i = 1:n, j = 1:n, k = 1:9, type = "binary") %>%
  
  # Um jogo de sudoku não precisa de um valor específico para a função objetivo,
  # portanto podemos setar a F.O. como 0
  set_objective(0) %>%
  
  # Apenas um número pode ser atribuído por célula
  add_constraint(sum_expr(x[i, j, k], k = 1:9) == 1, i = 1:n, j = 1:n) %>%
  
  # Cada número é encontrado exatamente uma única vez em cada linha
  add_constraint(sum_expr(x[i, j, k], j = 1:n) == 1, i = 1:n, k = 1:9) %>%
  
  # Cada número é encontrado exatamente uma única vez em cada coluna
  add_constraint(sum_expr(x[i, j, k], i = 1:n) == 1, j = 1:n, k = 1:9) %>% 
  
  # Cada quadrado 3x3 deve ter todos os números de 1 a 9
  add_constraint(sum_expr(x[i, j, k], i = 1:3 + sx, j = 1:3 + sy) == 1, 
                 sx = seq(0, n - 3, 3), sy = seq(0, n - 3, 3), k = 1:9)
model

library(ompr.roi)
library(ROI.plugin.glpk)
result <- solve_model(model, with_ROI(solver = "glpk", verbose = TRUE))

# O dplyr a seguir plota uma matriz 9x9 arbitrária
result %>% 
  get_solution(x[i,j,k]) %>%
  filter(value > 0) %>%  
  select(i, j, k) %>% 
  tidyr::spread(j, k) %>% 
  select(-i)

# Adiciona as restrições para valores já incluídos
model_fixed <- model %>% ### [linha, coluna, valor]
  add_constraint(x[1, 5, 7] == 1) %>% 
  add_constraint(x[1, 6, 1] == 1) %>% 
  add_constraint(x[1, 8, 2] == 1) %>% 
  add_constraint(x[2, 7, 8] == 1) %>% 
  add_constraint(x[3, 2, 9] == 1) %>% 
  add_constraint(x[3, 3, 8] == 1) %>% 
  add_constraint(x[3, 4, 2] == 1) %>% 
  add_constraint(x[4, 1, 7] == 1) %>% 
  add_constraint(x[4, 2, 8] == 1) %>% 
  add_constraint(x[4, 4, 9] == 1) %>% 
  add_constraint(x[4, 7, 3] == 1) %>% 
  add_constraint(x[5, 6, 7] == 1) %>% 
  add_constraint(x[6, 2, 5] == 1) %>% 
  add_constraint(x[6, 6, 3] == 1) %>% 
  add_constraint(x[7, 3, 4] == 1) %>% 
  add_constraint(x[7, 4, 1] == 1) %>% 
  add_constraint(x[7, 7, 6] == 1) %>% 
  add_constraint(x[7, 8, 8] == 1) %>% 
  add_constraint(x[7, 9, 5] == 1) %>% 
  add_constraint(x[8, 9, 9] == 1) %>% 
  add_constraint(x[9, 1, 2] == 1) %>% 
  add_constraint(x[9, 5, 9] == 1) %>% 
  add_constraint(x[9, 9, 4] == 1)
result <- solve_model(model_fixed, with_ROI(solver = "glpk", verbose = TRUE))

result %>% 
  get_solution(x[i,j,k]) %>%
  filter(value > 0) %>%  
  select(i, j, k) %>% 
  tidyr::spread(j, k) %>% 
  select(-i) 



##############################################################################################



m <- 16
model <- MIPModel() %>%
  
  # O número k armazenado na posição i,j
  add_variable(x[i, j, k], i = 1:m, j = 1:m, k = 1:16, type = "binary") %>%
  
  # Um jogo de sudoku não precisa de um valor específico para a função objetivo,
  # portanto podemos setar a F.O. como 0
  set_objective(0) %>%
  
  # Apenas um número pode ser atribuído por célula
  add_constraint(sum_expr(x[i, j, k], k = 1:16) == 1, i = 1:m, j = 1:m) %>%
  
  # Cada número é encontrado exatamente uma única vez em cada linha
  add_constraint(sum_expr(x[i, j, k], j = 1:m) == 1, i = 1:m, k = 1:16) %>%
  
  # Cada número é encontrado exatamente uma única vez em cada coluna
  add_constraint(sum_expr(x[i, j, k], i = 1:m) == 1, j = 1:m, k = 1:16) %>% 
  
  # Cada quadrado 4x4 deve ter todos os números de 1 a 16
  add_constraint(sum_expr(x[i, j, k], i = 1:4 + sx, j = 1:4 + sy) == 1, 
                 sx = seq(0, m - 4, 4), sy = seq(0, m - 4, 4), k = 1:16)
model


result <- solve_model(model, with_ROI(solver = "glpk", verbose = TRUE))

# O dplyr a seguir plota uma matriz 16x16 arbitrária
result %>% 
  get_solution(x[i,j,k]) %>%
  filter(value > 0) %>%  
  select(i, j, k) %>% 
  tidyr::spread(j, k) %>% 
  select(-i)

model_fixed <- model %>% ### [linha, coluna, valor]
  add_constraint(x[1, 1, 5] == 1) %>% 
  add_constraint(x[1, 4, 12] == 1) %>% 
  add_constraint(x[1, 6, 15] == 1) %>% 
  add_constraint(x[1, 9, 13] == 1) %>% 
  add_constraint(x[1, 10, 8] == 1) %>% 
  add_constraint(x[1, 11, 4] == 1) %>% 
  add_constraint(x[1, 15, 7] == 1) %>% 
  add_constraint(x[2, 1, 2] == 1) %>% 
  add_constraint(x[2, 4, 7] == 1) %>% 
  add_constraint(x[2, 5, 9] == 1) %>% 
  add_constraint(x[2, 8, 12] == 1) %>% 
  add_constraint(x[2, 9, 16] == 1) %>% 
  add_constraint(x[2, 11, 5] == 1) %>% 
  add_constraint(x[2, 12, 15] == 1) %>% 
  add_constraint(x[2, 13, 3] == 1) %>% 
  add_constraint(x[2, 15, 8] == 1) %>% 
  add_constraint(x[3, 2, 8] == 1) %>% 
  add_constraint(x[3, 3, 15] == 1) %>% 
  add_constraint(x[3, 7, 1] == 1) %>% 
  add_constraint(x[3, 8, 13] == 1) %>% 
  add_constraint(x[3, 11, 14] == 1) %>% 
  add_constraint(x[3, 13, 6] == 1) %>% 
  add_constraint(x[3, 14, 12] == 1) %>%
  add_constraint(x[3, 15, 11] == 1) %>% 
  add_constraint(x[3, 16, 4] == 1) %>% 
  add_constraint(x[4, 4, 13] == 1) %>% 
  add_constraint(x[4, 7, 4] == 1) %>% 
  add_constraint(x[4, 9, 6] == 1) %>% 
  add_constraint(x[4, 10, 11] == 1) %>% 
  add_constraint(x[4, 13, 16] == 1) %>% 
  add_constraint(x[4, 14, 15] == 1) %>% 
  add_constraint(x[4, 15, 10] == 1) %>% 
  add_constraint(x[5, 3, 9] == 1) %>% 
  add_constraint(x[5, 4, 11] == 1) %>% 
  add_constraint(x[5, 7, 13] == 1) %>% 
  add_constraint(x[5, 9, 15] == 1) %>% 
  add_constraint(x[5, 11, 2] == 1) %>% 
  add_constraint(x[5, 12, 6] == 1) %>%
  add_constraint(x[5, 15, 12] == 1) %>% 
  add_constraint(x[6, 1, 12] == 1) %>% 
  add_constraint(x[6, 3, 3] == 1) %>% 
  add_constraint(x[6, 5, 2] == 1) %>% 
  add_constraint(x[6, 8, 4] == 1) %>% 
  add_constraint(x[6, 10, 1] == 1) %>% 
  add_constraint(x[6, 12, 8] == 1) %>% 
  add_constraint(x[6, 13, 14] == 1) %>% 
  add_constraint(x[7, 3, 13] == 1) %>% 
  add_constraint(x[7, 6, 9] == 1) %>% 
  add_constraint(x[7, 8, 15] == 1) %>% 
  add_constraint(x[7, 10, 14] == 1) %>% 
  add_constraint(x[7, 14, 16] == 1) %>% 
  add_constraint(x[8, 1, 7] == 1) %>% 
  add_constraint(x[8, 3, 4] == 1) %>% 
  add_constraint(x[8, 4, 1] == 1) %>% 
  add_constraint(x[8, 5, 8] == 1) %>% 
  add_constraint(x[8, 7, 10] == 1) %>% 
  add_constraint(x[8, 8, 6] == 1) %>%
  add_constraint(x[8, 9, 5] == 1) %>% 
  add_constraint(x[8, 14, 3] == 1) %>% 
  add_constraint(x[8, 15, 9] == 1) %>%
  add_constraint(x[9, 1, 6] == 1) %>% 
  add_constraint(x[9, 3, 8] == 1) %>% 
  add_constraint(x[9, 6, 16] == 1) %>% 
  add_constraint(x[9, 8, 11] == 1) %>% 
  add_constraint(x[9, 9, 10] == 1) %>% 
  add_constraint(x[9, 12, 4] == 1) %>% 
  add_constraint(x[9, 14, 14] == 1) %>% 
  add_constraint(x[9, 15, 15] == 1) %>% 
  add_constraint(x[10, 1, 1] == 1) %>%
  add_constraint(x[10, 9, 11] == 1) %>% 
  add_constraint(x[10, 11, 15] == 1) %>% 
  add_constraint(x[10, 12, 14] == 1) %>% 
  add_constraint(x[10, 14, 9] == 1) %>% 
  add_constraint(x[11, 2, 13] == 1) %>% 
  add_constraint(x[11, 11, 3] == 1) %>% 
  add_constraint(x[11, 12, 2] == 1) %>% 
  add_constraint(x[11, 13, 7] == 1) %>% 
  add_constraint(x[11, 15, 6] == 1) %>% 
  add_constraint(x[11, 16, 10] == 1) %>%
  add_constraint(x[12, 2, 9] == 1) %>%
  add_constraint(x[12, 4, 14] == 1) %>% 
  add_constraint(x[12, 7, 7] == 1) %>% 
  add_constraint(x[12, 10, 13] == 1) %>% 
  add_constraint(x[12, 11, 6] == 1) %>% 
  add_constraint(x[12, 13, 12] == 1) %>%
  add_constraint(x[12, 14, 8] == 1) %>% 
  add_constraint(x[12, 15, 2] == 1) %>% 
  add_constraint(x[13, 2, 14] == 1) %>% 
  add_constraint(x[13, 5, 4] == 1) %>% 
  add_constraint(x[13, 7, 6] == 1) %>% 
  add_constraint(x[13, 8, 1] == 1) %>% 
  add_constraint(x[13, 11, 11] == 1) %>% 
  add_constraint(x[13, 13, 10] == 1) %>% 
  add_constraint(x[13, 16, 8] == 1) %>% 
  add_constraint(x[14, 1, 10] == 1) %>% 
  add_constraint(x[14, 3, 1] == 1) %>% 
  add_constraint(x[14, 5, 14] == 1) %>%
  add_constraint(x[14, 6, 13] == 1) %>% 
  add_constraint(x[14, 7, 3] == 1) %>% 
  add_constraint(x[14, 10, 16] == 1) %>% 
  add_constraint(x[14, 12, 9] == 1) %>% 
  add_constraint(x[15, 1, 13] == 1) %>% 
  add_constraint(x[15, 8, 9] == 1) %>% 
  add_constraint(x[15, 9, 12] == 1) %>% 
  add_constraint(x[15, 12, 3] == 1) %>% 
  add_constraint(x[15, 13, 15] == 1) %>% 
  add_constraint(x[15, 16, 2] == 1) %>% 
  add_constraint(x[16, 1, 4] == 1) %>%
  add_constraint(x[16, 2, 11] == 1) %>% 
  add_constraint(x[16, 5, 16] == 1) %>% 
  add_constraint(x[16, 6, 2] == 1) %>%
  add_constraint(x[16, 10, 6] == 1) %>% 
  add_constraint(x[16, 14, 13] == 1) %>%
  add_constraint(x[16, 15, 3] == 1) %>%
  add_constraint(x[16, 16, 9] == 1) 
  
result <- solve_model(model_fixed, with_ROI(solver = "glpk", verbose = TRUE))

result %>% 
  get_solution(x[i,j,k]) %>%
  filter(value > 0) %>%  
  select(i, j, k) %>% 
  tidyr::spread(j, k) %>% 
  select(-i) 

