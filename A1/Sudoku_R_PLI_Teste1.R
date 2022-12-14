library(ompr)
library(dplyr)
n <- 9
model <- MIPModel() %>%
  
  # O n?mero k armazenado na posi??o i,j
  add_variable(x[i, j, k], i = 1:n, j = 1:n, k = 1:9, type = "binary") %>%
  
  # Um jogo de sudoku n?o precisa de um valor espec?fico para a fun??o objetivo,
  # portanto podemos setar a F.O. como 0
  set_objective(0) %>%
  
  # Apenas um n?mero pode ser atribu?do por c?lula
  add_constraint(sum_expr(x[i, j, k], k = 1:9) == 1, i = 1:n, j = 1:n) %>%
  
  # Cada n?mero ? encontrado exatamente uma ?nica vez em cada linha
  add_constraint(sum_expr(x[i, j, k], j = 1:n) == 1, i = 1:n, k = 1:9) %>%
  
  # Cada n?mero ? encontrado exatamente uma ?nica vez em cada coluna
  add_constraint(sum_expr(x[i, j, k], i = 1:n) == 1, j = 1:n, k = 1:9) %>% 
  
  # Cada quadrado 3x3 deve ter todos os n?meros de 1 a 9
  add_constraint(sum_expr(x[i, j, k], i = 1:3 + sx, j = 1:3 + sy) == 1, 
                 sx = seq(0, n - 3, 3), sy = seq(0, n - 3, 3), k = 1:9)
model

install.packages("ompr.roi")
install.packages("ROI.plugin.glpk")

library(ompr.roi)
library(ROI.plugin.glpk)
result <- solve_model(model, with_ROI(solver = "glpk", verbose = TRUE))

# O dplyr a seguir plota uma matriz 9x9 arbitr?ria
result %>% 
  get_solution(x[i,j,k]) %>%
  filter(value > 0) %>%  
  select(i, j, k) %>% 
  tidyr::spread(j, k) %>% 
  select(-i)

# Adiciona as restri??es para valores j? inclu?dos
model_fixed2 <- model %>% ### [linha, coluna, valor]
  add_constraint(x[1, 1, 9] == 1) %>% 
  add_constraint(x[1, 8, 5] == 1) %>% 
  add_constraint(x[1, 9, 1] == 1) %>% 
  add_constraint(x[2, 6, 3] == 1) %>% 
  add_constraint(x[2, 7, 4] == 1) %>% 
  add_constraint(x[3, 5, 9] == 1) %>% 
  add_constraint(x[3, 9, 7] == 1) %>% 
  add_constraint(x[4, 2, 4] == 1) %>% 
  add_constraint(x[5, 3, 2] == 1) %>% 
  add_constraint(x[5, 4, 1] == 1) %>% 
  add_constraint(x[5, 5, 7] == 1) %>% 
  add_constraint(x[6, 5, 4] == 1) %>% 
  add_constraint(x[6, 6, 8] == 1) %>% 
  add_constraint(x[6, 8, 7] == 1) %>% 
  add_constraint(x[7, 6, 6] == 1) %>% 
  add_constraint(x[7, 7, 8] == 1) %>% 
  add_constraint(x[8, 3, 8] == 1) %>% 
  add_constraint(x[8, 6, 1] == 1) %>% 
  add_constraint(x[8, 8, 9] == 1) %>% 
  add_constraint(x[8, 9, 2] == 1) %>% 
  add_constraint(x[9, 1, 5] == 1) %>%
  add_constraint(x[9, 2, 6] == 1)
result <- solve_model(model_fixed2, with_ROI(solver = "glpk", verbose = TRUE))

result %>% 
  get_solution(x[i,j,k]) %>%
  filter(value > 0) %>%  
  select(i, j, k) %>% 
  tidyr::spread(j, k) %>% 
  select(-i) 
