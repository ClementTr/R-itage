beers <- read.csv("~/R/ESME/2.Beer/beer_reviews.csv")
# beers <- fread("~/R/TD2/beer_reviews.csv")
beers <- data.table(beers) #data.table entièrement compatible avec data.frame
names(beers)

length(unique(beers$beer_beerid))
dim(beers[review_profilename == "stcules",])
length(unique(beers[review_profilename == "oline73",]$beer_beerid))
beers[, length(unique(beer_beerid)), by = "review_profilename"]
summary(beers[, length(unique(beer_beerid)), by = "review_profilename"]$V1)

beers[review_overall < 1 &
      beer_style %in% c("Czech Pilsener","German Pilsener")]
setkey(beers, "beer_beerid")
# Création variable en data.tabe 
# Travail par référence et non pas par copie comme avec le beers$z = ...
# Donc beaucoup plus rapide
beers[, orating := review_overall < 3.5]
# Prendre réflexe de travailler sur la data.table parce qu'il se passe rien
# sur la data.frame
beers

#rm(list=ls())
