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
  summarize(PRCP = mean(PRCP, na.rm = T)) |>
  mutate(LAB = case_when(
    PRCP > 0.32 ~ "NM's wettest day
    0.34 inches
    Dec 23",
    PRCP < 0.32 ~ NA
  ))

NMPRCP |>
ggplot(mapping = aes(x = DATE, y = PRCP)) +
  geom_col(
    width = 1,
    fill = "#1733A8"
  ) +
  geom_text(
    aes(label = LAB),
    nudge_y = .05,
    nudge_x = -5,
    size = 2.5,
    fontface = "bold"
  ) +
  scale_y_continuous(
    limits = c(0, 0.5),
    expand = expansion(mult = c(0, 0.05))
  ) +
  scale_x_date(
    date_breaks = "2 month",
    date_labels = c("Dec 1","Feb 1","Apr 1","Jun 1","Aug 1","Oct 1")
  ) +
  labs(
    y = "Inches of Precipitation",
    x = "Date",
    title = "Average Precipitation per Day",
    subtitle = "New Mexico, 2023"
  ) +
  theme(
    panel.background = element_blank(),
    panel.grid.major.y = element_line(color = "gray"),
    panel.grid.major.x = element_blank(),
    axis.ticks.y = element_blank(),
    plot.title = element_text(hjust = .5),
    plot.subtitle = element_text(hjust = .5,
                                 face = "bold")
  )
  

mdpr x sn32

tavg x tmax

tmax x sx##
