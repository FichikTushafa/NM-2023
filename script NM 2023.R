library(tidyverse)
octdec <- read_csv("3734899.csv")
maysept <- read_csv("3734898.csv")
janapr <- read_csv("3734896.csv")
NM <- rbind(janapr, maysept, octdec)

summary(NM$PRCP)

NM |>
  summarize(min = min(PRCP, na.rm = T),
            max = max(PRCP, na.rm = T),
            mean = mean(PRCP, na.rm = T),
            median = median(PRCP, na.rm = T))

#precip by day, aggregate of stations' data
NMPRCP <-
  NM |>
  select(DATE, PRCP) |>
  group_by(DATE) |>
  summarize(PRCP = mean(PRCP, na.rm = T)) #THIS WORKS, DONT TOUCH IT!!

NMPRCP |>
ggplot(mapping = aes(x = DATE, y = PRCP)) +
  geom_col(
    width = 1,
    fill = "#1733A8"
  ) +
  scale_y_continuous(
    limits = c(0, 0.5),
    expand = expansion(mult = c(0, 0.05))
  ) +
  scale_x_date(
    date_breaks = "2 month",
    date_labels = c("Dec","Feb","Apr","Jun","Aug","Oct")
  ) +
  labs(
    y = "Inches of Precipitation",
    x = "Day",
    title = "Average Precipitation per Day, New Mexico, 2023"
  )
  

mdpr x sn32

tavg x tmax

tmax x sx##
