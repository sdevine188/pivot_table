library(tidyr)
library(reshape2)

# this works
test <- datafile %>% 
                select(FY, Best.EDA.., Appl.State.Abbr) %>%
                filter(FY > 2012) %>%
                group_by(FY, Appl.State.Abbr) %>%
                summarize(
                        amount = sum(Best.EDA..)
                ) %>%
                spread(FY, amount)



# new attempt including the count per year
test <- datafile %>% 
        select(FY, Best.EDA.., Appl.State.Abbr) %>%
        filter(FY > 2012) %>%
        group_by(FY, Appl.State.Abbr) %>%
        summarize(
                amount = sum(Best.EDA..),
                count = n()
        ) %>%
        melt(id.vars = c("Appl.State.Abbr", "FY")) %>%
        dcast(Appl.State.Abbr ~ FY + variable)
        
