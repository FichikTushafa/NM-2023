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

NMPRCP <-
  NM |>
  select(DATE, PRCP) |>
  group_by(DATE) |>
  summarize(prcp = mean(PRCP, na.rm = T)) #THIS WORKS, DONT TOUCH IT!!
  

NM |>
ggplot(data = NM, mapping = aes(x = DATE, y = PRCP)) +
  geom_point()

nmprcpmax <-
NM |>
  group_by(DATE) |>
  slice_max(PRCP, n = 1)

nmprcpmax |>
  ggplot(mapping = aes(x = DATE, y = PRCP)) +
  geom_smooth() +
  geom_point()

mdpr x sn32

tavg x tmax

tmax x sx##
