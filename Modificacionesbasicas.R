#EJERCICIOS MODIFICACIONES BÁSICAS 1.
rm(list=ls())

#Cargar los datos de Train.
datos_train <- read.csv("")
View(datos_train)

#Para la variable “MSZoning” eliminar de la variable “C (all)” el “ (all)” (sustituirlo por“”).
datos_train$MSZoning <- gsub("\\(all\\)", "", datos_train$MSZoning)
View(datos_train)

#Crear una nueva variable que se llame Crisis.
datos_train$Crisis = "XXX"

#Transformar la variable anterior para determinar (Debe tomar los valores Sí y No),basándose en la variable “YrSold”, si la casa se vendió en el periodo precrisis (antes de 2008) o durante la crisis (a partir de 2008).
table(datos_train$Crisis)
datos_train$Crisis[datos_train$YrSold < 2008] = "No"
datos_train$Crisis[datos_train$YrSold >= 2008] = "Si"
print(datos_train$Crisis)

#Crear un nuevo grupo de datos con las 10 casas más caras, en función de lavariable “SalePrice”.
train_mas_caros = datos_train[order(datos_train$SalePrice, decreasing = TRUE)[1:10],]
View(train_mas_caros)

#Determinar la calle en la que se encuentra la casa más cara.
mas_cara = as.data.frame(datos_train$Street[which.max(datos_train$SalePrice)])
print(mas_cara) #Como todos los elementos de la columna street son Pave optare por usar otra columna que si diferencie.
mas_cara_n = as.data.frame(datos_train$Neighborhood[which.max(datos_train$SalePrice)])
print(mas_cara_n) #Asi sabemos el barrio en el que se encuentra.

# Crear una variable llamada “Reforma” y que muestre los años que pasaron entre la última reforma y la venta (YrSold-YearRemodAdd).
Reforma <- datos_train$YrSold-datos_train$YearRemodAdd
print(datos_train$Reforma)