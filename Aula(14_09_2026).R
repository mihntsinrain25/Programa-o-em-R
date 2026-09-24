dir()

x <- 42 # x recebe 42, x é igual a 42
print(x)
x

# tipos basicos
taxa_juros <- 0.1375
typeof(taxa_juros)
str(taxa_juros)
?typeof #ajuda

total_cliente <- 500
typeof(clientes)
str(clientes)

faculdade <- "FATEC Votorantim"
str(faculdade)
x <- c(1, 2, 3, 4, 5)
x
y <- c(1:5)
y
z <- seq(1, 10, 2)
z
x[3]
y[3]
z[3]

vetor <- x> 1
vetor # retorna qual dos números da lista r é maior que 1

(sequencia <- c(x, "info", z))

#matriz

ml <- matrix(0, 2, 2)
ml
m <- matrix(1:4, 2, 2)
m
m[1, 2]
m[2,]
m[,1]

#lista
lista <- list("votorantim", x, "salto")
lista
str(lista)
View(lista)

#data frame

(alfabeto <- data.frame(letters,LETTERS))
View(alfabeto)
head
head(alfabeto)

#base dados

dados <- read.csv2("fustes.csv")
View(dados)
length(dados)

dap <- dados$dap
dap

#novo data frame
dados <- data.frame(
  id=1:6,
  sexo=factor(c("f", "m", "f", "f", "m", "m")),
  idade=c(20, 22, 23, 24, 25, 26)
)
View(dados)
str(dados)


dados$notas <- NULL
dados

dados$nota <- seq(1, 12, 2)
dados

summary(dados)
mean(dados$nota)
median(dados$nota)
sd(dados$nota)
var(dados$nota)
sqrt(sd(dados$nota))

#base nova
dados <- data.frame(
  id = 101:104,
  nome = c("Ana", "Bruno", "Carlos", "Diana"),
  sexo = c("F", "M", "M", "F"),
  idade = c(20, 22, 21, 23),
  horas_estudo = c(5, 2, 6, 4),
  nota = c(8.5, 6.0, 9.2, 7.8),
  aprovado = c(TRUE, FALSE, TRUE, FALSE)
)

View(dados)
summary(dados)
mean(dados, na.rm=TRUE)
median(dados$nota)
sd(dados$nota)
var(dados$nota)
sqrt(sd(dados$nota))


#frequencia
table(dados$sexo) #freq observada em relação ao sexo
prop.table(table(dados$sexo)) #freq relativa(proporção)
table(dados$sexo, dados$aprovado) # monta uma tabelinha

quantile(dados$nota)

#graficos
X11()
barplot(dados$nota)

hist(dados$nota, main="distribuição de notas", xlab="nota",
     ylab="frequencia")

#bloxplot
boxplot(dados$nota,
         main="distribuição notas",
         xlab="notas",
         ylab="frequencia",
         col="pink")

install.packages("dplyr")
library(dplyr)
