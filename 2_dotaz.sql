--2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období 
--v dostupných datech cen a mezd?
SELECT *
FROM t_sarka_celoudova_project_sql_primary_final ;

--první a poslední období
SELECT max (year)AS end_year, min (year) AS start_year
FROM t_sarka_celoudova_project_SQL_primary_final ;
-- vrátí hodnoty 2006 a 2018

--průměrná mzda za rok 2006
SELECT
round (avg (avg_pay)::NUMERIC, 2)
FROM t_sarka_celoudova_project_SQL_primary_final
WHERE YEAR = '2006'
--hodnota 20 753,78

--prumerna cena mleka v roce 2006
SELECT DISTINCT
round(avg_price::NUMERIC, 2)
FROM t_sarka_celoudova_project_SQL_primary_final 
WHERE YEAR = '2006' AND category = 'Mléko polotučné pasterované';
--hodnota 14,44

--kolik mleka za rok 2006
SELECT
round ((avg (avg_pay))/ 
	(SELECT DISTINCT 
	round(avg_price::NUMERIC, 2) 
	FROM t_sarka_celoudova_project_SQL_primary_final 
	WHERE YEAR = '2006' AND category = 'Mléko polotučné pasterované')::NUMERIC, 2)
FROM t_sarka_celoudova_project_SQL_primary_final 
WHERE YEAR = '2006';
--hodnota 1437,24

--kolik kilogramů chleba za rok 2006
SELECT
round ((avg (avg_pay))/ 
	(SELECT DISTINCT 
	round(avg_price::NUMERIC, 2) 
	FROM t_sarka_celoudova_project_SQL_primary_final 
	WHERE YEAR = '2006' AND category = 'Chléb konzumní kmínový')::NUMERIC, 2)
FROM t_sarka_celoudova_project_SQL_primary_final
WHERE YEAR = '2006';
--hodnota 1287,46

--kolik mleka za rok 2018
SELECT
round ((avg (avg_pay))/ 
	(SELECT DISTINCT 
	round(avg_price::NUMERIC, 2) 
	FROM v_tabulka1 
	WHERE YEAR = '2018' AND category = 'Mléko polotučné pasterované')::NUMERIC, 2)
FROM v_tabulka1 
WHERE YEAR = '2018';
--hodnota 1641,57

--kolik chleba  za rok 2018
SELECT
round ((avg (avg_pay))/ (SELECT distinct
round (avg_price::NUMERIC,2) 
	FROM v_tabulka1 
	WHERE YEAR = '2018' AND category = 'Chléb konzumní kmínový')::NUMERIC, 2)
FROM v_tabulka1 
WHERE YEAR = '2018';
--1342,24