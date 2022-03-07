library("tidyr")
library("dplyr")
library("vegan")

data = read.csv("https://raw.githubusercontent.com/josepicon/R-Course/main/MD004/customer_churn_data.csv", stringsAsFactors=F)
head(data, 5)

#checking the contents of the data 
str(data)

summary(data)


data  %>% 
  group_by(device)  %>% 
  summarize(user_id = n())


