# birthwt.r

library(MASS)
data(birthwt)

# Poids en livres
birthwt$lwtKilos = birthwt$lwt/2.2

# Recoder variables en facteur
birthwt$race = factor(birthwt$race, levels = 1:3, c("w","b","o"))
#birthwt$race[birthwt$race == 1] = "w"
#birthwt$race[birthwt$race == 2] = "b"
#birthwt$race[birthwt$race == 3] = "o"
table(birthwt$race)

# Evenement positifs ht et ui séparément
table(birthwt$ht)
sum(birthwt$ht)
table(birthwt$ui)
sum(birthwt$ui)

# Evenement positifs ht et ui ensemble
sum(birthwt$ui[birthwt$ht==1])

# Poids inférieur à 55 kilos et ht = 1
sum(birthwt$ht[birthwt$lwtKilos<55])

