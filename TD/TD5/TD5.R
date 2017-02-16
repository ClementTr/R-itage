library(data.table)
library(reshape2)
library(ggplot2)

beers <- read.csv("~/R/ESME/TD2/beer_reviews.csv")
beers <- fread("~/R/ESME/TD2/beer_reviews.csv")
names(beers)

#### Corrélations et pondérations ####
# On s'intéresse à 4 colonnes
# PALATE/TASTE/AROME (goût) + APPARENCE 
head(beers[, c(5,6,9,10)])

# On utilise les 4 variables en même temps pour ne pas perdre la
# notion de corélation.
# PC1 sera les poids des lambda1, 2, 3, 4 pour l'arome (colonne 5)
# C'est la colonne qui se rapproche le plus de 1.
prcomp(beers[, c(5,6,9,10)])
pca = prcomp(beers[, c(5,6,9,10)])

# On récupère donc que la première colonne
pca$rotation[,1]

# Ici on multplie chacune de nos colonnes par son lamdba (poids)
# Et on créé une nouvelle colonne review 
head(as.matrix(beers[, c(5,6,9,10)]) %*% pca$rotation[,1])
beers = beers[, review := as.matrix(beers[, c(5,6,9,10)]) %*% pca$rotation[,1]]

# On calcule la corrélation entre nos deux variables qui se rapproche 
# assez de 1 pour faire des conclusions 
cor(beers$review_overall, beers$review)

# Pour tracer un graphique, on peut prendre simplement un échantillon de nos données
# .N représente la taille de nos données, ici, on prend un échantillon de 10%
echantillon_beers = beers[sample(.N, .N*.1)]
head(echantillon_beers)
echantillon_beers = melt(echantillon_beers[, c(5,6,9,10)], measure.vars = 1:4)
head(echantillon_beers)
p <- ggplot(data = echantillon_beers, aes(x = value))
p + geom_histogram(binwidth = 1) + facet_wrap(~ variable, nrow = 2)
