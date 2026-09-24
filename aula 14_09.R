# ==============================================================================
# AULA: ESTATÍSTICA BÁSICA NO R
# ==============================================================================
# PARTE 1: PRIMEIROS PASSOS, ATRIBUIÇÃO E TIPOS
# ==============================================================================

# No R, o operador canônico de atribuição é <-
# No RStudio: Alt + -
x <- 42
x

# Tipos básicos
taxa_juros <- 0.1375
typeof(taxa_juros)
class(taxa_juros)

total_clientes <- 500L
typeof(total_clientes)
is.numeric(total_clientes)

nome_aluno <- "FATEC Votorantim"
typeof(nome_aluno)

tem_fraude <- TRUE
is_ativo <- FALSE
typeof(tem_fraude)

# TRUE e FALSE podem participar de operações numéricas
sum(c(TRUE, FALSE, TRUE, TRUE))
mean(c(TRUE, FALSE, TRUE, TRUE))


# ==============================================================================
# PARTE 2: VALORES ESPECIAIS E VETORES
# ==============================================================================

# Valores especiais
dado_faltante <- NA
calculo_invalido <- 0 / 0
limite_superior <- 1 / 0
objeto_vazio <- NULL

is.na(dado_faltante)
is.nan(calculo_invalido)
is.infinite(limite_superior)
is.null(objeto_vazio)

# NA se propaga em muitos cálculos
idade <- c(22, 28, NA, 35)

mean(idade)
mean(idade, na.rm = TRUE)

# Quantidade de valores ausentes
sum(is.na(idade))


# Vetores
vetor_numerico <- c(10.5, 20.2, 30.8)
vetor_texto <- c("Python", "R", "SQL")
vetor_logico <- c(TRUE, FALSE, TRUE)

vetor_numerico

# Indexação: o R começa em 1
vetor_numerico[1]
vetor_numerico[c(1, 3)]
vetor_numerico[-2]

# Filtro lógico
vetor_numerico[vetor_numerico > 15]

# Sequências
1:5
seq(0, 10, by = 2)


# Coerção implícita
mistura_1 <- c(TRUE, 5L, FALSE)
typeof(mistura_1)

mistura_2 <- c(10.5, "texto", TRUE)
typeof(mistura_2)

# Coerção explícita
as.numeric(c("10", "20", "30"))
as.character(c(1, 2, 3))
as.logical(c(0, 1, 1, 0))


# ==============================================================================
# PARTE 3: FATORES, LISTAS E DATA FRAMES
# ==============================================================================

# Fator nominal
cidades <- factor(c("Sorocaba", "Votorantim", "Itu", "Votorantim"))
cidades
levels(cidades)

# Fator ordinal
nivel_senioridade <- factor(
  c("Junior", "Senior", "Pleno", "Junior"),
  levels = c("Junior", "Pleno", "Senior"),
  ordered = TRUE
)

nivel_senioridade
nivel_senioridade[1] < nivel_senioridade[2]


# Listas: podem reunir objetos de tipos diferentes
perfil <- list(
  ip = "192.168.1.100",
  portas = c(80, 443, 8080),
  em_producao = TRUE,
  uso_memoria = c(65.2, 70.1, 68.4)
)

perfil$ip
perfil[[2]]
perfil[[2]][1]


# Data frame: principal estrutura tabular desta aula
dataset_alunos <- data.frame(
  id = 101:104,
  nome = c("Ana", "Bruno", "Carlos", "Diana"),
  nota_p1 = c(8.5, 6.0, 9.2, 7.8),
  aprovado_lab = c(TRUE, FALSE, TRUE, TRUE)
)

dataset_alunos

# Inspeção inicial
str(dataset_alunos)
summary(dataset_alunos)
dim(dataset_alunos)
nrow(dataset_alunos)
ncol(dataset_alunos)
names(dataset_alunos)

# Acessando uma coluna
dataset_alunos$nota_p1

# Criando uma nova coluna
dataset_alunos$nota_ponderada <- dataset_alunos$nota_p1 * 1.2
dataset_alunos


# ==============================================================================
# PARTE 4: IMPORTAÇÃO E EXPLORAÇÃO DE DADOS
# ==============================================================================

# Para uma base CSV local:
# dados <- read.csv2("dados.csv")

# Exemplos úteis após importar
# head(dados)
# tail(dados)
# str(dados)
# summary(dados)
# dim(dados)
# names(dados)

# Exemplo prático com uma base pequena criada no próprio R.
# Ela será usada no restante da aula para manter uma única linha de análise.

dados <- data.frame(
  id = 1:12,
  sexo = factor(c("F", "M", "F", "F", "M", "M", "F", "M", "F", "M", "F", "M")),
  idade = c(20, 22, 21, 24, 23, 25, 20, 27, 22, 26, 21, 24),
  horas_estudo = c(5, 2, 6, 4, 3, 7, 5, 1, 6, 4, 8, 2),
  nota = c(8.5, 6.0, 9.0, 7.0, 6.5, 9.2, 8.0, 5.5, 9.5, 7.2, 10.0, NA),
  aprovado = c(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE,
               TRUE, TRUE, TRUE, FALSE)
)

# Visualizar
dados

# Estrutura
str(dados)

# Primeiras e últimas observações
head(dados)
tail(dados)

# Dimensões e nomes
dim(dados)
nrow(dados)
ncol(dados)
names(dados)


# ==============================================================================
# PARTE 5: DADOS AUSENTES E FREQUÊNCIAS
# ==============================================================================

# Quantidade total de valores ausentes
sum(is.na(dados))

# Quantidade de NA por coluna
colSums(is.na(dados))

# Localizar as linhas com nota ausente
dados[is.na(dados$nota), ]

# Média ignorando NA
mean(dados$nota, na.rm = TRUE)

# ------------------------------------------------------------------------------

# Frequência absoluta de sexo
table(dados$sexo)

# Frequência relativa
prop.table(table(dados$sexo))

# Frequência absoluta de aprovação
table(dados$aprovado)

# Frequência relativa de aprovação
prop.table(table(dados$aprovado))

# Tabela de dupla entrada
table(dados$sexo, dados$aprovado)

# Proporções por sexo
prop.table(table(dados$sexo, dados$aprovado), margin = 1)


# ==============================================================================
# PARTE 6: TENDÊNCIA CENTRAL
# ==============================================================================

# Criamos um vetor de notas válidas para facilitar alguns cálculos
notas <- dados$nota[!is.na(dados$nota)]
notas

# Média
mean(notas)

# Mediana
median(notas)

# Moda
# O R não possui uma função base simples chamada mode() para a moda estatística.
# table() mostra a frequência de cada valor.
table(notas)

# Exemplo de efeito de valor extremo
x <- c(10, 10, 11, 12, 100)

mean(x)
median(x)

# Interpretação:
# a média foi fortemente influenciada pelo 100,
# enquanto a mediana permaneceu mais próxima do centro dos dados.


# ==============================================================================
# PARTE 7: DISPERSÃO, QUARTIS, PERCENTIS E IQR
# ==============================================================================

# Amplitude
range(notas)
diff(range(notas))

# Variância
var(notas)

# Desvio padrão
sd(notas)

# Quartis
quantile(notas)

# Quartis específicos
quantile(notas, 0.25)  # Q1
quantile(notas, 0.50)  # Mediana
quantile(notas, 0.75)  # Q3

# Percentis
quantile(notas, 0.10)
quantile(notas, 0.90)

# Intervalo interquartil (IQR)
IQR(notas)

# Regra básica para outliers no boxplot:
# limite inferior = Q1 - 1.5 * IQR
# limite superior = Q3 + 1.5 * IQR
Q1 <- quantile(notas, 0.25)
Q3 <- quantile(notas, 0.75)
IQR_nota <- IQR(notas)

limite_inferior <- Q1 - 1.5 * IQR_nota
limite_superior <- Q3 + 1.5 * IQR_nota

limite_inferior
limite_superior

notas[notas < limite_inferior | notas > limite_superior]


# ==============================================================================
# PARTE 8: VISUALIZAÇÃO DE DADOS
# ==============================================================================

# Histograma
hist(
  dados$nota,
  main = "Distribuição das notas",
  xlab = "Nota",
  ylab = "Frequência"
)

# Boxplot
boxplot(
  dados$nota,
  main = "Boxplot das notas",
  ylab = "Nota"
)

# Gráfico de dispersão: horas de estudo x nota
plot(
  dados$horas_estudo,
  dados$nota,
  main = "Horas de estudo x Nota",
  xlab = "Horas de estudo",
  ylab = "Nota"
)

# Boxplot por sexo
boxplot(
  nota ~ sexo,
  data = dados,
  main = "Distribuição das notas por sexo",
  xlab = "Sexo",
  ylab = "Nota"
)

# ------------------------------------------------------------------------------

# Perguntas para discussão com a turma:
# 1) Onde está a maior concentração de notas?
# 2) Há assimetria?
# 3) Existem valores extremos?
# 4) Qual variável parece estar associada à nota?
# 5) O que o gráfico mostra que uma única média não mostra?


# ==============================================================================
# PARTE 9: CORRELAÇÃO
# ==============================================================================

# Para correlação, precisamos de pares completos
cor(
  dados$horas_estudo,
  dados$nota,
  use = "complete.obs"
)

# Interpretando:
# próximo de +1 -> associação linear positiva forte
# próximo de  0 -> pouca associação linear
# próximo de -1 -> associação linear negativa forte

# Atenção:
# correlação mede associação linear; não prova causalidade.


# ==============================================================================
# PARTE 10: TESTE t DE UMA AMOSTRA
# ==============================================================================

# Pergunta:
# "A média das notas é diferente de 7?"

resultado_t <- t.test(
  dados$nota,
  mu = 7
)

resultado_t

# Alguns elementos do resultado
resultado_t$statistic
resultado_t$p.value
resultado_t$conf.int
resultado_t$estimate

# Regra prática para a interpretação introdutória:
# p < 0.05  -> evidência contra H0
# p >= 0.05 -> não há evidência suficiente contra H0

# IMPORTANTE:
# o p-valor não mede o tamanho do efeito e não "prova" H0 ou H1.


# ==============================================================================
# PARTE 11: FUNÇÕES MUITO ÚTEIS PARA UMA PRIMEIRA ANÁLISE
# ==============================================================================

# Estrutura
str(dados)

# Resumo
summary(dados)

# Visualização de tabela
View(dados)

# Primeiras e últimas linhas
head(dados)
tail(dados)

# Dimensões
dim(dados)
nrow(dados)
ncol(dados)

# Comprimento de vetor
length(notas)

# Classe
class(dados)
class(dados$nota)


# ==============================================================================
# PARTE 12: EXERCÍCIO INTEGRADOR (30-40 MINUTOS)
# ==============================================================================

# DESAFIO
#
# Use o objeto 'dados' criado acima e faça uma análise completa:
#
# 1. Mostre a estrutura da base.
# 2. Descubra quantas linhas e colunas existem.
# 3. Verifique se há valores ausentes.
# 4. Calcule a média e a mediana das notas.
# 5. Calcule o desvio padrão.
# 6. Encontre Q1 e Q3.
# 7. Calcule o IQR.
# 8. Faça uma tabela de frequência para sexo.
# 9. Faça um histograma das notas.
# 10. Faça um boxplot das notas.
# 11. Faça um gráfico de dispersão entre horas de estudo e nota.
# 12. Calcule a correlação entre horas de estudo e nota.
# 13. Faça um teste t comparando a média com 7.
# 14. Escreva 3 frases interpretando os resultados.
#
# ------------------------------------------------------------------------------

# SOLUÇÃO-GUIA

str(dados)
dim(dados)

sum(is.na(dados))
colSums(is.na(dados))

media_nota <- mean(dados$nota, na.rm = TRUE)
mediana_nota <- median(dados$nota, na.rm = TRUE)
desvio_nota <- sd(dados$nota, na.rm = TRUE)

Q1 <- quantile(dados$nota, 0.25, na.rm = TRUE)
Q3 <- quantile(dados$nota, 0.75, na.rm = TRUE)
IQR_nota <- IQR(dados$nota, na.rm = TRUE)

media_nota
mediana_nota
desvio_nota
Q1
Q3
IQR_nota

table(dados$sexo)
prop.table(table(dados$sexo))

hist(dados$nota, main = "Distribuição das notas", xlab = "Nota")
boxplot(dados$nota, main = "Boxplot das notas", ylab = "Nota")
plot(
  dados$horas_estudo,
  dados$nota,
  main = "Horas de estudo x Nota",
  xlab = "Horas de estudo",
  ylab = "Nota"
)

cor(
  dados$horas_estudo,
  dados$nota,
  use = "complete.obs"
)

t.test(dados$nota, mu = 7)


# ==============================================================================
# ENCERRAMENTO - CHECKLIST DA AULA
# ==============================================================================

# Antes de finalizar uma análise, pergunte:
#
# [ ] Qual é a unidade de observação?
# [ ] Quais são as variáveis?
# [ ] Quais são quantitativas e qualitativas?
# [ ] Existem dados ausentes?
# [ ] Qual é a medida de tendência central mais adequada?
# [ ] Como está a dispersão?
# [ ] Há possíveis outliers?
# [ ] O gráfico confirma o que os números sugerem?
# [ ] Existe associação entre variáveis?
# [ ] O teste estatístico responde à pergunta formulada?
# [ ] Como interpretar o resultado em linguagem estatística?
#
# IDEIA CENTRAL:
# O R é a ferramenta. A estatística orienta a pergunta e a interpretação.
# ==============================================================================

