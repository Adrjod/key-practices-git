# 1. Set up your project by loading your packages, e.g.:
#load the tidyr package
library("tidyr")

# 2. Set the working directory and load the data, e.g.:
setwd("C:\Users\adrjod\git_KPLS\Adrjod\key-practices-git.git")
#import the data 
data <- read.delim("data.csv", header = TRUE, sep = ",")

# Select the columns that will be used and create two new columns with the mutate function
data <- data %>%
  select(ppID, condition, trial, RT) %>%
  mutate(condition = as.factor(condition), target = as.factor(target))
#remove all missing values 
data <- na.omit(data)

# examine the data after tidying it 
summary(data)

# 5. Analysis - run a one-way ANOVA, within-subjects:
anovaRTbycategory <- aov(RT ~category+error(ppID/category), data = analysis_anova)
# Examine the findings from the ANOVA
summary(anovaRTbycategory)