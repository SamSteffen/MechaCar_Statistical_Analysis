R version 4.2.1 (2022-06-23 ucrt) -- "Funny-Looking Kid"
Copyright (C) 2022 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> install.packages("tidyverse")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:
  
  https://cran.rstudio.com/bin/windows/Rtools/
  Installing package into ‘C:/Users/ssteffen/AppData/Local/R/win-library/4.2’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.2/tidyverse_1.3.2.zip'
Content type 'application/zip' length 428926 bytes (418 KB)
downloaded 418 KB

package ‘tidyverse’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\ssteffen\AppData\Local\Temp\RtmpSeRZJz\downloaded_packages
> install.packages("jsonlite")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:
  
  https://cran.rstudio.com/bin/windows/Rtools/
  Installing package into ‘C:/Users/ssteffen/AppData/Local/R/win-library/4.2’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.2/jsonlite_1.8.0.zip'
Content type 'application/zip' length 1099023 bytes (1.0 MB)
downloaded 1.0 MB

package ‘jsonlite’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\ssteffen\AppData\Local\Temp\RtmpSeRZJz\downloaded_packages
> library("dplyr")

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:
  
  filter, lag

The following objects are masked from ‘package:base’:
  
  intersect, setdiff, setequal, union

> mechacar_table <- read.csv('MechaCar_mpg.csv', check.names=F,stringsAsFactors=F)
Error in file(file, "rt") : cannot open the connection
In addition: Warning message:
  In file(file, "rt") :
  cannot open file 'MechaCar_mpg.csv': No such file or directory
> setwd("C:/Users/ssteffen/Desktop/Sam/Vanderbilt Boot Camp/MyRepo/Module 15_R/R_Analysis/MechaCar_Statistical_Analysis")
> mechacar_table <- read.csv('MechaCar_mpg.csv', check.names=F,stringsAsFactors=F)
> View(mechacar_table)
> lm(mpg~vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_table)

Call:
  lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
       ground_clearance + AWD, data = mechacar_table)

Coefficients:
  (Intercept)    vehicle_length    vehicle_weight     spoiler_angle  
-1.040e+02         6.267e+00         1.245e-03         6.877e-02  
ground_clearance               AWD  
3.546e+00        -3.411e+00  

> summary(lm(mpg~vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_table))

Call:
  lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
       ground_clearance + AWD, data = mechacar_table)

Residuals:
  Min       1Q   Median       3Q      Max 
-19.4701  -4.4994  -0.0692   5.4433  18.5849 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
  vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
  vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
  AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11

> suscoil_table <-read.csv('Suspension_Coil.csv', check.names=F, stringsAsFactors=F)
> View(suscoil_table)
> total_summary <- suscoil_table %>% summarize (Mean= mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups="keep")
> View(total_summary)
> lot_summary <- suscoil_table %>% group_by(Manufacturing_Lot) %>% summarize (Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups="keep")
> View(lot_summary)
> t.test(suscoil_table$PSI, mu=1500)

One Sample t-test

data:  suscoil_table$PSI
t = -1.8931, df = 149, p-value = 0.06028
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
  1497.507 1500.053
sample estimates:
  mean of x 
1498.78 

> lot1_table <- subset(suscoil_table, Manufacturing_Lot=="Lot1")
> lot1_table <- subset(suscoil_table, Manufacturing_Lot=="Lot2")
> lot1_table <- subset(suscoil_table, Manufacturing_Lot=="Lot1")
> lot2_table <- subset(suscoil_table, Manufacturing_Lot=="Lot2")
> lot3_table <- subset(suscoil_table, Manufacturing_Lot=="Lot3")
> View(lot1_table)
> View(lot2_table)
> View(lot3_table)
> t.test(lot1_table$PSI, mu=1500)

One Sample t-test

data:  lot1_table$PSI
t = 0, df = 49, p-value = 1
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
  1499.719 1500.281
sample estimates:
  mean of x 
1500 

> t.test(lot2_table$PSI, mu=1500)

One Sample t-test

data:  lot2_table$PSI
t = 0.51745, df = 49, p-value = 0.6072
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
  1499.423 1500.977
sample estimates:
  mean of x 
1500.2 

> t.test(lot3_table$PSI, mu=1500)

One Sample t-test

data:  lot3_table$PSI
t = -2.0916, df = 49, p-value = 0.04168
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
  1492.431 1499.849
sample estimates:
  mean of x 
1496.14 
