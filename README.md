# MechaCar_Statistical_Analysis
## Overview
To help a client, Autos-R-Us, identify and troubleshoot issues in their production, two datasets ('mechaCar_mpg.csv' and 'Suspension_Coil.csv') were utilized to perform the following statistical analysis, using the R programming language.

## Linear Regression to Predict MPG
To establish relationship between mpg and various MechaCars, we used the 'MechaCar_mpg.csv' dataset containing mpg test results for 50 prototype MechaCars. 

The MechaCar prototypes were produced using multiple design specifications to identify ideal vehicle performance. Multiple metrics, such as vehicle length, vehicle weight, spoiler angle, drivetrain, and ground clearance, were collected for each vehicle. 

Using R, a linear model was designed that predicts the mpg of MechaCar prototypes using multiple variables from the MechaCar_mpg.csv file. 

For this linear model, the assumptions held about the data were as follows:
1. The input data is numerical and continuous.
2. The input data should follow a linear pattern.
3. Variability exists in the independent x-variable.
4. The residual error (distance from each point in the line) should be normally distributed.

The summary output of this model is shown below.

[screenshot of summary results]

From the Pr(>|t|) values, which tell us the probability that each coefficient contributes a random amount of variance to the linear model, we can determine the following:

**Vehicle_length:    2.60e-12**  
Vehicle length is statistically unlikely to provide a random amount of variance to the linear model, meaning that vehicle length is likely to have a significant impact on mpg.

**Vehicle_weight:    0.0776**
Vehicle weight is statistically likely to provide a random amount of variance to the linear model, meaning that vehicle weight is not likely to have a significant impact on mpg.

**Spoiler_angle:     0.3069**
Spoiler angle is statistically likely to provide a random amount of variance to the linear model, meaning that spoiler angle is not likely to have a significant impact on mpg.

**ground_clearance:  5.21e-08**
Ground clearance is statistically unlikely to provide a random amount of variance to the linear model, meaning that ground clearance is likely to have a significant impact on mpg.

**AWD:               0.1852**
AWD is statistically likely to provide a random amount of variance to the linear model, meaning that AWD is not likely to have a significant impact on mpg.

To summarize, the variables that provide a non-random amount of variance to the mpg values in the dataset are and are likely to have an impact on mpg are: **vehicle length** and **ground clearance**.

The r-squared value is 0.7149, which means that roughly 71% of the variablilty of our dependent variable (miles per gallon) is explained using this linear model. 

In addition, the p-value of our linear regression analysis is 5.35e-11, which is much smaller than our assumed significance level of 0.05%. Therefore, there is sufficient evidence to reject our null hypothesis, which means that the slope of our linear model is not zero.

From the above, we can also determine that while the model does effectively predict the mpg of MechaCar prototypes, statistically speaking, only two of the four variables being used in the model are contributing meaningfully to that effectiveness. Because of this it is possible to conceive of other models that might be better determinants of MechaCar prototype mpgs.

### Summary Statistics on Suspension Coils
The MechaCar Suspension_Coil.csv dataset contains the results from multiple production lots. In this dataset, the weight capacities of multiple suspension coils were tested to determine if the manufacturing process is consistent across production lots. 

The dataframe below shows the PSI metrics mean, median, variance and standard deviation for all the PSI values in the Suspension_Coil.csv dataset, across all the manufacturing lots:

[image]

The dataframe below shows PSI metrics mean, median, variance, and standard deviation, for each lot in the dataset:

[image2]

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. While this metric is satisfied when the PSI variance is calculated across all the manufacturing lots (as shown in the first dataframe above, where the variance is 62.29356), yet, when variance is calculated individually by lot, the variance for suspension coils in lot 3 are shown to be far in excess of this amount (170.28612 > 100).

### T-Test on Suspension Coils
To determine if all manufacturing lots and each lot individually are statistically different from the population mean of 1500 pounds per square inch, we performed the following four t-tests. The tests assumed the following about the data:

1. The input data is numerical and continuous.
2. The sample data was selected randomly from the population data.
3. The input data is considered normally distributed.
4. The sample size is reasonably large.
5. The variance of input data should be very similar. 

The log10 coefficient was not used in this instance because the data was not skewed and the datasets and subsets were sufficiently sized for the tests.

**RESULTS OF 1-SAMPLE T-TEST (All Lots)**
>t.test(suscoil_table$PSI, mu=1500)

[png]

One Sample t-test

data:  suscoil_table$PSI
t = -1.8931, df = 149, p-value = 0.06028
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1497.507 1500.053
sample estimates:
mean of x 
  1498.78 

Because the p-value above is greater than the significance level of 0.05, we do not have sufficient evidence to reject the null hypothesis, meaning that our suspension coil dataset is statistically similar to the true mean.

**RESULTS OF 1-SAMPLE T-TEST (Lot 1)**
> lot1_table <- subset(suscoil_table, Manufacturing_Lot=="Lot1")
> t.test(lot1_table$PSI, mu = 1500)

[png]

One Sample t-test

data:  lot1_table$PSI
t = 0, df = 49, p-value = 1
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.719 1500.281
sample estimates:
mean of x 
     1500 

Because the p-value above is greater than the significance level of 0.05, we do not have sufficient evidence to reject the null hypothesis, meaning that our suspension coil dataset is statistically similar to the true mean.

**RESULTS OF 1-SAMPLE T-TEST (Lot 2)**
> lot2_table <- subset(suscoil_table, Manufacturing_Lot=="Lot2")
> t.test(lot2_table$PSI, mu = 1500)

[png]

One Sample t-test

data:  lot2_table$PSI
t = 0.51745, df = 49, p-value = 0.6072
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.423 1500.977
sample estimates:
mean of x 
   1500.2 

Because the p-value above is greater than the significance level of 0.05, we do not have sufficient evidence to reject the null hypothesis, meaning that our suspension coil dataset is statistically similar to the true mean.

**RESULTS OF 1-SAMPLE T-TEST (Lot 3)**
> lot3_table <- subset(suscoil_table, Manufacturing_Lot=="Lot3")
> t.test(lot3_table$PSI, mu = 1500)

[png]

One Sample t-test

data:  lot3_table$PSI
t = -2.0916, df = 49, p-value = 0.04168
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1492.431 1499.849
sample estimates:
mean of x 
  1496.14 

Because the p-value above is less than the significance level of 0.05, there is sufficient evidence to reject the null hypothesis, meaning that our suspension coil data for this subset is NOT statistically similar to the true mean.

To summarize the results of our 4 t-tests above, the first three t-tests, comparing PSI data from the composite manufacturing lots dataset, the manufacturing lot 1 data subset and manufacturing lot 2 data subset failed to provide sufficient evidence to reject our null hypothesis, indicating that they are statistically similar to the population mean of 1500 PSI; only the t-test comparing the PSI data from manufacturing lot 3 provided sufficient evidence to reject the null hypothesis, suggesting that the data is not statistically similar to the true mean.


## Study Design: MechaCar vs Competition
To compare the performance of the MechaCar vehicles against performance of vehicles from other manufacturers, the following study was designed:

With gas prices at an all-time high in 2022, it would behoove MechaCar to determine which of its car models has the best highway fuel efficiency. It would also be in MechaCar's interest to investigate the highway fuel efficiency of the models belonging to its competitors, and to see whether the rising gas prices have increased the sales of fuel-efficient vehicles in recent months. 

The metric this study will test will be the sale of vehicles with the highest fuel efficiency ratings.

The null hypothesis of this study can be expressed thus:
"There is no statistical relationship between the rate of change in gas prices and the sale of fuel-efficient vehicles."
The alternative hypothesis of this study would be:
"There is a statistical relationship between the rate of change in gas prices and the sale of fuel-efficient vehicles."

Because our hypothesis is looking for the relationship between a single dependent variable (rate of change in gas prices) and a single independent continuous variable (fuel-efficient car sales), we can test our hypothesis using a simple linear regression model.

Prior to testing this, we we would need to compile some very specific datasets, namely:
1. Rates of change in regional gas prices over a substantial time period (say, 2010-2022).
2. We would also need to determine the criteria for what constitutes a fuel-efficient vehicle. A standard associated mileage per gallon could be used to determine this for each model in our dataset. We would also need to see the sale amounts for those vehicles within the same time period as our regional gas price data.

Once this data is compiled and organized in a dataset, we can use R to read in our data and run a simple linear regression test using the summary() and lm() functions. 

Prior to running our tests, we would need to confirm the following about our data:

1. The input data is numerical and continuous.
2. The input data should follow a linear pattern.
3. There is variability in the independent x-variable.
4. The residual error (distance from each point in the line) should be normally distributed.
