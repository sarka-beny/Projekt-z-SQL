--1.Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

SELECT *
FROM t_sarka_celoudova_project_SQL_primary_final;

--prvni dotaz, porovnání mezd
WITH pay_compare AS (
    SELECT 
        p1.industry,
  		p1.YEAR,
        p1.avg_pay AS avg_payroll_actual,
        p2.avg_pay AS avg_payroll_previous
    FROM t_sarka_celoudova_project_SQL_primary_final p1
    JOIN t_sarka_celoudova_project_SQL_primary_final p2 
        ON p1.industry_branch_code = p2.industry_branch_code
        AND p1.year = p2.year + 1
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
        p1.industry,
        p1.industry_branch_code,
  		p1.YEAR,
        p1.avg_pay AS payroll_actual,
        p2.avg_pay AS payroll_previous
    FROM t_sarka_celoudova_project_SQL_primary_final p1
    JOIN t_sarka_celoudova_project_SQL_primary_final p2 
        ON p1.industry_branch_code = p2.industry_branch_code
        AND p1.year = p2.year + 1
)
SELECT industry
FROM pay_compare 
EXCEPT
(SELECT industry
FROM pay_compare 
WHERE payroll_actual <payroll_previous);

