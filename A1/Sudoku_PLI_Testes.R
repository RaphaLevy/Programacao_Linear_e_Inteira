### Teste 1

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


library(ompr.roi)
library(ROI.plugin.glpk)
result <- solve_model(model, with_ROI(solver = "glpk", verbose = TRUE))

# Adiciona as restri??es para valores j? inclu?dos
model_fixed <- model %>% ### [linha, coluna, valor]
  add_constraint(x[1, 2, 7] == 1) %>% 
  add_constraint(x[1, 5, 2] == 1) %>% 
  add_constraint(x[1, 9, 5] == 1) %>% 
  add_constraint(x[2, 2, 6] == 1) %>% 
  add_constraint(x[2, 7, 7] == 1) %>% 
  add_constraint(x[3, 1, 5] == 1) %>% 
  add_constraint(x[3, 4, 6] == 1) %>% 
  add_constraint(x[3, 5, 4] == 1) %>% 
  add_constraint(x[4, 2, 1] == 1) %>% 
  add_constraint(x[4, 3, 3] == 1) %>% 
  add_constraint(x[5, 1, 6] == 1) %>% 
  add_constraint(x[5, 5, 5] == 1) %>% 
  add_constraint(x[5, 9, 2] == 1) %>% 
  add_constraint(x[6, 1, 2] == 1) %>% 
  add_constraint(x[6, 2, 5] == 1) %>% 
  add_constraint(x[6, 5, 3] == 1) %>% 
  add_constraint(x[6, 6, 6] == 1) %>% 
  add_constraint(x[6, 7, 1] == 1) %>% 
  add_constraint(x[6, 8, 9] == 1) %>% 
  add_constraint(x[7, 2, 4] == 1) %>% 
  add_constraint(x[7, 4, 7] == 1) %>% 
  add_constraint(x[7, 6, 8] == 1) %>% 
  add_constraint(x[7, 9, 6] == 1) %>% 
  add_constraint(x[8, 1, 7] == 1) %>% 
  add_constraint(x[8, 2, 2] == 1) %>% 
  add_constraint(x[8, 4, 4] == 1) %>% 
  add_constraint(x[8, 5, 9] == 1) %>% 
  add_constraint(x[8, 8, 5] == 1) %>% 
  add_constraint(x[8, 9, 1] == 1) %>% 
  add_constraint(x[9, 1, 8] == 1) %>% 
  add_constraint(x[9, 9, 3] == 1)
result <- solve_model(model_fixed, with_ROI(solver = "glpk", verbose = TRUE))

result %>% 
  get_solution(x[i,j,k]) %>%
  filter(value > 0) %>%  
  select(i, j, k) %>% 
  tidyr::spread(j, k) %>% 
  select(-i) 



##############################################################################################

### Teste 2

model_fixed <- model %>% ### [linha, coluna, valor]
  add_constraint(x[1, 1, 1] == 1) %>% 
  add_constraint(x[1, 3, 8] == 1) %>%
  add_constraint(x[1, 9, 5] == 1) %>%
  add_constraint(x[2, 8, 2] == 1) %>%
  add_constraint(x[3, 4, 4] == 1) %>%
  add_constraint(x[3, 6, 3] == 1) %>%
  add_constraint(x[3, 8, 9] == 1) %>%
  add_constraint(x[4, 1, 7] == 1) %>%
  add_constraint(x[4, 2, 2] == 1) %>%
  add_constraint(x[4, 5, 6] == 1) %>%
  add_constraint(x[4, 6, 8] == 1) %>%
  add_constraint(x[5, 3, 9] == 1) %>%
  add_constraint(x[5, 7, 6] == 1) %>%
  add_constraint(x[6, 4, 1] == 1) %>%
  add_constraint(x[7, 2, 3] == 1) %>%
  add_constraint(x[7, 7, 4] == 1) %>%
  add_constraint(x[8, 1, 8] == 1) %>%
  add_constraint(x[8, 2, 9] == 1) %>%
  add_constraint(x[8, 4, 7] == 1) %>%
  add_constraint(x[9, 4, 2] == 1) %>%
  add_constraint(x[9, 5, 1] == 1) %>%
  add_constraint(x[9, 7, 5] == 1)
result <- solve_model(model_fixed, with_ROI(solver = "glpk", verbose = TRUE))

result %>% 
  get_solution(x[i,j,k]) %>%
  filter(value > 0) %>%  
  select(i, j, k) %>% 
  tidyr::spread(j, k) %>% 
  select(-i) 
