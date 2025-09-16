--druha tabulka

SELECT YEAR, gdp
FROM economies
WHERE country = 'Czech Republic';

SELECT 
t1.*, 
e.gdp
FROM t_sarka_celoudova_project_SQL_primary_final t1
JOIN economies e ON e.YEAR = t1.year
AND country = 'Czech Republic'

CREATE TABLE t_sarka_celoudova_project_SQL_secondary_final AS 
	(SELECT 
	t1.*, 
	e.gdp
	FROM t_sarka_celoudova_project_SQL_primary_final t1
	JOIN economies e ON 
		e.YEAR = t1.YEAR
		AND country = 'Czech Republic');

SELECT *
FROM t_sarka_celoudova_project_sql_secondary_final; 
