# SQL Layoffs Data Cleaning Project

## Overview

This project demonstrates an end-to-end data cleaning workflow
using MySQL on a layoffs dataset.

## Objectives

- Remove duplicate records
- Standardize inconsistent data
- Handle NULL and blank values
- Convert date values into proper DATE format
- Remove unusable records
- Create staging tables to preserve the original data

## Tools

- MySQL
- SQL

## SQL Concepts Used

- CTEs
- Window Functions
- ROW_NUMBER()
- JOINs
- UPDATE
- DELETE
- ALTER TABLE
- TRIM()
- LIKE
- DISTINCT
- STR_TO_DATE()
- NULL handling
- Staging tables

## Cleaning Process

### 1. Created a staging table

A copy of the original dataset was created so the
raw data would not be modified directly.

### 2. Removed duplicates

ROW_NUMBER() was used with PARTITION BY to identify
duplicate records.

### 3. Standardized data

Examples included:

- Removing unnecessary whitespace
- Standardizing cryptocurrency industry names
- Standardizing country names
- Converting dates into DATE format

### 4. Handled missing values

NULL and blank industry values were identified and
filled where possible using JOINs.

### 5. Removed unusable records

Rows where both total_laid_off and percentage_laid_off
were NULL were removed.

### 6. Final cleanup

Temporary/helper columns were removed from the final
cleaned dataset.

## Key Learning

This project helped me practice using SQL for real-world
data cleaning rather than only querying data.