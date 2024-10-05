#install.packages("ggplot2")
#install.packages("data.table")

library(ggplot2)
library(data.table)

df <- fread("C:/Users/user/OneDrive/Desktop/Materials/R/Project/Economist_Assignment_Data.csv",drop=1)

#print(head(df))

pl <- ggplot(df, aes(x=CPI,y=HDI,color = Region)) +
  
  geom_point(shape= 1,
             size= 4) +
  
  geom_smooth(aes(group=1),
              method = 'lm',
              formula = y ~ log(x),
              se = F,
              color = 'red')

#print(pl + geom_text(aes(label=Country)))

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

print(pl +
        geom_text(aes(label = Country),
                       color = "gray20", 
                       data = subset(df, Country %in% pointsToLabel),
                       check_overlap = TRUE) +
        
        theme_bw() +
        
        scale_x_continuous(name = 'Corruption Perception Index, 2011 (10 = least corrupt)',
                           limits = c(1,10),
                           breaks = 1:10) +
        
        scale_y_continuous(name = 'Human Development Index, 2011 (1 = Best)',
                     limits = c(0.2,1.0)) +
        
        ggtitle("Corruption and Human development"))