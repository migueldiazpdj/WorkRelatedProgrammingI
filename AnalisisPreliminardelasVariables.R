library(ggplot2)

#EJERCICIOS ANÁLISIS PRELIMINAR DE LAS VARIABLES
rm(list=ls())

#Cargar los datos de trainmod (Los creados en el apartado anterior).
train <- read.csv("")
show(train)

#Realizar un resumen estadístico de los datos y realizar una interpretación.
summary(train)

#Las variables más importantes:
#La variable id como un identficador.

#1.LotArea: tamaño del terreno.

#2.OverallQual: Esta variable indica la calidad general de la vivienda en una escala del 1 al 10.

#3.YearBuilt: El año de construcción.

#4.GrLivArea: Esta variable representa el área habitable sobre el nivel del suelo.

#5.FullBath: El número de baños en la vivienda.

#6.TotRmsAbvGrd: El número total de habitaciones por encima del nivel del suelo.

#7.GarageCars y GarageArea: Estas variables representan el número que caben en el garaje y el área del garaje.

#8.SalePrice: Esta es la variable objetivo y representa el precio de venta de la vivienda.

#Determinar los niveles existentes para la variable “Crisis”.
unique(train$Crisis)

#Sustituir los “Si” por “Crisis” y los “No” por “Burbuja”.
levels(train$Crisis)[1] <- "Crisis"
levels(train$Crisis)[2] <- "Burbuja"
levels(train$Crisis)

#(Aqui sustituimos los valores reales)
train$Crisis <- ifelse(train$Crisis == "Si", "Crisis", "Burbuja")
View(train$Crisis)

#Determinar la clase de cada uno de los datos:
sapply(train, class)

#Realizar un gráfico del precio de venta.
plot(train$SalePrice)

#Realizar un histograma del precio de venta
hist(train$SalePrice)

#Graficar el precio de venta en función de la variable MSZoning
boxplot(SalePrice ~ MSZoning, data = train)

#Mostrar, gráficamente la relación entre el precio de venta y “GrLivArea”. ¿Como es?.
ggplot(train, aes(x = GrLivArea, y = SalePrice)) +
  geom_point() +
  labs(x = "GrLivArea", y = "Precio de venta") +
  ggtitle("GrLivArea vs SalePrice")

#¿Y la relación con “LotArea”?
ggplot(train, aes(x = GrLivArea, y = SalePrice)) +
  geom_point() +
  labs(x = "LotArea", y = "Precio de venta") +
  ggtitle("LotArea vs SalePrice")

#Las relaciones son proporcionales, es decir,a medida que una variable aumenta en valor, 
#la otra variable también aumenta en una proporción constante.

#Realizar un gráfico de la variable “MSZoning”.
ggplot(train, aes(x = MSZoning)) +
  geom_bar() +
  labs(x = "Zona", y = "Frecuencia") +
  ggtitle("MSZoning")
# Seleccionar los datos numéricos
datosNum = train[,sapply(train,is.numeric)]
View(datosNum)

#Graficar todas las relaciones entre las variables.
library(PerformanceAnalytics)
chart.Correlation(datosNum,hist=T)

#Crear un nuevo Data Frame con las 10 últimas variables.
# Seleccionar las 10 últimas variables
ultimas_variables <- train[, (ncol(train) - 9):ncol(train)]
View(ultimas_variables)

#Analizar la relación de estas variables con dos gráficos diferentes.
# Scatter plot
plot(ultimas_variables)

#Analizar la correlación entre las variables numéricas.
correlaciones = cor(datosNum)
library(corrplot)
corrplot(cor(datosNum), method="shade", shade.col=NA, tl.col="black", 
         tl.srt=45, addgrid.col="black", type="lower", diag=FALSE, cl.pos="n")

# Eliminar los valores perdidos.
datosNuma<-datosNum[complete.cases(datosNum),]

#Volver a analizar la correlación realizando tres tipos de dibujos diferentes.
corrplot(cor(datosNuma), method="number", shade.col=NA, tl.col="black", 
         tl.srt=45, addgrid.col="black", type="lower", diag=TRUE, cl.pos="n",tl.cex = 0.6)

corrplot(cor(datosNuma), method="color", shade.col=NA, tl.col="black", 
         tl.srt=45, addgrid.col="black", type="lower", diag=TRUE, cl.pos="n",tl.cex = 0.6)

corrplot(cor(datosNuma), method="pie", shade.col=NA, tl.col="black", 
         tl.srt=45, addgrid.col="black", type="lower", diag=TRUE, cl.pos="n",tl.cex = 0.6)

#Guardar los datos
write.csv(datosNuma, "datos.csv", row.names = FALSE)
