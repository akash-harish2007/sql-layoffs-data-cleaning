# SQL Layoffs Data Cleaning & Exploratory Data Analysis

## 📌 Overview

This project uses MySQL to clean and explore a real-world layoffs dataset.

The project was divided into two main stages:

1. Data Cleaning
2. Exploratory Data Analysis (EDA)

The goal was to transform the raw dataset into a cleaner and more consistent dataset and then use SQL to identify trends and patterns in layoffs across companies, industries, countries, years, and time periods.

---

## 🛠️ Tools Used

- MySQL
- MySQL Workbench
- SQL

---

## 📂 Project Structure

```text
sql-layoffs-data-project/
│
├── data/
│   ├── layoffs_raw.csv
│   └── layoffs_cleaned.csv
│
├── sql/
│   ├── data_cleaning.sql
│   └── exploratory_data_analysis.sql
│
└── README.md

🧹 Data Cleaning

The raw dataset was first copied into staging tables so that the original data could be preserved.

Cleaning steps performed:
Created staging tables
Identified duplicate records using ROW_NUMBER()
Removed duplicate records
Removed unnecessary whitespace using TRIM()
Standardized industry names
Standardized country names
Converted date values from text to DATE
Identified NULL and blank values
Filled missing industry values where possible using JOIN
Removed records where both total layoffs and percentage layoffs were NULL
Removed temporary/helper columns
SQL concepts used:
CREATE TABLE
INSERT
UPDATE
DELETE
ALTER TABLE
TRIM()
LIKE
JOIN
CTE
ROW_NUMBER()
STR_TO_DATE()
NULL handling
Window functions


📊 Exploratory Data Analysis

After cleaning the dataset, SQL was used to explore patterns and trends in the layoffs data.

Analysis performed:
Identified companies with the highest layoffs
Compared layoffs across industries
Compared layoffs across countries
Analyzed layoffs by year
Analyzed layoffs by company stage
Analyzed monthly layoffs
Calculated cumulative/rolling layoffs over time
Analyzed layoffs by company and year
Ranked companies within each year
Identified the top 5 companies by layoffs for each year
SQL concepts used:
GROUP BY
SUM()
MAX()
ORDER BY
YEAR()
SUBSTRING()
CTE
Window functions
DENSE_RANK()
Rolling totals

🔎 Key Questions Explored

Some of the questions investigated during the analysis were:

Which companies had the highest number of layoffs?
Which industries were most affected?
Which countries experienced the highest layoffs?
Which years had the highest total layoffs?
Which company stages experienced the largest layoffs?
How did layoffs change month by month?
What was the cumulative number of layoffs over time?
Which companies had the highest layoffs in each year?
Which companies ranked in the top 5 for layoffs each year?

💡 Key Learning

This project helped me practice using SQL for a complete data workflow, from raw data cleaning to exploratory analysis.

The project gave me practical experience with:

Data cleaning
Data standardization
Handling missing values
Duplicate detection
CTEs
Joins
Window functions
Ranking
Aggregation
Date manipulation
Rolling totals
Exploratory data analysis

Rather than only solving individual SQL exercises, this project allowed me to apply these concepts to a complete dataset.

🚀 Future Improvements

Possible extensions to this project include:

Performing deeper analysis using Python and pandas

Creating visualizations using Matplotlib/Seaborn

Building a Power BI dashboard

Investigating relationships between layoffs, funding, industry, and 
company stage

Creating additional business-focused insights