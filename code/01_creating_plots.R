here::i_am("code/01_creating_plots.R")

library(ggplot2)

data <- read.csv(
  file = here::here("data/duplicated_data.csv")
)

#create relapse_month variable
data$relapse_month <- NA
for (i in 1:nrow(data)) {
  if (!is.na(data$relapse_date[i])) {
    data$relapse_month[i] <- data$month[i]
  }
}

spagplot <- ggplot(data = data, aes(x=month, y=hr.mean, group=ID, color=type))+
  geom_line()+
  facet_grid(. ~ type)+
  labs(y="Mean Heart Rate")+
  theme(text=element_text(size=20))+
  scale_color_manual(values = c("black", "blue", "blue"))+
  geom_point(data = data, aes(x=relapse_month, y=hr.mean),
             na.rm = TRUE, shape = 4, size = 5, color = "red")

ggsave(
  spagplot, 
  file = here::here("output/spagplot.png")
)
