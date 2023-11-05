library(dplyr)

#EJERCICIOS INTRODUCCIÓN1-

#Realizar las siguientes operaciones y ejercicio 2 (con una variable):

#Sumar 25,3 y 35,1.
a = sum(25.3 + 35.1)
print(a)

#Restar 15 menos 8,2.
b = 15 - 8.2
print(b)

#Multiplicar 12 por 4.
c = 12*4
print(c)

#Dividir 15 entre 3.
d = 15/3
print(d)

#Calcular la raíz cuadrada de 125.
e = sqrt(125)
print(e)

#Elevar 2 a la 8.
f = 2^8
print(f)

#Crear los siguientes vectores:
  #Un vector que vaya del 20 al 127.
v1 <- c(20:127)
print(v1)

#Un vector que incluya los números 5, 12, 25, 8, 46 y 52.
v2 <- c(5, 12, 25, 8, 46, 52)

#Un vector que vaya del 35 al 80 e incluya a continuación el 10 y el 100.
v3 <- c(35:80, 10, 100)

#Crear un vector con las 5 primeras letras del abecedario y los 5 primeros números enteros.
v4 <- c("a","b","c","d", 1:5)
v4

#Realizar las siguientes tareas con vectores:
#Determinar el número de elementos de cada vector creado en el punto 3.
v1_length <- length(v1)
v1_length
v2_length <- length(v2)
v2_length
v3_length <- length(v3)
v3_length
v4_length <- length(v4)
v4_length

#Crear otro vector seleccionando los primeros 5 elementos del primer vector.
v5 <- v1[1:5]
v5

#Crear otro vector excluyendo los primeros 100 elementos del primer vector.
v1_excluyendo_100_primeros <- v1[101:length(v1)]
print(v_excluyendo_100_primeros)

#Crear un nuevo vector con los datos del primer vector mayores o iguales que 99.
v1_mayor_igual_99 <- v1[v1>=99]
v1_mayor_igual_99

#Determinar la clase del primer vector creado en el ejercicio 3 y del cuarto.
class(v1)
class(v4)

#Transformar la clase del segundo vector a texto.
v2 <- as.character(v2)
class(v2)

#Crear las siguientes listas y realizar las siguiente tareas:
#Crear una lista con los nombres de 5 personas, su edad y su altura.
people <- list(
  person1 = list(name = "Juan", age = 30, height = 175),
  person2 = list(name = "María", age = 25, height = 160),
  person3 = list(name = "Carlos", age = 35, height = 180),
  person4 = list(name = "Ana", age = 28, height = 165),
  person5 = list(name = "Luis", age = 40, heigth = 170)
)
people

#Mostrar de dos formas diferentes los atributos de la lista.
person_2_height <- print(people[[2]]$height)
person_3_height <- print(people$person3$height)

#Mostrar el segundo elemento de la lista.
people_2_element <- print(people[2])

#Mostrar el cuarto valor de ese elemento.
people_4_element <- print(people[[2]][[4]]) #solo hay hasta 3.

#Mostrar el último elemento de la primera variable.
people_last_element <- print(people[[1]][[3]])

#Crear una matriz de 4x4 y realizar las siguientes tareas:
#Mostrar la matriz en la consola.
my_matrix <- matrix(50:65, nrow = 4, ncol=4, byrow = TRUE)
my_matrix

#Extraer los atributos.
values <- attributes(my_matrix)
values

#Crear una nueva matriz con las dos primeras filas.
my_new_matrix_rows <- my_matrix[1:2,]
my_new_matrix_rows

#Crear una nueva matriz con las dos primeras columnas.
my_new_matrix_columns <- my_matrix[,1:2]
my_new_matrix_columns

#Crear una nueva matriz con las dos primeras filas y las tres primeras column
my_new_matrix_rows_and_columns <- my_matrix[1:2, 1:2]
my_new_matrix_rows_and_columns

#Añadir una nueva columna.
my_matrix <- cbind(my_matrix, "Theres nothing we can do")
print(my_matrix)

#Añadir una nueva fila.
my_matrix <- rbind(my_matrix, "Napoleón")
print(my_matrix)

#Crear un factor con las notas que se pueden sacar en la Universidad (SS, AP, NT, SB yMH) y realizar las siguientes tareas:
#Calcular el número de opciones existentes.
University_califications <- factor(c("SS", "AP", "NT", "SB", "MH"))
options <- length(University_califications)
options

#Mostrar el tercer nivel.
levels_3 <- print(levels(University_califications)[3])

#Sustituir “NT” por “Notable”.
gsub("NT", "Notable", University_califications)

#Crear un DataFrame de 4 variables (Nombre del Jugador, Equipo, Posición y Edad) y 8 observaciones (Jugadores) y realizar las siguientes tareas:
#Visualizarlo por consola.

Jugadores <- data.frame(
  Nombre_del_Jugador = c("Lucas Pérez", "Bergantiños", "Messi", "Pepe", "Ronaldo", "Puyol", "Piqué", "Kaká"),
  Equipo = c("EquipoA", "EquipoB", "EquipoA", "EquipoC", "EquipoB", "EquipoC", "EquipoA", "EquipoB"),
  Posicion = c("Delantero", "Defensa", "Centrocampista", "Delantero", "Centrocampista", "Defensa", "Portero", "Centrocampista"),
  Edad = c(25, 28, 23, 30, 27, 24, 29, 26)
)

#Contar el número de filas.
nrow(Jugadores)

#Contar el número de columnas.
ncol(Jugadores)

#Calcular las dimensiones.
dim(Jugadores)

#Cambiar el nombre de las variables a (Nombre, Team, Especialidad y Años).
colnames(Jugadores) <- c("Nombre", "Team", "Especialidad", "Años")

#Seleccionar aquellos jugadores mayores de 25 años.
more_than_25 <- Jugadores[Jugadores$Años > 25,]

#Seleccionar aquellos jugadores de menos de 25 años y mayores de 20.
more_than_20_less_25 <- Jugadores[20 < Jugadores$Años & Jugadores$Años < 25,]
print(more_than_20_less_25)

#Seleccionar aquellos jugadores de menos de 25 años y que tengan una especialidad determinada (según los jugadores creados).
more_than_25_centrocampistas <- Jugadores[Jugadores$Especialidad == "Centrocampista" & Jugadores$Años < 25,]
more_than_25_centrocampistas

#Seleccionar aquellos jugadores de menos de 25 años o que tengan una especialidad determinada (según los jugadores creados).
less_than_25_or_escpecialidad <- Jugadores[Jugadores$Especialidad == "Centrocampista" | Jugadores$Años < 25,]
less_than_25_or_escpecialidad

#Determine el área de un círculo.
radio <- 5.5
area <- pi * radio^2

#Determine el área de un rectángulo.
largo <- 4
ancho <- 5
area2 <- largo * ancho
cat("El area es:", ecuacion_2grado, "\n")

#Resuelva una ecuación de segundo grado.
a <- 2
b <- -5
c <- 3
ecuacion_2grado <- solve(2*a, -b, sqrt(b^2 - 4*a*c))
cat("Las soluciones son:", ecuacion_2grado, "\n")

#Determine el perímetro de una circunferencia.
radio_1 <- 5
perimetro <- 2 * pi * radio_1
cat("El perímetro es:", perimetro, "\n")

