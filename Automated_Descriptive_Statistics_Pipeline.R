# ==============================================================================
# FILE NAME: Automated_Descriptive_Statistics_Pipeline.R
# PURPOSE: Automated Descriptive Stats, Distribution Analysis & Visualization
# OUTPUT PATH: D:/DOWNLOADS
# ==============================================================================

# ------------------------------------------------------------------------------
# SETUP: Define Output Path & Logging
# ------------------------------------------------------------------------------
output_path <- "D:/DOWNLOADS"

# Check if directory exists, if not, create it
if(!dir.exists(output_path)){
  dir.create(output_path)
  message("Created directory: ", output_path)
}

# Set working directory
setwd(output_path)

# Start recording all console output to a text file
sink(file = "Descriptive_Stats_Log.txt", split = TRUE)

print(paste("Analysis started at:", Sys.time()))
print(paste("Script Name: Automated_Descriptive_Statistics_Pipeline.R"))
print("Saving all outputs to D:/DOWNLOADS...")


# ------------------------------------------------------------------------------
# PART 1: Load Data & Basic Stats
# ------------------------------------------------------------------------------
print("------------------------------------------------")
print("1. Data Loading & Summary")
print("------------------------------------------------")

# Load built-in dataset 
data(mtcars) 

# Save raw data to CSV for reference
write.csv(mtcars, "mtcars_raw_data.csv")
print("Saved: mtcars_raw_data.csv")

# Basic descriptive statistics for 'mpg' 
print("--- Summary of MPG ---")
print(summary(mtcars$mpg)) 

# Central Tendency & Dispersion
print("--- Detailed Metrics ---")
print(paste("Mean:              ", mean(mtcars$mpg)))
print(paste("Median:            ", median(mtcars$mpg)))
print(paste("Variance:          ", var(mtcars$mpg)))
print(paste("Standard Deviation:", sd(mtcars$mpg)))


# ------------------------------------------------------------------------------
# PART 2: Range & Quantiles
# ------------------------------------------------------------------------------
print("------------------------------------------------")
print("2. Range and Quantiles")
print("------------------------------------------------")

print("--- Range (Min, Max) ---")
print(range(mtcars$mpg)) 

print("--- Quantiles (0%, 25%, 50%, 75%, 100%) ---")
print(quantile(mtcars$mpg)) 

# Visualization: Boxplot (Best for Quantiles)
png(filename = "1_MPG_Boxplot.png", width=800, height=600)
boxplot(mtcars$mpg, 
        col="lightgreen", 
        main="Boxplot of MPG (Quantiles Visualization)",
        ylab="Miles Per Gallon",
        horizontal = TRUE)
dev.off()
print("Saved: 1_MPG_Boxplot.png")


# ------------------------------------------------------------------------------
# PART 3: Skewness & Kurtosis (Distribution Shape)
# ------------------------------------------------------------------------------
print("------------------------------------------------")
print("3. Skewness & Kurtosis (Distribution Shape)")
print("------------------------------------------------")

# Check if e1071 is installed, if not, install it
if(!require(e1071)) install.packages("e1071")
library(e1071) 

print(paste("Skewness:", skewness(mtcars$mpg))) 
print(paste("Kurtosis:", kurtosis(mtcars$mpg))) 

# Visualization: Histogram with Density Line (Best for Skewness)
png(filename = "2_MPG_Histogram_Distribution.png", width=800, height=600)
hist(mtcars$mpg, prob=TRUE, 
     col="skyblue", border="white",
     main="Distribution of MPG (Skewness/Kurtosis Check)",
     xlab="Miles Per Gallon")
lines(density(mtcars$mpg), col="red", lwd=3)
dev.off()
print("Saved: 2_MPG_Histogram_Distribution.png")


# ------------------------------------------------------------------------------
# PART 4: Correlation Analysis
# ------------------------------------------------------------------------------
print("------------------------------------------------")
print("4. Correlation (MPG vs Horsepower)")
print("------------------------------------------------")

correlation_val <- cor(mtcars$mpg, mtcars$hp)
print(paste("Correlation Coefficient (r):", correlation_val)) 

# Visualization: Scatterplot (Best for Correlation)
png(filename = "3_Correlation_Scatterplot.png", width=800, height=600)
plot(mtcars$hp, mtcars$mpg, 
     pch=19, col="blue",
     main=paste("Scatterplot: MPG vs HP (r =", round(correlation_val, 2), ")"),
     xlab="Horsepower (hp)", ylab="Miles Per Gallon (mpg)")
# Add regression line
abline(lm(mpg ~ hp, data=mtcars), col="red", lwd=2)
dev.off()
print("Saved: 3_Correlation_Scatterplot.png")


# ------------------------------------------------------------------------------
# TEARDOWN
# ------------------------------------------------------------------------------
# Stop logging
sink()
message("------------------------------------------------")
message("Analysis Complete.")
message("Please check D:/DOWNLOADS for:")
message("1. Descriptive_Stats_Log.txt")
message("2. mtcars_raw_data.csv")
message("3. PNG Visualization Files")
message("------------------------------------------------")