# Toronto Building Permits Analysis

## Business Context

Toronto’s construction sector generates large volumes of building permit data that can be used to understand cost patterns, housing development trends, and approval efficiency across the city.

This project transforms raw permit data into actionable insights using SQL and data analytics techniques.

## Project Overview
This project analyzes Toronto building permit data to understand cost behavior, housing unit creation, and statistical distribution patterns in construction-related data.

The focus is on SQL data extraction, exploratory data analysis, and statistical diagnostics rather than dashboard reporting.

---

## Business Problem
Urban construction data is highly skewed and contains extreme values that distort average cost and housing unit analysis.

This project investigates:
- How construction costs are distributed
- Whether transformations improve data interpretability
- Whether regression assumptions hold for predictive modeling

---

## Dataset
Toronto building permits dataset including:
- Construction costs
- Dwelling units created
- Work type information
- Permit-level records

---

## Tools Used
- SQL (data extraction and filtering)
- Python (pandas, numpy, matplotlib, seaborn)
- Jupyter Notebook
- Statistical transformations (log, sqrt)

---

## Methodology
- Data cleaning and preprocessing
- Exploratory Data Analysis (EDA)
- Distribution analysis (skewness handling)
- Log and square-root transformations
- Regression diagnostics
- Residual analysis (Q-Q plot, fitted vs residuals)

---

## Key Insights

- Construction costs are highly skewed, with a small number of large projects driving most of the total cost.
- Log transformation significantly improves the distribution for analytical modeling.
- Dwelling unit creation is also heavily skewed, indicating that most permits contribute little to housing supply.
- Data transformations were necessary to stabilize variance and improve model interpretability.

---

## Visualizations

## Data Distribution Analysis

### Cost Distribution (Original)
![Cost Distribution](images/cost_distribution_original.png)

### Log Transformed Cost Distribution
![Log Cost](images/cost_distribution_log.png)

### Dwelling Units log
(images/dwelling_units_distribution_log_transformed.png)

## Model Diagnostics

### Q-Q Plot
![QQ Plot](images/qq_plot.png)

### Residuals vs Fitted
![Residuals](images/residuals_vs_fitted.png)

---

## Conclusion
This analysis highlights the importance of data transformation when working with highly skewed urban construction datasets. Log transformation and residual diagnostics are essential before applying predictive models.
