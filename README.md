# Toronto Building Permits Analysis

## Business Context

Toronto’s construction sector generates large volumes of building permit data that can be leveraged to understand construction cost behavior, housing development trends, and data quality issues across different types of building projects.

This project focuses on transforming raw permit data into structured insights using SQL, Python, and data analytics techniques to support better understanding of urban development patterns.

---

## Problem Statement

Building permit data is complex, highly skewed, and contains variability across structure types, work types, and dwelling unit outcomes. Without proper analysis, it is difficult to extract meaningful insights about construction costs and housing development efficiency.

This project addresses the following challenges:

* High variability and skewness in construction cost data
* Uneven distribution of dwelling unit creation
* Need for data transformation before meaningful analysis
* Lack of structured insights from raw permit records

---

## Research Questions

1. How are construction costs distributed across Toronto building permits?
2. What patterns exist in dwelling unit creation across permits?
3. What data transformations are required to properly analyze skewed construction data?

---

## Dataset

The dataset consists of Toronto building permit records used for academic data analysis. It includes information such as:

* Construction costs
* Structure types
* Work types
* Dwelling units created
* Permit-level attributes

---

## Tools & Technologies

* SQL (data extraction and aggregation)
* Python (data analysis and visualization)
* Pandas & NumPy
* Matplotlib & Seaborn
* Jupyter Notebook

---

## Methodology

The analysis followed a structured data analytics workflow:

1. Data extraction and loading
2. Data cleaning and preprocessing
3. SQL-based aggregation and transformation
4. Exploratory data analysis
5. Distribution analysis of key variables
6. Data transformation (log, sqrt) to handle skewness
7. Model diagnostics and residual analysis
8. Insight generation

---

## SQL Analysis

SQL was used to structure and prepare the dataset through:

* JOIN operations across tables
* GROUP BY aggregations by structure and work type
* Filtering using WHERE conditions
* Aggregation functions (COUNT, AVG, SUM, MIN, MAX)
* Handling missing values using COALESCE

---

## Key Insights

* Construction cost data is highly right-skewed, with a small number of large projects dominating overall distribution.
* Logarithmic transformation significantly improves the interpretability of cost distributions.
* Dwelling unit creation is also heavily skewed, with most permits contributing minimal housing output.
* Data transformation is essential before applying statistical or modeling techniques on this dataset.

---

## Exploratory Data Analysis

### Construction Cost Distribution (Original vs Transformed)

The original distribution shows extreme skewness, while log and square root transformations improve distribution behavior and analytical usability.

![Cost Distribution](images/cost_distribution_log_transformed.png)

---

### Dwelling Units Distribution

Dwelling unit creation is heavily concentrated at low values, requiring transformation for meaningful interpretation.

![Dwelling Units Distribution](images/dwelling_units_distribution_log_transformed.png)

---

## Model Diagnostics

Residual analysis was performed to evaluate model assumptions:

* Q-Q plots indicate deviations from normality
* Residuals vs fitted plots suggest heteroscedasticity
* Data transformations improved stability but did not fully normalize residuals

![Q-Q Plot](images/qq_plot_cost_model.png)

![Residuals vs Fitted](images/residuals_vs_fitted.png)

---

## Conclusion

This project demonstrates how SQL and data analytics techniques can be used to transform raw municipal permit data into structured insights.

Key findings highlight the importance of data transformation when dealing with skewed real-world datasets and demonstrate how analytical techniques can support better understanding of urban construction patterns.

---

## Project Structure

```
toronto-building-permits-analysis/
│
├── README.md
├── notebooks/
├── sql/
├── report/
├── presentation/
├── images/
└── data/
```

---

## Author

**Luis Enrique Villalobos Socualaya**
Master of Data Analytics
LinkedIn: https://www.linkedin.com/in/luisvillaloboss/
