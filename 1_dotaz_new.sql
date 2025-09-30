--1.Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

WITH pay_compare AS (
    SELECT 
        industry,
  		YEAR,
        avg_pay AS avg_payroll_actual,
        LAG(avg_pay) OVER (PARTITION BY industry ORDER BY year) AS avg_payroll_previous
    FROM t_sarka_celoudova_project_SQL_primary_final 
)
SELECT DISTINCT 
	industry,
	YEAR, 
	round (avg_payroll_actual::NUMERIC, 2) AS avg_payroll_actual, 
	round (avg_payroll_previous::NUMERIC, 2) AS avg_payroll_previous
FROM pay_compare
WHERE avg_payroll_actual < avg_payroll_previous 
ORDER BY industry, year;

--kde mzdy pouze rostou
WITH pay_compare AS (
    SELECT 
        industry,
  		YEAR,
        avg_pay AS avg_payroll_actual,
        LAG(avg_pay) OVER (PARTITION BY industry ORDER BY year) AS avg_payroll_previous
    FROM t_sarka_celoudova_project_SQL_primary_final 
)
SELECT industry
FROM pay_compare 
EXCEPT
(SELECT industry
FROM pay_compare 
WHERE avg_payroll_actual <avg_payroll_previous);

