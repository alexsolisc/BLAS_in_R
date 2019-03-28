# Comienza prueba
print("Test started!")
# Fijar el tamaño de las matrices y vectores
tamano <- 2500
# Multiplicación de dos vectores
x <- runif(tamano,0,1000)
# Se crea una vector de 1000 x 1 y adicionalmente se perturba con valores aleatorios entre 250 y 750
y <- runif(tamano,0,1000) + runif(1,250,750)
print("t1...")
t1 <- system.time({ 
  x %*% y
})
# Crear una matriz de 2500 x 2500 utilizando números aleatorios de una distribución uniforme.
set.seed(1234)
M<-matrix(runif(tamano*tamano,min=0,1000),tamano,tamano)
# Mutiplicación de matriz por vector
print("t2...")
t2 <- system.time({ 
  M %*% x
})
# Multiplicación de una matriz por una matriz
print("t3...")
t3 <- system.time({ 
  (M %*% t(M))
})
# Calcular los eigen valores de una matriz
print("t4...")
t4 <- system.time({ 
  eigen(M)
})
# Invertir una matriz
print("t5...")
t5 <- system.time({ 
  solve(M)
})
# Resolver un sistema de ecuaciones lineals
print("t6...")
t6 <- system.time({ 
  solve(M,y)
})
# Análisis de componentes principales
print("t7...")
t7 <- system.time({ 
  princomp(M)
})
# Descomposición de valores singulares
print("t8...")
t8 <- system.time({ 
  svd(M)
})
# Escribir los resultados en un csv
tiempos <- as.data.frame(rbind(t1,t2,t3,t4,t5,t6,t7,t8))
write.csv(tiempos, "resultados_prueba.csv")
# Termina prueba
print("Test finished!")