# **Projekt z SQL**
Cílem projektu je připravit tabulky s daty a zodpovědět na výzkumné otázky týkající se dostupnosti základních potravin široké veřejnosti.\
Tyto otázky jsou definované níže:  
1.Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají\
2.Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?\
3.Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)? \
4.Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?\
5.Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

### **Tabulka č.1**
Prvním krokem je vytvoření tabulky v databázi, která tvoří podklad pro odpověď na výzkumné dotazy. \
První tabulka _t_sarka_celoudova_project_SQL_primary_final_ obsahuje data mezd a cen potravin za Českou republiku. V tabulce najdeme údaje sjednocené na společné porovnatelné období, a to roky 2006 - 2018, bohužel pro ostatní období (2000-2005 a 2019-2021) nemáme datové údaje o cenách potravin. Využívají se data za celý kalendářní rok, rozpad dat na kvartály není poskytnut z důvodů očištění od možných sezónních výkyvů (např. ceny ovoce a zeleniny se mění v závislosti na období sklizně).

## 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
Odvětvími, ve kterých mzda v průběhu let pouze roste, jsou : _Zpracovatelský průmysl, Doprava a skladování, Zdravotní a sociální péče, Ostatní činnosti._

Neexistuje žádné odvětví, ve kterém by neustále v celém sledovaném období mzdy pouze klesaly. Máme ovšem odvětví, kde mzdy meziročně klesají. Nejvíce postižené je odvětví _Těžba a dobývání_, kde mzdy klesaly oproti předchozímu roku celkem 4x, a to v letech 2009, 2013, 2014 a 2016. Meziroční pokles mezd se objevuje nejvíce v roce _2013_, kde jej zaznamenalo celkem 11 odvětví.

Níže je přiložená tabulka ukazující odvětví a rok, ve kterých byl zaznamenán meziroční pokles mezd.
|odvětví|rok|mzda aktuální|mzda předchozí rok|
|--------|----|--------------|----------------|
|Administrativní a podpůrné činnosti|2013|16427.63|16487.75|
|Informační a komunikační činnosti|2013|45697.50|46165.25|
|Kulturní, zábavní a rekreační činnosti|2011|19213.63|19222.50|
|Kulturní, zábavní a rekreační činnosti|2013|19901.75|20179.38|
|Peněžnictví a pojišťovnictví|2013|45775.00|50253.50|
|Profesní, vědecké a technické činnosti|2010|30848.25|31037.63|
|Profesní, vědecké a technické činnosti|2013|31049.50|31979.00|
|Stavebnictví|2013|22226.50|22710.75|
|Těžba a dobývání|2009|28160.50|29254.25|
|Těžba a dobývání|2013|31586.13|32513.63|
|Těžba a dobývání|2014|31336.00|31586.13|
|Těžba a dobývání|2016|31487.13|31674.00|
|Ubytování, stravování a pohostinství|2009|12058.13|12204.50|
|Ubytování, stravování a pohostinství|2011|12781.25|12924.88|
|Velkoobchod a maloobchod; opravy a údržba motorových vozidel|2013|22666.75|22882.38|
|Veřejná správa a obrana; povinné sociální zabezpečení|2010|26707.00|26794.88|
|Veřejná správa a obrana; povinné sociální zabezpečení|2011|26109.00|26707.00|
|Vzdělávání|2010|21975.50|22388.38|
|Výroba a rozvod elektřiny, plynu, tepla a klimatiz. vzduchu|2013|40530.75|42382.25|
|Výroba a rozvod elektřiny, plynu, tepla a klimatiz. vzduchu|2015|40483.50|41022.50|
|Zemědělství, lesnictví, rybářství|2009|17418.75|17528.13|
|Zásobování vodou; činnosti související s odpady a sanacemi|2013|23400.00|23489.63|
|Činnosti v oblasti nemovitostí|2013|21622.75|21995.50|

## 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
K zodpovězení druhého dotazu je nejprve nutné nadefinovat první a poslední srovnatelné období. Jelikož nebereme v potaz kvartální data kvůli možným sezónním vlivům, jedná se o porovnání let 2006 a 2018.

V roce _2006_ bylo možné si za průměrnou mzdu v daném období koupit _1437,24 litrů mléka_ nebo _1287,46 kilogramů chleba_.

V roce _2018_ bylo možné si za průměrnou mzdu v daném období koupit _1641,57 litrů mléka_ nebo _1342,24 kilogramů_ chleba.

## 3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)? 
Tuto otázku je možné zodpovědět dvěma způsoby, nalezení kategorie potravin, kde je nejnižší průměrný procentuální meziroční nárůst ceny a kategorie potravin, která zaznamenala nejnižší hodnotu procentuálního meziročního nárůstu ceny:

Nejnižší průměrný procentuální meziroční nárůst cen je u kategorie _Cukr krystalový_, kde v průměru cena poklesla o 1,92%. 

Pokud bychom hledali potravinu, která zdražuje, ale nejpomaleji, jedná se o Banány žluté, kde cena v průměru rostla o 0,81%.

Historicky nejnižší hodnotu procentuálního meziročního nárůstu v jednom roce byla u kategorie Rajská jablka červená kulatá, kdy cena mezi lety 2007 a 2006 poklesla o 30,28%. (Tato kategorie ovšem zaznamenala i vysoké výkyvy vzrůstu cen, v průměru za sledované období meziroční cena poklesla o 0,74%.

## 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
Je možné strojově porovnat meziroční nárůst pro všechny kategorie potravin, které máme k dispozici a meziroční růst mezd. Zde _není případ, že by byl meziroční nárůst cen potravin výrazně vyšší než růst mezd_. Nejblíže je rok 2009, kdy byl rozdíl mezi meziročním nárůstem cen potravin a růst mezd 9,57%. Následující tabulka ukazuje meziroční růst a jejich rozdíl.
|rok|růst mezd|růst cen potravin|rozdíl(ceny potraviny-mzdy)|
|----|-----------------------|-------------------------|----------|
|2007|6.84|6.76|-0.07|
|2008|7.87|6.18|-1.69|
|2009|3.16|-6.41|-9.57|
|2010|1.95|1.94|-0.01|
|2011|2.30|3.35|1.05|
|2012|3.03|6.73|3.70|
|2013|-1.56|5.10|6.65|
|2014|2.56|0.74|-1.82|
|2015|2.51|-2.91|-5.42|
|2016|3.65|-1.19|-4.84|
|2017|6.28|9.63|3.35|
|2018|7.62|2.17|-5.46|

Zvednutí ceny u potraviny, které spotřebitelé kupují nejvíce má určitě větší dopad než to samé zvýšení ceny u málo kupované potraviny (např. chléb a kapr). Z tohoto důvodu by bylo vhodné _spočítat nárůst cen u spotřebního koše spotřebitele (vážený průměr), neboli zvýšení/snížení cenové hladiny a tu porovnat s růstem mezd_. K takovému porovnání nám ovšem chybí data.\
K alespoň částečnému zodpovězení dotazu, ovšem rozhodně ne ideálnímu, můžeme zvolit často nakupovanou složku potravin, např. chléb, který nám může zastupovat všechny potraviny. Pokud bychom porovnávali meziroční nárůst cen chleba a růst mezd, zde dostaneme 3 roky, kde máme výrazné navýšení ceny chleba oproti růstu mzdy: 2011, 2008, 2007. Může však jít o změnu platnou pouze u chleba a nelze z ní poskytnout velkou vypovídající hodnotu.

### **Tabulka č.2**
Poslední dotaz vyžaduje pracovat s daty HDP. Z tohto důvodu využíváme data o HDP pro Českou republiku z původní tabulky economies a přidávají se k tabulce č.1. Vzniklá tabulka nese název _t_sarka_celoudova_project_SQL_secondary_final_.

## 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
Z dostupných dat se zdá, že _výrazné zvýšení HDP (změna vetší než 5%) se projeví na změnách cen potravin okamžitě, výše mezd se projevuje především v roce následujícím_.

Následující tabulka ukazuje meziroční změny v HDP a změny v cenách potravin a mezd (procentuální, meziroční, T+1 označuje následující rok):
|rok|změna_HDP|změna_ceny|T+1_změna_ceny|změna_mzda|T+1_změna_mzda|
|----|-----------------------|-------------------------|-----------------------------|-----------------------|---------------------------|
|2007|***5.6***|***6.8***|***6.2***|***6.8***|***7.9***|
|2008|2.7|6.2|-6.4|7.9|3.2|
|2009|***-4.7***|***-6.4***|***1.9***|***3.2***|***2.0***|
|2010|2.4|1.9|3.3|2.0|2.3|
|2011|1.8|3.4|6.7|2.3|3.0|
|2012|-0.8|6.7|5.1|3.0|-1.6|
|2013|0.0|5.1|0.7|-1.6|2.6|
|2014|2.3|0.7|-2.9|2.6|2.5|
|2015|***5.4***|***-2.9***|***-1.4***|***2.5***|***3.6***|
|2016|2.5|-1.2|9.6|3.6|6.3|
|2017|***5.2***|***9.6***|***2.2***|***6.3***|***7.6***|

Jako zdrojová data pro tuto otázku je použita tabulka č.2. Mzdy zde vstupují v agregátní hodnotě jako průměrná mzda v daném roce, bez ohledu na rozčlenění mezi odvětví. Stejně je braná i hodnota cen, použita je průměrná hodnota cen všech potravin, data nejsou rozdělena na jednotlivé kategorie potravin. Jako ukazatel změny je využita meziroční procentuální změna. 

Porovnáváme údaje z poměrně krátkého časového období, pro lépe vypovídající analýzu by bylo vhodné porovnat přidat data z delšího období, které bohužel nemáme. Dále by mohla pomoci s analýzou také korelace nebo regrese, které by mohly ještě lépe ukázat vzájemnou závislost HDP a růst cen potravin a mezd. Trochu zavádějícím obdobím je také rok 2015, kde ačkoliv dojde k výraznému růstu HDP (+5%), ceny potravin se meziročně snižují (-3%). To by mohlo vyvracovat hypotézu, že výrazné zvýšení HDP má okamžitý vliv na zvýšení cen potravin, ale také může být projevem jiných makroekonomických vlivů ovlivňující ceny potravin v daném roce. Domnívám se, že by pokles cen potravin v roce 2015 mohl být vysvětlen výrazným propadem cen ropy a pohonných hmot (https://statistikaamy.csu.gov.cz/ekonomika-cr-v-roce-2015).
