# Simulação dos dados
set.seed(0)
data <- rnorm(40, mean = 50, sd = 10)

# Limites de especificação
USL <- 70
LSL <- 30

# Estatísticas básicas
mean_val <- mean(data)
sd_val <- sd(data)

# Índices de Capabilidade
Cp <- (USL - LSL) / (6 * sd_val)
Cpk <- min((USL - mean_val) / (3 * sd_val), (mean_val - LSL) / (3 * sd_val))

# Índices de Performance (assumindo mesma amostra)
Pp <- Cp
Ppk <- Cpk

# Exibir os valores simulados
cat("Valores simulados:\n")
print(round(data, 2))

# Exibir os índices
cat(sprintf("\nMean: %.2f\nSD: %.2f\nCp: %.2f\nCpk: %.2f\nPp: %.2f\nPpk: %.2f\n",
            mean_val, sd_val, Cp, Cpk, Pp, Ppk))

# Gráfico
hist(data, breaks = 10, probability = TRUE, col = "lightblue",
     main = "Histogram with Gaussian Curve", xlab = "Values", border = "black")
curve(dnorm(x, mean = mean_val, sd = sd_val), col = "darkblue", lwd = 2, add = TRUE)

# Adicionar texto no gráfico
legend("topright", legend = c(
  sprintf("Mean = %.2f", mean_val),
  sprintf("SD = %.2f", sd_val),
  sprintf("Cp = %.2f", Cp),
  sprintf("Cpk = %.2f", Cpk),
  sprintf("Pp = %.2f", Pp),
  sprintf("Ppk = %.2f", Ppk)
), bty = "n")

