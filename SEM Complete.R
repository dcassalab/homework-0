# Load necessary libraries
library(lavaan)
library(semPlot)
library(readxl)

# Load the data
data <- read_xlsx("~/Library/CloudStorage/OneDrive-UniversitasPelitaHarapan/00 Personal/BKD Genap 2024 2025/Bidang B/Paper Winlie/Survei Mengenai Pengaruh Citra Merek, Kualitas Makanan, dan Kualitas Fasilitas Terhadap Minat Beli Pelanggan di Stabat Seafood (Jawaban) (1).xlsx", 
                   sheet = "Sheet2")

# Define the SEM model
model <- '
  # Measurement model
  Brand_Image =~ BI1 + BI2 + BI3 + BI4 + BI5 + BI6
  Food_Quality =~ FQ1 + FQ2 + FQ3 + FQ4 + FQ5 + FQ6 + FQ7 + FQ8
  Facility_Quality =~ FACQ1 + FACQ2 + FACQ3 + FACQ4 + FACQ5 + FACQ6
  Purchase_Intention =~ PI1 + PI2 + PI3 + PI4 + PI5 + PI6 + PI7 + PI8

  # Structural model
  Brand_Image ~ Food_Quality + Facility_Quality
  Purchase_Intention ~ Brand_Image
'

# Fit the model
fit <- sem(model, data = data)

# Summary of the model fit
summary(fit, fit.measures = TRUE, standardized = TRUE)

# Plot the SEM model
semPaths(fit, "std", layout = "tree", whatLabels = "std", edge.label.cex = 0.8, sizeMan = 5, sizeLat = 7, nCharNodes = 0)

