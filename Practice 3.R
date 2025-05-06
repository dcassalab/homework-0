# Load necessary libraries
library(tidyverse)
library(readxl)
library(lavaan)
library(semPlot)

# Load the data from the Excel file
file_path <- "Survei Mengenai Pengaruh Citra Merek, Kualitas Makanan, dan Kualitas Fasilitas Terhadap Minat Beli Pelanggan di Stabat Seafood (Jawaban) (1).xlsx"
data <- read_excel("~/Library/CloudStorage/OneDrive-UniversitasPelitaHarapan/00 Personal/BKD Genap 2024 2025/Bidang B/Paper Winlie/Data1.xlsx", sheet = "Sheet1")

# Display the first few rows of the dataframe to understand its structure
print(head(data))

# Define the SEM model
model <- '
  # Measurement model
  image =~ Brand_Image
  foodqual =~ Food_Quality
  facqual =~ Facility_Quality
  intention =~ Purchase_Intention

  # Structural model
  intention ~ foodqual + facqual + image
  image ~ foodqual + facqual
'

# Fit the SEM model
fit <- sem(model, data=data)

# Summary of the model fit
summary(fit, fit.measures=TRUE, standardized=TRUE)

# Plot the SEM model
semPaths(fit, "std", layout = "tree", whatLabels = "std", edge.label.cex = 0.8, sizeMan = 5, sizeLat = 7)

