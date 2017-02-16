# TD3

data = ToothGrowth
head(data)
p = ggplot(data = data, aes(x = len, fill = supp))
p + geom_histogram(binwidth = 10)
p = p + geom_histogram(binwidth = 5)
p

g = p
g + facet_grid(~ supp)
g = g + facet_grid(factor(dose) ~ supp)
g

q = ggplot(data = data, aes(x = len))
q + geom_density()
q = ggplot(data = data, aes(x = len, color = supp))
q + geom_density()
q = ggplot(data = data, aes(x = len, fill = supp))
q = q + geom_density(alpha = 0.5)
q

l = ggplot(data = data, aes(x = len, color = supp, linetype = supp))
l = l + geom_line(stat = "density", size = 2)
l

# Numeric
k.n = ggplot(data = data, aes(x = dose, y = len))
k.n = k.n + geom_point()
# k.n + geom_boxplot() marche pas...

# Factor
k.f = ggplot(data = data, aes(x = factor(dose), y = len))
k.f + geom_point()
k.f = k.f + geom_boxplot()
k.f  # A box display min, Q1, Q2(median), Q3 and max

m = ggplot(data = data, aes(x = factor(dose), y = len))
m + geom_boxplot() + geom_point()
m + geom_boxplot() + geom_point(colour = "grey30")
m + geom_boxplot() + geom_point(colour = "red")
m + geom_boxplot() + geom_point(colour = "red", alpha = .5)
m + geom_boxplot() + geom_point(colour = "red", alpha = .5, position = position_itter())
m + geom_boxplot() + geom_point(colour = "red", alpha = .5, position = position_itter(w = .1))
