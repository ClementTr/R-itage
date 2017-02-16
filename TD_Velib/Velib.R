# PACKAGES
install.packages("ggmap")
install.packages("ggplot2")
# LIBARARIES
library(stringr)
library(ggmap)


Velib <- read.csv("~/R/ESME/TD3/Velib.csv", sep=";")
head(Velib)

# FIND X Position
x = strsplit(as.character(Velib$position), ",")
x = sapply(x, "[", 1)
x = factor(x)
Velib$positionX = x 

# FIND Y Position
y = strsplit(as.character(Velib$position), ",")
y = sapply(y, "[", 2)
y = factor(y)
Velib$positionY = y 

Velib$postcode = str_extract(Velib$address, "[0-9]{5}")
str_extract_all(Velib$address, "[0-9]+")

parisVelib = data.frame(
  id = Velib$number,
  codepostal = Velib$postcode,
  x = Velib$positionX,
  y = Velib$positionY
)

parisVelib = subset(parisVelib, substr(codepostal, 1, 2) == 75)
parisVelib$arrdt = factor(substr(parisVelib$codepostal, 4, 5))
names(parisVelib) = c("id", "codepostal", "lat", "lon", "arrdt")
head(parisVelib)


# Ne fonctionne pas
#hdf = get_map(location = c(2.35, 48.85), zoom = 12)
#draw <- ggmap(hdf, extent = "device")
#draw <- draw + geom_point(data = parisVelib, aes(x = x, y = y, alpha = .5, size = 1))

install.packages("leaflet")
library(leaflet)
IDFmap = leaflet() %>%
  addTiles() %>%
  setView(2.35, 48.85, zoom = 12) %>%
  addCircleMarkers(parisVelib$lon, parisVelib$lat,
                   radius = 1, 
                   clusterOptions = markerClusterOptions())
IDFmap

