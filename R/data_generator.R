# set up working directory 

setwd("~/Desktop/weclouddata/data")

library(tidyverse)
set.seed(82)
x1 = rnorm(1000)           # some continuous variables 
x2 = rnorm(1000)
z = 1 + 2*x1 + 3*x2        # linear combination with a bias
pr = 1/(1+exp(-z))         # pass through an inv-logit function
y = rbinom(1000,1,pr)      # bernoulli response variable


## Sampling 

user <- read.csv("user_table.csv")
user$channel <- as.character(user$channel)
user$experiment <- c(rep(0, 10000), rep(1, 6000))
user$click <- c(rbinom(10000, 1, 0.03), rbinom(6000, 1, 0.06))


model1 <- glm(click ~ city + tenure + channel + experiment, family = binomial, data = user)
summary(model1)


write_csv(user, "experimental_data.csv")

