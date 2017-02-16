library(MASS)
data(birthwt)
str(birthwt)

mean_sd = function(x){
  c(mean(x), sd(x))
}
  
aggregate(bwt ~ ui, data = birthwt, mean)
aggregate(bwt ~ ui, data = birthwt, mean_sd)
aggregate(bwt ~ ui + ht, data = birthwt, mean_sd)

d <- data.frame(x = rnorm(1e6),
                g = sample(c(0,1), 1e6, replace = TRUE))
dim(d)
format(object.size(d), "Mb")
str(d)

aggregate(x ~ g, d, mean)
system.time(aggregate(x ~ g, d, mean)) 

library(plyr)
ddply(d, "g", summarise, mean(x))
system.time(ddply(d, "g", summarise, mean(x)))

r = ddply(d, "g", summarise, m = mean(x), s = sd(x))
r$s
str(r)
head(d)
#d$z = sample(letters[1:3], 1e6, replace=TRUE) #prends a,b,c par défaut
d$z = sample(c("Giroud","Ozil","Sanchez"), 1e6, replace=TRUE)
r

d$y = rnorm(1e6)
r = ddply(d, c("g","z"), summarise, mx = mean(x), my = sd(y))
r

data(birthwt, package = "MASS")
yesno <- c("No", "Yes")
birthwt <- mutate(birthwt, 
                  ht = factor(ht, labels = yesno),
                  ui = factor(ui, labels = yesno))


labs <- c("w", "b", "o")
birthwt <- mutate(birthwt, race=factor(race, labels=labs))
f <- function(d){
  lm(bwt ~ lwt, data = d)
} 
m <- dlply(birthwt, "race", f)
ldply(m, coef)
m

#install.packages("dplyr")
library(dplyr)
tbl_df(birthwt)
birthwt = tbl_df(birthwt)
str(birthwt)
class(birthwt)
group_by(birthwt, race)
summarise(group_by(birthwt, race), x = mean(bwt))
summarise(group_by(birthwt, race, ui), x = mean(bwt))
summarise(group_by(birthwt, race, ui, ht), x = mean(bwt))
dim(d)
aggregate(x ~ g + z, d, mean) 
system.time(aggregate(x ~ g + z, d, mean))
dt = tbl_df(d)
system.time(summarize(group_by(dt, g, z), mean(x)))

detach(package: dplyr)
detach(package: plyr)

install.packages("data.table")
library(data.table)

#rm(list = ls())