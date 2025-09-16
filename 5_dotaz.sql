--5. Má výška HDP vliv na změny ve mzdách a cenách potravin? 
--Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách 
--ve stejném nebo následujícím roce výraznějším růstem?

SELECT*
FROM t_sarka_celoudova_project_sql_secondary_final;

SELECT 
	YEAR,
	avg(avg_pay) AS avg_overall_pay,
	avg(avg_price) AS avg_overall_year,
	gdp
FROM t_sarka_celoudova_project_sql_secondary_final
GROUP BY "year", gdp ; 

SELECT distinct
p1.YEAR,
round(p1.gdp::NUMERIC, 2),
round((((avg(p1.gdp)/avg(p2.gdp))-1)*100)::NUMERIC, 1) AS gdp_increase_percentage,
round((avg(p1.avg_price))::NUMERIC,2) AS avg_overall_price,
round((((avg(p1.avg_price)/avg(p2.avg_price))-1)*100)::NUMERIC, 1) AS price_increase_percentage,
round(((avg(p1.avg_pay)/avg(p2.avg_pay))-1)*100::NUMERIC, 1) AS pay_increase_percentage,
round(avg(p1.avg_pay)::NUMERIC, 2) AS avg_overall_pay
FROM t_sarka_celoudova_project_sql_secondary_final p1
JOIN t_sarka_celoudova_project_sql_secondary_final p2 
     ON p1.industry_branch_code = p2.industry_branch_code
     and p1.category_code = p2.category_code
     and p1.year = p2.year + 1
GROUP BY p1.YEAR, p1.gdp
--HAVING (((avg(p1.gdp)/avg(p2.gdp))-1)*100) > 5
;


--vliv vyraznejsi (>4,5%) zmeny hdp na stavajici a nasledujici rok
SELECT distinct
p1.YEAR,
--round(p1.gdp::NUMERIC, 0)AS gdp,
round((((avg(p1.gdp)/avg(p2.gdp))-1)*100)::NUMERIC, 1) AS gdp_increase_percentage,
--round((avg(p1.avg_price))::NUMERIC,2) AS avg_overall_price,
--round((avg(p3.avg_price))::NUMERIC,2) AS fut_avg_overall_price,
round((((avg(p1.avg_price)/avg(p2.avg_price))-1)*100)::NUMERIC, 1) AS price_increase_percentage,
round((((avg(p3.avg_price)/avg(p1.avg_price))-1)*100)::NUMERIC, 1) AS fut_price_increase_percentage,
round(((avg(p1.avg_pay)/avg(p2.avg_pay))-1)*100::NUMERIC, 1) AS pay_increase_percentage,
round(((avg(p3.avg_pay)/avg(p1.avg_pay))-1)*100::NUMERIC, 1) AS fut_pay_increase_percentage
--round(avg(p1.avg_pay)::NUMERIC, 2) AS avg_overall_pay,
--round(avg(p3.avg_pay)::NUMERIC, 2) AS fut_avg_overall_pay
FROM t_sarka_celoudova_project_sql_secondary_final p1
JOIN t_sarka_celoudova_project_sql_secondary_final p2 
     ON p1.industry_branch_code = p2.industry_branch_code
     and p1.category_code = p2.category_code
     and p1.year = p2.year + 1
JOIN t_sarka_celoudova_project_sql_secondary_final p3
	ON p1.industry_branch_code = p3.industry_branch_code
     and p1.category_code = p3.category_code
     and p1.year = p3.year -1
GROUP BY p1.YEAR, p1.gdp
--HAVING abs(((avg(p1.gdp)/avg(p2.gdp))-1)*100) > 4.5;

