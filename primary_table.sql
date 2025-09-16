--tabulka výběru dat z payroll sekce
CREATE OR REPLACE VIEW v_sarka_payroll as
SELECT 
cp.payroll_year AS year,
round (avg (cp.value)::NUMERIC, 2) AS avg_pay,
cpib.name AS industry,
cp.industry_branch_code 
FROM czechia_payroll cp
JOIN czechia_payroll_industry_branch cpib ON cp.industry_branch_code = cpib.code 
WHERE cp.value_type_code = '5958'
GROUP BY cp.payroll_year, cpib.name , cp.industry_branch_code
ORDER BY YEAR desc, cp.industry_branch_code ;

--tabulka výběru dat z price sekce
CREATE OR REPLACE VIEW v_sarka_price AS
	SELECT 
	round (avg (cprice.value)::NUMERIC, 2) AS avg_price,
	cpc."name" AS category,
	cprice.category_code,
	date_part ('year', cprice.date_from) AS YEAR
	FROM czechia_price cprice
	JOIN czechia_price_category cpc ON cprice.category_code = cpc.code 
	GROUP BY name, YEAR, category_code 
	ORDER BY name, YEAR;

--finalni tabulka
CREATE TABLE t_sarka_celoudova_project_SQL_primary_final as
SELECT 
cp.payroll_year AS year,
avg(cp.value) AS avg_pay,
cpib.name AS industry,
cp.industry_branch_code,
avg(cprice.value) AS avg_price,
cpc."name" AS category,
cprice.category_code
FROM czechia_payroll cp
JOIN czechia_payroll_industry_branch cpib 
	ON cp.industry_branch_code = cpib.code 
	and cp.value_type_code = '5958'
JOIN czechia_price cprice 
	ON cp.payroll_year = date_part ('year', cprice.date_from)
	AND region_code IS null
JOIN czechia_price_category cpc 
	ON cprice.category_code = cpc.code 
GROUP BY cp.payroll_year, cpib.name, cp.industry_branch_code, cpc."name", cprice.category_code
ORDER BY YEAR ;

SELECT*
FROM t_sarka_celoudova_project_SQL_primary_final;