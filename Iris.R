?iris

View(iris)

## Histograma de iris$Sepal.Length
## 2. Boxplot de Petal.Length ~ Species
## 3. Dispersão entre Sepal.Length e Sepal.Width

hist(iris$Sepal.Length)

names(iris)
boxplot(iris$Species, iris$Petal.Length,
        main = "Diferenças entre as espécies",
        xlab = "Nomes das espécies",
        ylab = "Tamanho das pétalas")


plot(iris$Sepal.Length, iris$Sepal.Width,
     main = "Tamanho de Sepal",
     xlab = "Comprimento da pétala",
     ylab = "Largura da pétala")
