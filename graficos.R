
########################################################################
#GRAFICOS R
########################################################################


## Grafico de dispersao: plot() 

head(mtcars)

# Grafico de dispersao simples
plot(mtcars$wt, mtcars$mpg)

# Com titulo e nomes de eixos
plot(mtcars$wt, mtcars$mpg,
     main = "Peso vs Consumo",
     xlab = "Peso (1000 lbs)",
     ylab = "Milhas por galao")


x11()
par(mfrow = c(1, 2))
# dispersao hp x mpg
plot(mtcars$hp, mtcars$mpg,
     main = "Potencia vs Consumo",
     xlab = "Potencia (hp)",
     ylab = "Milhas por galao")


## Histograma: hist() 

hist(mtcars$mpg,
     main = "Distribuicao do consumo",
     xlab = "Milhas por galao")

# Controlando o numero de barras
hist(mtcars$mpg, breaks = 10)


## Grafico de barras: barplot() 

# Contar quantos carros tem 4, 6 ou 8 cilindros
tabela_cilindros <- table(mtcars$cyl)
barplot(tabela_cilindros,
        main = "Numero de carros por cilindrada",
        xlab = "Cilindros",
        ylab = "Quantidade")


## Boxplot 

boxplot(mpg ~ cyl, data = mtcars,
        main = "Consumo por numero de cilindros",
        xlab = "Cilindros",
        ylab = "Milhas por galao")


## dataset iris 

hist(iris$Sepal.Length,
     main = "Distribuicao do comprimento da sepala",
     xlab = "Sepal.Length")

boxplot(Petal.Length ~ Species, data = iris,
        main = "Comprimento da petala por especie")

plot(iris$Sepal.Length, iris$Sepal.Width,
     main = "Sepal.Length vs Sepal.Width",
     xlab = "Sepal.Length", ylab = "Sepal.Width")


########################################################################
#CUSTOMIZANDO GRAFICOS BASE
########################################################################

## Cores e pontos 

plot(mtcars$wt, mtcars$mpg,
     col = "blue",        # cor dos pontos
     pch = 19,            # tipo de ponto (19 = bolinha cheia)
     cex = 1.5)             # tamanho dos pontos

x11()
# Colorindo por grupo (categoria)
plot(mtcars$wt, mtcars$mpg,
     col = as.factor(mtcars$cyl),   # uma cor por numero de cilindros
     pch = 19)
legend("topright",
       legend = unique(mtcars$cyl),
       col = 1:3, pch = 19,
       title = "Cilindros")


## Linhas e tipos de grafico 

x <- 1:10
y <- x^2
plot(x, y, type = "l", col = "darkred", lwd = 2)
# type = "p" (pontos, padrao), "l" (linha), "b" (ambos), "o" (sobrepostos)


##Multiplos graficos na mesma tela 

par(mfrow = c(2, 2))  # matriz de 2 linhas x 2 colunas

hist(mtcars$mpg, main = "Histograma")
boxplot(mtcars$mpg, main = "Boxplot")
plot(mtcars$wt, mtcars$mpg, main = "Dispersao")
barplot(table(mtcars$cyl), main = "Barras")

par(mfrow = c(1, 1))  # volta ao normal (sempre resetar depois!)


## Salvando graficos em arquivo 
png("meu_grafico.png", width = 800, height = 600)
plot(mtcars$wt, mtcars$mpg)
dev.off()   # fecha o arquivo - passo obrigatorio!


########################################################################
# INTRODUCAO AO GGPLOT2
########################################################################

## Instalando e a "gramatica" dos graficos 

# install.packages("ggplot2")   # rode apenas uma vez
library(ggplot2)

x11()
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point()


## Os principais geoms 

# Dispersao
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(size = 3, color = "steelblue")

# Linha
ggplot(economics, aes(x = date, y = unemploy)) +
  geom_line()

# Histograma
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(bins = 10, fill = "orange", color = "black")

# Barras
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(fill = "darkgreen")

# Boxplot
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot(fill = "lightblue")


## Mapeando cor, tamanho e forma a variaveis 

ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3)

ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl), size = hp)) +
  geom_point()


## Titulos e rotulos com labs() 
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  labs(title = "Peso vs Consumo",
       x = "Peso (1000 lbs)",
       y = "Milhas por galao")


## dataset iris

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 2) +
  labs(title = "Sepal.Length vs Sepal.Width por especie")

