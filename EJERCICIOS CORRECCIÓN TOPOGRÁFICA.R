rm(list=ls())

# Cargar los datos de “train2”.
datos <- read.csv("")
# Conocer los datos.
summary(datos)

# Mostrar los niveles de la variable “LotConfig”
datos$LotConfig <- as.factor(datos$LotConfig)
levels(datos$LotConfig)

# Mostrar el número de elementos de cada nivel -> tabla.
nivel_n_elementos <- table(datos$LotConfig)
print(nivel_n_elementos)

# Corregimos: Crear un diccionario con los términos correctos:
dic_correcto <- c("Corner", "CulDSac", "FR2", "FR3", "Inside")

# Crear una variable, función, para corregir los errores tipográficos
corrector <- function(valor, dic_correcto) {
  mejor_coincidencia <- amatch(valor, dic_correcto, maxDist = 4)
  return(dic_correcto[mejor_coincidencia])
}

# Corregir los errores en la tabla datos (=train2)
datos$LotConfig <- sapply(datos$LotConfig, corrector, dic_correcto = dic_correcto)
datos$LotConfig <- as.factor(datos$LotConfig)
levels(datos$LotConfig)
table(datos$LotConfig)
# Comprobado.