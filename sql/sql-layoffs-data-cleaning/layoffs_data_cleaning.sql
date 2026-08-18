use sql_project;

-- checking the records
select * from layoffs;

-- creating a staging table to work on 

create table layoffs_staging like layoffs ;

insert layoffs_staging select * from layoffs ;

select * from layoffs_staging; 


-- 1- removing the duplicates
select * , row_number() over(partition by company , industry, total_laid_off, percentage_laid_off, `date`  ) from layoffs_staging;



with duplicate_cte as (select * , row_number() over(partition by company ,location, industry, total_laid_off, percentage_laid_off, `date`, stage , country , funds_raised_millions  ) as row_num from layoffs_staging)

select * from duplicate_cte where row_num>1;


-- creating a diff table to delete the duplicates cos u cant delete thru cte's

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



insert into layoffs_staging2 select * , row_number() over(partition by company ,location, industry, total_laid_off, percentage_laid_off, `date`, stage , country , funds_raised_millions  ) as row_num from layoffs_staging;


select * from layoffs_staging2 where row_num=2;

-- removed the duplicates

delete from layoffs_staging2 where row_num > 1;


select * from layoffs_staging2 where row_num > 1;



-- 2- standardize the data
-- basically checking every column and seeing if we have to change anythin remove space rename anythin 

select * from layoffs_staging2;

-- removing the unwanted space 

update layoffs_staging2 set company = trim(company) ;


select * from layoffs_staging2 where industry like 'Crypto%';

-- basically cryptocurrency and crypto is same so converted cryptocurrency name to crypto 

update layoffs_staging2 set industry = 'Crypto' where industry like 'Crypto%';

-- checking if we have to change anythin in location column
select distinct location from layoffs_staging2 ;


select * from layoffs_staging2 where location = 'DÃ¼sseldorf';

-- checking if we have to change anythin in country column

select distinct country from layoffs_staging2 order by country asc ;


-- renaming united states. to united states

update layoffs_staging2 set country = 'United States'
where country = 'United States.';

-- or

update layoffs_staging2 set country = trim(trailing '.' from country)
where country like 'United States%';


-- converting text date to date format

select `date`, str_to_date(`date`, '%m/%d/%Y') from layoffs_staging2;

update layoffs_staging2 set `date` = str_to_date(`date`, '%m/%d/%Y');

alter table layoffs_staging2 modify column `date` Date;



-- 3- look at null or blank values

select * from layoffs_staging2 where total_laid_off is null and percentage_laid_off is null  ;


select * from layoffs_staging2 where industry is null or industry ='';

select t1.industry, t2.industry
from layoffs_staging2 t1 
join layoffs_staging t2 
on t1.company = t2.company 
where (t1.industry is null or t1.industry = '')
and t2.industry is not null ;

update layoffs_staging2 set industry = null where industry = '';

update  layoffs_staging2 t1 
join layoffs_staging2 t2 
on t1.company = t2.company
set t1.industry = t2.industry 
where (t1.industry is null or t1.industry = '')
and t2.industry is not null ;


-- 4- remove columns which arent necessary


select * from layoffs_staging2 where total_laid_off is null and percentage_laid_off is null  ;


delete from layoffs_staging2 where total_laid_off is null and percentage_laid_off is null  ;

-- removing the row_num column cos its not needed

select * from layoffs_staging2;

alter table layoffs_staging2 drop column row_num;
