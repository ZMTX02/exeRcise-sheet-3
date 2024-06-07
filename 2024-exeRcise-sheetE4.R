##4
###e)

install.packages("readr")
install.packages("ggplot2")
install.packages("dplyr")

library(readr)
library(ggplot2)
library(dplyr)

gold_prices <- read_csv("https://raw.githubusercontent.com/owid/owid-datasets/master/datasets/Gold%20prices%20-%20Laurence%20%26%20Williamson%20(2017)/Gold%20prices%20-%20Laurence%20%26%20Williamson%20(2017).csv")

str(gold_prices)

summary(gold_prices$`Gold (New York Market Price) (Laurence & Williamson (2017))`)

gold_prices_filtered <- gold_prices %>% filter(Year >= 1800)

gold_prices_summary <- gold_prices_filtered %>%
  summarise(
    min_price = min(`Gold (New York Market Price) (Laurence & Williamson (2017))`, na.rm = TRUE),
    max_price = max(`Gold (New York Market Price) (Laurence & Williamson (2017))`, na.rm = TRUE),
    mean_price = mean(`Gold (New York Market Price) (Laurence & Williamson (2017))`, na.rm = TRUE)
  )

print(gold_prices_summary)

###f)

ggplot(gold_prices_filtered, aes(x = Year, y = `Gold (New York Market Price) (Laurence & Williamson (2017))`)) +
  geom_line(color = "blue") +
  labs(
    title = "Gold Prices from 1800 to 2015",
    x = "Year",
    y = "Gold Price (USD)",
    caption = "Source: Laurence & Williamson (2017)"
  ) +
  theme_minimal()








