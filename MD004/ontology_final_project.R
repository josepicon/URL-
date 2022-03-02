#nstall.packages('hrbrthemes')
#install.packages('dplyr')
#install.packages('ggplot2')

library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(stringr)


#cargando los datos 
uni = read.csv("https://raw.githubusercontent.com/josepicon/R-Course/main/subjects%20(1).csv", stringsAsFactors=F)
head(uni, 10)

#¿Cuantas clases imparte se impartan a las 12am?

print(
  paste0(
    "Número de clases con 12:00AM values: "
    , count(subset(uni
                   , schedule == "12:00 AM"))))

#reemplazando las clases de las 12:00am por las 12pm
uni$schedule <- str_replace(uni$schedule, "12:00 AM","12:00 PM")

print(
  paste0(
    "Nuevo - Número de clases con null values: "
    , count(subset(uni
                   , schedule == "12:00 AM"))))

#classes imparten a las 12:00pm, con respectiva materia, profesor, numero de alumnos y universidad que ofrece la clase
twelvepmclases <- uni %>% filter(schedule == '12:00 PM' )
newdf <- data.frame(twelvepmclases$Professor,twelvepmclases$Subject,twelvepmclases$students, twelvepmclases$School)
head(newdf,20)

s <- ggplot(newdf, aes(x= reorder(newdf$twelvepmclases.Subject,desc(newdf$twelvepmclases.Subject)), y=newdf$twelvepmclases.Subject)) + 
  geom_bar(stat = "identity") + 
  coord_flip()
s + ggtitle("Asignaturas Ofrecidas a las 12PM - Todas las Universidades") + xlab("Subject") + ylab("Number of classes")
  

#revisar los datos de la población de estudiantes
students <- uni['students']
summary(students)
#el tamaño promedio del aula para la población en el conjunto de datos es de 35 estudiantes, el máximo es 59 y el más pequeño es 12


#tracemos estos hallazgos en un gráfico de densidad
splot <- students %>%
  ggplot(aes(x=students)) +
  geom_density(fill="#69b3a2", color="#e9ecef", alpha=0.8) +
  ggtitle("Class Size Distribution for All Universities") +
  theme_ipsum()

splot

#exploremos los mismos datos solo con las universidades de la liga ivy

#crear una lista de escuelas de la liga ivy para identificarlas en nuestro conjunto de datos
ivyleauge_schools <- list('Brown University', 'Columbia University', 'Cornell University', 'Dartmouth College', 'Harvard University', 'University of Pennsylvania', 'Princeton University', 'Yale University')

#extrayendo la información de las filas en nuestra base de datos "uni" que contienen nombres de nuestra lista ivyleauge_schools que creamos
ivy <- uni %>% filter(School == ivyleauge_schools)
head(ivy,10)

#explorar la información sobre el tamaño de la clase de los estudiantes de sus datos de Ivy League
summary(ivy$students)

#trazar esta información en un gráfico de densidad
istudents <-ivy['students']
ics <- unlist(ivy$students)
ivplot <- istudents %>%
  ggplot(aes(x=ics)) +
  geom_density(fill="#69b3a2", color="#e9ecef", alpha=0.8) +
  ggtitle("Class Size Distribution at Ivy Leauge Colleges") +
  theme_ipsum()
ivplot

#male + Female: All Universities 
prop_all <- uni %>%
  summarize(pctmales = sum(uni$gender =='Male') / length(uni$gender) * 100,
            pct.female = sum(uni$gender =='Female') / length(uni$gender) * 100)
prop_all

#male + Female: Ivy Leauge
prop_ivy <- ivy %>%
  summarize(pctmales = sum(ivy$gender =='Male') / length(ivy$gender) * 100,
            pct.female = sum(ivy$gender =='Female') / length(ivy$gender) * 100)
prop_ivy

#piechart de proporción de hombres/mujeres - todas las universidades

data <- data.frame(
  group = c("male", "female"), 
  value = c(50,50)
)
ggplot(data, aes(x="", y=value, fill=group)) +
  geom_bar(stat="identity", width=1, color = "white") +
  coord_polar("y", start=0) + 
  ggtitle("% Male v Female: All Universities") + 
  theme_void()

#piechart de proporción de hombres/mujeres - ivy leauge 

pieivy <- data.frame(
  value2 = c(53,47),
  group = c("male", "female")
)
ggplot(pieivy, aes(x="", y=value2, fill=group)) +
  geom_bar(stat="identity", width=1, color = "white") +
  coord_polar("y", start=0) + 
  ggtitle("% Male v Female: Ivy Leauge Colleges") + 
  theme_void()


#Qué profesores tienen menos alumnos matriculados?
total_students <- aggregate(x=uni$students, 
          by = list(uni$Professor), 
          FUN = sum
)
order_total <- total_students[order(total_students$x),]

head(order_total,10)

#Qué profesores tienen menos alumnos matriculados? - ivy leauge
total_students_ivy <- aggregate(x=ivy$students, 
                            by = list(ivy$Professor), 
                            FUN = sum
)
order_total_ivy <- total_students_ivy[order(total_students_ivy$x),]
head(order_total_ivy,10)


#Qué profesores tienen menos alumnos matriculados? - stanford 

stanford <- uni %>% filter(School == 'Stanford University' )
head(stanford,10)
total_students_stanford <- aggregate(x=stanford$students, 
                                by = list(stanford$Professor), 
                                FUN = sum
)
order_total_stanford <- total_students_stanford[order(total_students_stanford$x),]
head(order_total_stanford,10)

sstudents <- stanford['students']
dfc <- unlist(stanford$students)
sstudents %>%
  ggplot(aes(x=dfc)) +
  geom_density(fill="#69b3a2", color="#e9ecef", alpha=0.8) +
  ggtitle("Class Size Distribution at Stanford University") +
  theme_ipsum()

