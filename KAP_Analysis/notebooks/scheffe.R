setwd("C:/Users/Carol/Documents/EPA_2020_2021/Thesis/Analysis/KAP_Analysis/")

install.packages("car")
install.packages("DescTools")
library(car)
library(DescTools)


data <- read.csv("data/interim/kap_data_sd_r.csv")

boxplot(post.mean.k_pc ~ age,
        data = data,
        main = "KAP #2 Survey Scores by Age Group",
        xlab = "Age Group",
        ylab = "KAP #2 Survey Scores",
        col = "steelblue",
        border = "black")


#fit the one-way ANOVA model
model <- aov(post.mean.k_pc~pre.mean.k_pc+age, data=data)
model <- aov(post.mean.k_pc~age, data=data)

Anova(model, type="III")

#perform Scheffe's test
ScheffeTest(model)

model
