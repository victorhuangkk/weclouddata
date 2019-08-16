# set up working directory 

setwd("~/Desktop/weclouddata/data")

# use 



user <- read.csv("user_table.csv")
user$channel <- as.character(user$channel)
user$experiment <- c(rep(0, 10000), rep(1, 6000))
user$click <- c(rbinom(10000, 1, 0.03), rbinom(6000, 1, 0.06))



# Binomial check the model
model1 <- glm(click ~ city + tenure + channel + experiment, family = binomial, data = user)
summary(model1)


# write_csv(user, "experimental_data.csv")

