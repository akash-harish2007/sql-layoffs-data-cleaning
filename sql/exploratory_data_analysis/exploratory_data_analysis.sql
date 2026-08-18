-- Exploratory Data Analysis

use sql_project;

select * from layoffs_staging2;


select max(total_laid_off), max(percentage_laid_off) from layoffs_staging2;


select * from layoffs_staging2 
where percentage_laid_off = 1 
order by total_laid_off desc;

-- google laid the most
select company , max(total_laid_off) 
from layoffs_staging2
group by company
order by 2 desc;

-- consumer industry laid of the most
select industry , max(total_laid_off) 
from layoffs_staging2
group by industry
order by 2 desc;

-- united states laid of the most
select country , max(total_laid_off) 
from layoffs_staging2
group by country
order by 2 desc;

-- at 2023 the most people were laid off
select year(`date`) , max(total_laid_off) 
from layoffs_staging2
group by year(`date`)
order by 1 desc;

-- Post-IPO was the stage where most got laid off 
select stage , max(total_laid_off) 
from layoffs_staging2
group by stage
order by 2 desc;


select substring(`date`, 1, 7) as `Month` , sum(total_laid_off)
from layoffs_staging2
where substring(`date`, 1, 7) is not null
group by `Month`
order by 1 asc;


with rolling_total as (select substring(`date`, 1, 7) as `Month` , sum(total_laid_off) as laid_off
from layoffs_staging2
where substring(`date`, 1, 7) is not null
group by `Month`
order by 1 asc)

select `Month`, 
laid_off, sum(laid_off) 
over(order by `Month` asc) 
as rolling_sum 
from rolling_total;

-- Uber laid the most people in year 2020 follwed by Booking.com and groupon 
-- Whereas in 2021 Bytedance laid the most people followed by katera and zillow
-- In 2022 Meta laid the most people followed by amazon and cisco
-- And finally in 2023 Google laid of the most follwed by microsoft and Ericsson

with company_year (company ,years, total_laid) as (select company, year(`date`), sum(total_laid_off) as total_sum
from layoffs_staging2
group by company , year(`date`))

select *, dense_rank() over(partition by years  order by total_laid desc) as highest_laid 
from company_year
where years is not null
and total_laid is not null;


with company_year (company ,years, total_laid) as (select company, year(`date`), sum(total_laid_off) as total_sum
from layoffs_staging2
group by company , year(`date`))

select *, dense_rank() over(partition by years  order by total_laid desc) as Ranking 
from company_year
where years is not null
and total_laid is not null
order by Ranking asc;


with company_year (company ,years, total_laid) as (select company, year(`date`), sum(total_laid_off) as total_sum
from layoffs_staging2
group by company , year(`date`)
),
Company_year_Rank as (select *, dense_rank() over(partition by years  order by total_laid desc) as Ranking 
from company_year
where years is not null
and total_laid is not null)

select * from Company_year_Rank
where Ranking <=5;

-- Amazon laid of the most totally 
SELECT company, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
WHERE total_laid_off IS NOT NULL
GROUP BY company
ORDER BY total_laid_off DESC;
