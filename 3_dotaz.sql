--3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)? 
SELECT *
FROM t_sarka_celoudova_project_SQL_primary_final;

--jaký byl percentuální meziroční nárust, od nejnižší hodnoty
WITH price_compare AS (
    SELECT 
        p1.category,
        p1.category_code,
  		p1.YEAR,
        p1.avg_price AS price_actual,
        p2.avg_price AS price_previous
    FROM t_sarka_celoudova_project_SQL_primary_final p1
    JOIN t_sarka_celoudova_project_SQL_primary_final p2 
        ON p1.category_code = p2.category_code
        AND p1.year = p2.year + 1
)
SELECT DISTINCT 
	category, 
	category_code,
	round((avg((price_actual/price_previous)-1)*100)::NUMERIC, 2) AS price_increase_percentage,
	year
	FROM price_compare
	GROUP BY category, category_code, year
	ORDER BY price_increase_percentage, YEAR, category ;

--spočtení průměru percentuálního nárůstu
WITH price_compare AS (
    SELECT 
        p1.category,
        p1.category_code,
  		p1.YEAR,
        p1.avg_price AS price_actual,
        p2.avg_price AS price_previous
    FROM t_sarka_celoudova_project_SQL_primary_final p1
    JOIN t_sarka_celoudova_project_SQL_primary_final p2 
        ON p1.category_code = p2.category_code
        AND p1.year = p2.year + 1
)
SELECT DISTINCT 
	category, 
	category_code,
	round((avg((price_actual/price_previous)-1)*100)::NUMERIC, 2) AS avg_price_increase
	FROM price_compare
	GROUP BY category, category_code
	ORDER BY avg_price_increase, category_code ;
