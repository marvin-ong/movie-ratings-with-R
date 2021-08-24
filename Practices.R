
getwd()

movies <- read.csv("P2-Movie-Ratings.csv")
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(movies)
str(movies)

movies$Year <- factor(movies$Year)
summary(movies)

#-------------------------Aesthetics
library(ggplot2)

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) + 
  geom_point()

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                        colour=Genre, size=BudgetMillions)) + 
  geom_point()


p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             colour=Genre, size=BudgetMillions))

p + geom_line() + geom_point()

p + geom_point(aes(colour=BudgetMillions))

p +  geom_point(aes(x=BudgetMillions)) +
  xlab("Budget Millions $$$")

#-------------------------Mapping & Setting
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

# 1. Mapping
r + geom_point(aes(colour=Genre))

# 2. Setting
r + geom_point(colour="DarkGreen")
# Error
# r + geom_point(aes(colour="DarkGreen"))

# 1. Mapping
r + geom_point(aes(size=BudgetMillions))

# 2. Setting
r + geom_point(size=5)
# Error
r + geom_point(aes(size=5))
 
 #------------------------- Histograms and Density Charts
s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth=10, aes(fill=Genre))
s + geom_histogram(binwidth=10, aes(fill=Genre), colour="black")

# Density Charts
s + geom_density(aes(fill=Genre),position="stack")


#------------------------- Statisctial Transformation
u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
u + geom_point() + geom_smooth(fill=NA)

# Boxplot

t <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
                             colour=Genre))
t + geom_boxplot() 
t + geom_boxplot(size=1.2) + geom_jitter()
t + geom_jitter() + geom_boxplot(size=1.2, alpha = 0.5)


#-------------------------Facets

v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

v + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
  facet_grid(Genre~., scale="free")

v + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
  facet_grid(.~Genre, scale="free")

# scatterplot
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
w + geom_point(size=3) 

# Facet
w + geom_point(size=3) + facet_grid(Genre~.)
w + geom_point(size=3) + facet_grid(.~Year)
w + geom_point(size=3) + facet_grid(Genre~Year) 
w + geom_point(size=2) + geom_smooth() + facet_grid(Genre~Year) 
w + geom_point(aes(size=BudgetMillions)) +
   geom_smooth() + facet_grid(Genre~Year)

#------------------------- Coordinates
m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             size=BudgetMillions, colour=Genre))
m + geom_point() 
+ xlim(50,100) + ylim(50,100) #Won't always work

# Example of why won't always work
n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth=10, aes(fill=Genre),colour="Black") +
  ylim(0,50)

# Instead, zoom:
n + geom_histogram(binwidth=10, aes(fill=Genre),colour="Black") +
  coord_cartesian(ylim=c(0,50))

w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() + facet_grid(Genre~Year) + 
  coord_cartesian(ylim=c(0,100))


#------------------------- Theme
o <- ggplot(data=movies, aes(x=BudgetMillions))

h <- o + geom_histogram(binwidth=10, aes(fill=Genre),colour="Black")

h + xlab("Money Axis") + ylab("Number of Movies") + 
  ggtitle("Movie Budget Distribution") + 
  theme(axis.title.x = element_text(size=20, colour="DarkGreen"),
        axis.title.y = element_text(size=20, colour="DarkGreen"),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15),
        
        legend.title = element_text(size=20),
        legend.text = element_text(size=15),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(size=25, 
                                  colour="Darkblue",
                                  family="Courier"))


