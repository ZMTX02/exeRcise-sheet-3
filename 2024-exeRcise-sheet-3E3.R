##3)
###b)

library(tidyverse)

data_2022 <- read_csv("data/open_data_portal_2022.csv")
data_2023 <- read_csv("data/vornamen-muenchen-2023.csv")

str(data_2022)
str(data_2023)

unique(data_2022$Anzahl)
unique(data_2023$Anzahl)

data_2022$Anzahl <- as.numeric(gsub("[^0-9]", "", data_2022$Anzahl))
data_2023$Anzahl <- as.numeric(gsub("[^0-9]", "", data_2023$Anzahl))

###c)

total_2022 <- sum(data_2022$Anzahl, na.rm = TRUE)
total_2023 <- sum(data_2023$Anzahl, na.rm = TRUE)

if (total_2023 > total_2022) {
  print("2023 had the bigger baby-boom.")
} else if (total_2023 < total_2022) {
  print("2022 had the bigger baby-boom.")
} else {
  print("Both years had the same number of babies born.")
}

###d)

data_2022 <- data_2022 %>%
  mutate(year = 2022)

data_2023 <- data_2023 %>%
  mutate(year = 2023)

###e)

combined_data <- bind_rows(data_2022, data_2023)

###f)

top_10_names <- combined_data %>%
  group_by(Vorname) %>%
  summarise(total_count = sum(Anzahl, na.rm = TRUE)) %>%
  arrange(desc(total_count)) %>%
  head(10)

print(knitr::kable(top_10_names, caption = "Top 10 Baby Names in Munich for 2022 and 2023"))
