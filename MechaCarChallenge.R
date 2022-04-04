library(dplyr)
library(tidyverse)
#Deliv 1
#Import MechaCar Dataset
mecha_mpg <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)

#Perform linear regression
mecha_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance+AWD, data=mecha_mpg)

#determine p-value and r-squared for summary
summary(mecha_lm)


#Deliv 2
#Import Suspension Coil Dataset
suspension_coil <- read.csv('Suspension_Coil.csv',check.names = F,stringsAsFactors = F)

#create total_summary frame
total_summary <- suspension_coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# create lot_summary frame and group by Lot#
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep') 


#Deliv3
#test PSI across all Manufacturing lots with the population mean
t.test(suspension_coil$PSI,mu=1500)

#test PSI across each Manufacturing lot
t.test(subset(suspension_coil, Manufacturing_Lot == "Lot1")[['PSI']],mu=1500)
t.test(subset(suspension_coil, Manufacturing_Lot == "Lot2")[['PSI']],mu=1500)
t.test(subset(suspension_coil, Manufacturing_Lot == "Lot3")[['PSI']],mu=1500)
