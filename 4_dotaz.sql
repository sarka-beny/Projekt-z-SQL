--4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

SELECT *
FROM t_sarka_celoudova_project_SQL_primary_final ;

--strojové porovnání bez vážených průměrů
SELECT distinct
p1.YEAR,
round( (((avg(p1.avg_pay)/avg(p2.avg_pay))-1)*100)::NUMERIC, 2) AS pay_increase_percentage,
round ((((avg(p1.avg_price)/avg(p2.avg_price))-1)*100)::numeric, 2) AS price_increase_percentage,
round(((((avg(p1.avg_price)/avg(p2.avg_price))-1)*100)- (((avg(p1.avg_pay)/avg(p2.avg_pay))-1)*100))::NUMERIC, 2) AS difference
FROM t_sarka_celoudova_project_SQL_primary_final p1
JOIN t_sarka_celoudova_project_SQL_primary_final p2 
     ON p1.industry_branch_code = p2.industry_branch_code
     and p1.category_code = p2.category_code
     and p1.year = p2.year + 1
GROUP BY p1.YEAR

--porovnání pro zástupce cen potravin - chléb
SELECT distinct
p1.YEAR,
((avg(p1.avg_pay)/avg(p2.avg_pay))-1)*100 AS pay_increase_percentage,
((avg(p1.avg_price)/avg(p2.avg_price))-1)*100 AS price_increase_percentage,
((((avg(p1.avg_price)/avg(p2.avg_price))-1)*100)- (((avg(p1.avg_pay)/avg(p2.avg_pay))-1)*100)) AS difference
FROM t_sarka_celoudova_project_SQL_primary_final p1
JOIN t_sarka_celoudova_project_SQL_primary_final p2 
     ON p1.industry_branch_code = p2.industry_branch_code
     and p1.category_code = p2.category_code
     and p1.year = p2.year + 1
WHERE p1.category = 'Chléb konzumní kmínový'
GROUP BY p1.YEAR
ORDER BY difference desc;
