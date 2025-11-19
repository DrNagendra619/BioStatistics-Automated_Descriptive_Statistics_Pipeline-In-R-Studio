# 📊 Automated Descriptive Statistics Pipeline (R)

This R script provides an automated pipeline for generating descriptive statistics, analyzing data distribution (skewness, kurtosis), and visualizing key metrics for a dataset. It is designed to be easily adaptable for rapid initial data exploration.

## 🚀 Key Features

* **Automated Setup:** Defines output paths and handles directory creation.
* **Data Loading & Export:** Loads the built-in R `mtcars` dataset and saves the raw data to a CSV file.
* **Comprehensive Metrics:** Calculates central tendency (Mean, Median), dispersion (Variance, Standard Deviation), Range, and Quantiles.
* **Distribution Analysis:** Computes **Skewness** and **Kurtosis** using the `e1071` package to assess the shape of the data's distribution.
* **Correlation:** Calculates the **Pearson Correlation Coefficient ($r$)** between **MPG** and **Horsepower (HP)**.
* **Automated Visualization:** Generates three high-quality PNG plots for clear presentation:
    1.  **Boxplot:** To visualize quantiles and identify outliers.
    2.  **Histogram with Density Line:** To visualize the overall distribution shape.
    3.  **Scatterplot:** To visualize the correlation between MPG and HP, including a linear regression line.
* **Logging:** All console output (stats, messages, file saves) is automatically logged to a text file for complete traceability.

## 📁 Output Structure

All generated files are saved to the defined `output_path` (default: `D:/DOWNLOADS`).

| Filename | Type | Description |
| :--- | :--- | :--- |
| `Descriptive_Stats_Log.txt` | Text Log | Comprehensive log of the script's execution, including all calculated statistics. |
| `mtcars_raw_data.csv` | CSV | A copy of the raw `mtcars` dataset used for analysis. |
| `1_MPG_Boxplot.png` | PNG Image | Visualization of the MPG quantiles. |
| `2_MPG_Histogram_Distribution.png` | PNG Image | Visualization of the MPG distribution with a fitted density curve. |
| `3_Correlation_Scatterplot.png` | PNG Image | Scatterplot of MPG vs. HP, showing the linear relationship and correlation coefficient ($r$). |

## 🛠️ Prerequisites

* **R** (version 3.6 or higher recommended)
* The following R package (the script will attempt to install it if missing):
    * `e1071` (required for Skewness and Kurtosis calculation)

## ⚙️ How to Run the Script

1.  **Download** the `Automated_Descriptive_Statistics_Pipeline.R` file.
2.  **Optional:** Modify the `output_path` variable at the beginning of the script to your preferred saving location.
    ```R
    output_path <- "D:/DOWNLOADS" # Change this path
    ```
3.  **Execute** the script in your R environment (RStudio or R console):
    ```R
    source("Automated_Descriptive_Statistics_Pipeline.R")
    ```
4.  **Check** the specified output directory (`D:/DOWNLOADS` by default) for the log file, data, and three visualization images.

## 🔬 Analysis Focus (Example: `mtcars` dataset)

The current pipeline focuses primarily on the **Miles Per Gallon (`mpg`)** variable for univariate analysis (Parts 1, 2, and 3) and examines its relationship with **Horsepower (`hp`)** in the correlation analysis (Part 4).

### Key Metrics Calculated for `mpg`

| Metric | R Function Used |
| :--- | :--- |
| Mean, Median, Min, Max, Quantiles | `summary(mtcars$mpg)` and `quantile(mtcars$mpg)` |
| Variance | `var(mtcars$mpg)` |
| Standard Deviation | `sd(mtcars$mpg)` |
| Skewness | `skewness(mtcars$mpg)` (from `e1071`) |
| Kurtosis | `kurtosis(mtcars$mpg)` (from `e1071`) |
| Correlation ($r$) | `cor(mtcars$mpg, mtcars$hp)` |

---
*Created by the Automated Descriptive Statistics Pipeline using R.*
