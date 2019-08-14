


setwd("/Users/victorhuangkk/Desktop/weclouddata/data")


set.seed(82)
x1 = rnorm(1000)           # some continuous variables 
x2 = rnorm(1000)
z = 1 + 2*x1 + 3*x2        # linear combination with a bias
pr = 1/(1+exp(-z))         # pass through an inv-logit function
y = rbinom(1000,1,pr)      # bernoulli response variable


## Sampling 

user <- read.csv("user_table.csv")

user$click <- rbinom(16000, 1, 0.03)
user$experiment <- rbinom(16000, 1, 0.33)

opu1 <- user$opu_6_week[user$experiment == 1, ]



384772 + 1351639 + 954 + 1733 + 19031 + 273
