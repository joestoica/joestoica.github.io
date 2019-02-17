library(tidyverse)
library(ggthemes)
library(extrafont)

year = rep(c(2009, 2010, 2015, 2017),2)
percent = c(0.32, 0.42, 0.58, 0.76, 0.18, 0.2, 0.4, 0.37)
percentsign = c("32%",
                "42%",
                "58%",
                "76%",
                "18%", 
                "20%",
                "40%", 
                "37%")
party = c(rep("dem", 4), rep("rep", 4))

df <- data.frame(year, percent, party, percentsign)

grey = ggthemes_data$fivethirtyeight["ltgray"]
dems = df %>% filter(party == "dem")
reps = df %>% filter(party == "rep")

(plot <- ggplot(df, aes(year, percent, color = party))+
    geom_label(data = dems, aes(label = percentsign), vjust = -1, 
               label.size = NA, fill = grey, fontface = "bold") +
    geom_label(data = reps, aes(label = percentsign), vjust = 2, 
               label.size = NA, fill = grey, fontface = "bold") +
    geom_line(size = 1)+
    geom_point(size = 6, color = grey) +
    geom_point(size = 5)+
    theme_fivethirtyeight()+
    theme(text = element_text(family =  "Tahoma"),
          plot.title = element_text(size = 16, hjust = -0.19), 
          plot.subtitle = element_text(size = 14, hjust = -0.23),
          axis.text = element_text(color = "#9B9B9B", size = 10),
          plot.caption = element_text(color = "#9B9B9B"))+
    scale_x_continuous(breaks = seq(2009, 2017, 1), 
                       labels = c("2009", "'10", "'11", "'12", "'13", "'14", "'15", "'16", "'17"))+
    scale_y_continuous(labels = c("0", "20", "40", "60", "80%"), limits = c(0, 0.85))+
    scale_color_manual(values = c("#1790D2", "#FC2B1C")) +
    guides(color = FALSE)+
    geom_hline(yintercept = 0, size = 0.3) + 
    labs(title = "Democrats express more concern about racism",
         subtitle = "Share who consider racism a \"big problem\" by party identification",
         caption = "FiveThirtyEight | Source: Pew Research Center")+
    geom_label(label = "Democrat/\nLeans Democrat", 
               label.size = NA, x = 2013.9, y = 0.62, fill = grey, color = "black", hjust = 1, size = 4, family = "Tahoma", fontface = "bold") +
    geom_label(label = "Republican/\nLeans Republican", 
               label.size = NA, x = 2013.9, y = 0.22, fill = grey, color = "black", hjust = 1, size = 4, family = "Tahoma", fontface = "bold"))


ggsave(plot, filename = "plot.png", height = 6, width = 8, dpi = "retina")