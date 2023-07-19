# Lima Bean Germination Experiment - README

## Introduction

This repository contains the code and data for the Lima Bean Germination Experiment. The experiment aimed to compare the mean germination time of genetically modified (GM) lima beans with non-GM lima beans.

## Method

The experiment involved randomizing the sample for each group, selecting 18 lima beans for both the GM and non-GM groups. Each group was further divided into three sets of 6 lima beans, with GM beans marked with blue and non-GM beans marked with pink. The seeds were placed in petri dishes, and the germination days were recorded along with notes on seed appearance.

## Data

The data for the experiment is provided in the form of two vectors: `GMO` and `NONGMO`. These vectors contain the number of days taken for germination to occur for the respective groups of lima beans.

![boxplot](https://github.com/kimjoyc/GMO_Hypothesis_Test/assets/88675769/1cbe0783-5ac4-4238-a713-516c99e6f00d)

![germ](https://github.com/kimjoyc/GMO_Hypothesis_Test/assets/88675769/3ae71392-8f2f-4bf9-9fce-67646f1332fe)

![sum_state](https://github.com/kimjoyc/GMO_Hypothesis_Test/assets/88675769/4fcfc399-17e4-4924-ae34-c46fa52b74a8)

## Analysis

The analysis was performed using R language and the 'mosaic' package. The following steps were undertaken:

1. Summary statistics for both 'GMO' and 'NONGMO' groups were computed.
2. A two-sample t-test was conducted assuming equal variances between the two groups to assess if there was a significant difference in mean germination times.
3. Bootstrapping was employed to estimate the sampling distribution of the differences in means for 5000 iterations.
4. An adjusted bootstrapped distribution was created by adding the difference in means of the original data to each bootstrapped difference.
5. A histogram of the adjusted bootstrapped distribution was plotted.
6. The 95% confidence interval for the adjusted bootstrapped differences was computed.

## Conclusion

The experiment's results did not provide enough evidence to support the alternative hypothesis, suggesting that there was no significant difference in mean germination times between GM and non-GM lima beans. Further analysis revealed that the 95% confidence interval for the difference in means spanned from -4.389 to 0.944 days, with the sample mean difference being -1.66 days.

## Repository Contents

The repository contains the following files:

- `main.R`: The R code used to perform the data analysis.
- `data.csv`: The CSV file containing the raw data for the experiment.
- `README.md`: This file, providing an overview of the experiment and its analysis.

## Usage

To reproduce the analysis, you can run the `main.R` script after ensuring that R and the 'mosaic' package are installed on your system. The raw data is provided in the `data.csv` file.
