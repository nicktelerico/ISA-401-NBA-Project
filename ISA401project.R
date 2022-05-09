if(require(pacman)==FALSE)install.packages("pacman")
pacman::p_load(tidyverse,
               rvest,
               magrittr)

read_html("http://www.espn.com/nba/attendance/_/year/2018") %>% 
  html_elements("table") %>% 
  html_table() %>% .[[1]] -> attendanced2018

read_html("http://www.espn.com/nba/attendance/_/year/2019") %>% 
  html_elements("table") %>% 
  html_table() %>% .[[1]] -> attendanced2019

read_html("http://www.espn.com/nba/salaries/_/year/2019/seasontype/3") %>% 
  html_elements("table") %>% 
  html_table() %>% .[[1]] -> salary2018

read_html("http://www.espn.com/nba/salaries/_/year/2020/seasontype/3") %>% 
  html_elements("table") %>% 
  html_table() %>% .[[1]] -> salary2019

attendanced2018 <- attendanced2018[,1:6]
attendanced2018 <- attendanced2018[-1,]
attendanced2018 <- row_to_names(attendanced2018,1, remove_rows_above = T)
attendanced2018 <- attendanced2018[1:30,]

attendanced2019 <- attendanced2019[,1:6]
attendanced2019 <- attendanced2019[-1,]
attendanced2019 <- row_to_names(attendanced2019,1, remove_rows_above = T)
attendanced2019 <- attendanced2019[1:30,]

salary2018 <- row_to_names(salary2018,1, remove_rows_above = T)
salary2019 <- row_to_names(salary2019,1, remove_rows_above = T)

salary2018 <- salary2018[-c(11, 22, 33),]
salary2019 <- salary2019[-c(11, 22, 33),]

write.csv(attendanced2018, "2018 attendace.csv")
write.csv(attendanced2019, "2019 attendace.csv")
write.csv(salary2018, "2018 salary.csv")
write.csv(salary2019, "2019 salary.csv")
