rm(list=ls())
library(ggplot2)
# Establecer una semilla con el código de vuestro carnet.
set.seed(1612921)

# Crear un data frame: 100 filas.
# a. Columna numérica utilizando la función rnorm
# b. Crear una secuencia de datos que incluya 10 veces la letra A y 10 veces la letra B.
df <- data.frame(
  Nº = rnorm(100),
  AyB = rep(rep(c("A", "B"), each = 10), length.out = 100)
)
View(df)
str(df)

# c. Calcular el valor medio de las A y las B en una nueva tabla
valor_medio <- aggregate(Nº ~ AyB, df, mean)
View(valor_medio)

# d. Hacer un histograma de la variable numérica original, en el cual incluyan 14 columnas. Uso ggplot.
ggplot(df, aes(x = Nº)) +
  geom_histogram(binwidth = (max(df$Nº) - min(df$Nº))/14.0, fill = "#219ebc", color = "black") +
  labs(title = "Histograma",
       x = "Nº",
       y = "Frecuencia")

# e. Transponer esta tabla creando un nuevo dataframe. Transpuse las dos tablas.
df_trans <- as.data.frame(t(df))
View(df_trans)
valor_medio_trans <- as.data.frame(t(valor_medio))
View(valor_medio_trans)