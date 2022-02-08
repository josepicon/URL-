install.packages('slam')
install.packages('tm')
install.packages('SnowballC')
install.packages('gmodels')
install.packages('wordcloud')
install.packages("e1071")

library(e1071)
library(caret)
library(tm)
library(SnowballC)
library(wordcloud)
library(gmodels)
library(wordcloud)

data = read.csv("https://raw.githubusercontent.com/stedy/Machine-Learning-with-R-datasets/master/sms_spam.csv", stringsAsFactors=F)
head(data, 10)

str(data)

# Proporción de clases
round(prop.table(table(data$type))*100, digits = 1)

# Establecemos el tipo de dato a factor
data$type = factor(data$type)

data_corpus <- VCorpus(VectorSource(data$text))
print(data_corpus)

# Esta transformación cambia todas las mayúsculas a minúsculas
data_corpus_clean <- tm_map(data_corpus, content_transformer(tolower))

# Visualización de la instancia antes y después de la transformación
print(lapply(data_corpus[[1]][1], as.character))
print(lapply(data_corpus_clean[[1]][1], as.character))

# Esta transformación retira números y palabras conectoras de lenguaje
data_corpus_clean <- tm_map(data_corpus_clean, removeNumbers) 
data_corpus_clean <- tm_map(data_corpus_clean, removeWords, stopwords())

# Visualización de la instancia antes y después de la transformación
print(lapply(data_corpus[[1]][1], as.character))
print(lapply(data_corpus_clean[[1]][1], as.character))

# Retira espacios y tabulaciones en el texto
data_corpus_clean <- tm_map(data_corpus_clean, stemDocument)

# Visualización de la instancia antes y después de la transformación
print(lapply(data_corpus[[1]][1], as.character))
print(lapply(data_corpus_clean[[1]][1], as.character))

# data_corpus_clean <- tm_map(data_corpus_clean, removePunctuation)
replacePunctuation <- function(x) {gsub("[[:punct:]]", " ", x)}
replacePunctuation('hello...world')

# sustituye puntuaciones por espacios
data_corpus_clean <- tm_map(data_corpus_clean, replacePunctuation)

# Visualización de la instancia antes y después de la transformación
print(lapply(data_corpus[[1]][1], as.character))
print(lapply(data_corpus_clean[[1]][1], as.character))

# retira el resto de espacios innecesarios
data_corpus_clean <- tm_map(data_corpus_clean, stripWhitespace)

# Visualización de la instancia antes y después de la transformación
print(lapply(data_corpus[[1]][1], as.character))
print(lapply(data_corpus_clean[[1]][1], as.character))

# convierte las instancias en documentos de texto sencillos. Este paso es necesario para el DocumentTermMatrix
data_corpus_clean <- tm_map(data_corpus_clean, PlainTextDocument)
print(lapply(data_corpus[[1]][1], as.character))
print(lapply(data_corpus_clean[[1]][1], as.character))

for (i in (1:6))
{
  print(paste0("Sms number ", i))
  print(lapply(data_corpus[[i]][1], as.character))
  print(lapply(data_corpus_clean[[i]][1], as.character))
}

dtm <- DocumentTermMatrix(data_corpus_clean)
dtm

str(dtm)

set.seed(24358)

# Creamos el data partition de la función caret con un 75 - 25 split
inTrain <- createDataPartition(y = data$type
                               , p = .75
                               , list = FALSE
                               , times = 1)
# Definitmos los datasets originales entre train y test
data.train<-data[inTrain,]
data.test<-data[-inTrain,]

# Revisamos el split
str(data.train)
str(data.test)

# Separamos el corpus según la clase
corpus.train = data_corpus_clean[inTrain]
corpus.test  = data_corpus_clean[-inTrain]

# Y finalmente el Document term matrix
dtm.train = dtm[inTrain, ]
dtm.test  = dtm[-inTrain, ]

# Comprobamos que el desbalanceo de clases es el adecuado
print("Training")
round(prop.table(table(data.train$type))*100, 2)
print("Test")
round(prop.table(table(data.test$type))*100, 2)

spam = subset(data.train, type == "spam")
ham  = subset(data.train, type == "ham")

wordcloud(data$text,
          min.freq=40) # look at words with at least 40 repetitions

freq_terms = findFreqTerms(dtm.train, 5)
freq_terms

freq_terms = findFreqTerms(dtm.train, 5)
reduced_dtm.train = DocumentTermMatrix(corpus.train, list(dictionary=freq_terms))
reduced_dtm.test =  DocumentTermMatrix(corpus.test, list(dictionary=freq_terms))

# have we reduced the number of features?
ncol(reduced_dtm.train)
ncol(reduced_dtm.test)

convert_counts = function(x) {
  x = ifelse(x > 0, 1, 0)
  x = factor(x, levels = c(0, 1), labels=c("No", "Yes"))
  return (x)
}

# apply() allows us to work either with rows or columns of a matrix.
# MARGIN = 1 is for rows, and 2 for columns
reduced_dtm.train = apply(reduced_dtm.train, MARGIN=2, convert_counts)
reduced_dtm.test  = apply(reduced_dtm.test, MARGIN=2, convert_counts)

# store our model in sms_classifier
sms_classifier = naiveBayes(reduced_dtm.train # Dataset de entrenamiento
                            , data.train$type) # Target de entrenamiento

sms_test.predicted = predict(sms_classifier,  # Predicciones utilizando el modelo creado con los datos de entrenamiento
                             reduced_dtm.test) # Generación de predicciones para el dataset de test

# Ahora sacamos el confusion matrix
confusionMatrix(sms_test.predicted, data.test$type)

# Hacemos una iteración para nuestro modelo en base a un factor i, siendo i el factor alpha en el laplace smoothing
for (i in (1:10))
{
  print(paste0("Laplace factor of ", as.character((i-1)/4)))
  sms_classifier2 = naiveBayes(reduced_dtm.train, 
                               data.train$type,
                               laplace = (i-1)/4)
  
  sms_test.predicted2 = predict(sms_classifier2,
                                reduced_dtm.test)
  
  print(confusionMatrix(sms_test.predicted2, data.test$type))
}
