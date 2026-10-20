ALTER TABLE employee_clean RENAME TO empl;
SELECT * FROM empl;

--1 Сколько всего сотрудников в датасете?
SELECT COUNT(*) FROM empl; 

--2 Какое распределение по полу (Gender)?
SELECT gender, COUNT(*) FROM empl GROUP BY gender; 

--3 Какое распределение по семейному положению (MaritalStatus)?
SELECT maritalstatus, COUNT(*) FROM empl GROUP BY maritalstatus; 

--4 Какое распределение по департаментам (Department)?
SELECT department, COUNT (*) FROM empl GROUP BY department; 

--5 Какое распределение по должностям (JobRole)?
SELECT jobrole, COUNT (*) FROM empl GROUP BY jobrole;

--6 Какое распределение по уровню образования (Education)?
SELECT education, COUNT (*) FROM empl GROUP BY education;

--7 Какое распределение по области образования (EducationField)?
SELECT educationfield, COUNT (*) FROM empl GROUP BY educationfield;

--8 Какое распределение по бизнес-поездкам (BusinessTravel)?
SELECT businesstravel, COUNT (*) FROM empl GROUP BY businesstravel;

--9 Какое распределение по сверхурочным (OverTime)?
SELECT overtime, COUNT (*) FROM empl GROUP BY overtime;

--10 Средний, медианный, минимальный и максимальный возраст.
SELECT AVG(age), PERCENTILE_CONT (0.5) WITHIN GROUP (ORDER BY age), MIN(age), MAX(age) FROM empl;

--11 Средний, медианный, минимальный и максимальный месячный доход.
SELECT AVG(monthlyincome), PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY monthlyincome), MIN(monthlyincome), MAX(monthlyincome)
FROM empl;

--12 Средний стаж работы в компании (YearsAtCompany)
SELECT AVG (yearsatcompany) FROM empl;

--13 Средний общий стаж (TotalWorkingYears).
SELECT AVG(totalworkingyears) FROM empl;

--14 Средний стаж в текущей роли (YearsInCurrentRole).
SELECT AVG(yearsincurrentrole) FROM empl;

--15 Средний стаж с текущим руководителем (YearsWithCurrManager).
SELECT AVG(yearswithcurrmanager) FROM empl;

--16 Средний стаж с последнего повышения (YearsSinceLastPromotion).
SELECT AVG(yearssincelastpromotion) FROM empl;

--17 Средний процент повышения зарплаты (PercentSalaryHike)
SELECT AVG(percentsalaryhike) FROM empl;

--18 Средний уровень вовлечённости (JobInvolvement).
SELECT AVG(jobinvolvement) FROM empl;

--19 Средняя удовлетворённость работой (JobSatisfaction).
SELECT AVG(jobsatisfaction) FROM empl;

--20 Средняя удовлетворённость отношениями (RelationshipSatisfaction).
SELECT AVG(relationshipsatisfaction) FROM empl;

--21 Средний баланс работы и личной жизни (WorkLifeBalance).
SELECT AVG(worklifebalance) FROM empl;

--22 Средняя удовлетворённость окружением (EnvironmentSatisfaction).
SELECT AVG(environmentsatisfaction) FROM empl;

--23 Средний рейтинг производительности (PerformanceRating).
SELECT AVG(performancerating) FROM empl;

--24 Средний уровень опциона на акции (StockOptionLevel).
SELECT AVG(stockoptionlevel) FROM empl;

--25 Среднее количество компаний, в которых работал сотрудник (NumCompaniesWorked).
SELECT AVG(numcompaniesworked) FROM empl;

--26 Среднее количество обучений за последний год (TrainingTimesLastYear).
SELECT AVG(trainingtimeslastyear) FROM empl;

--27 Общий процент текучести (Attrition = Yes)
SELECT AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 FROM empl;

--28 Текучесть по полу.
SELECT gender, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes,
COUNT (*) * 100.0 / SUM(COUNT(*)) OVER() AS prcnt
FROM empl GROUP BY gender; 

--29 Текучесть по департаментам.
SELECT department, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes FROM empl 
GROUP BY department;

--30 Текучесть по должностям.
SELECT jobrole, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) FROM empl GROUP BY jobrole
ORDER BY attr_yes DESC;

--31 Текучесть по семейному положению.
SELECT maritalstatus, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) FROM empl GROUP BY maritalstatus;

--32 Текучесть по уровню образования.
SELECT education, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) FROM empl GROUP BY education;

--33 Текучесть по области образования
SELECT educationfield, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) 
FROM empl GROUP BY educationfield;

--34 Текучесть по бизнес-поездкам.
SELECT * FROM empl;
SELECT businesstravel, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) 
FROM empl GROUP BY businesstravel;

--35 Текучесть по сверхурочным
SELECT overtime, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) 
FROM empl GROUP BY overtime; 

--36 Текучесть по уровню вовлечённости
SELECT jobinvolvement, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) 
FROM empl GROUP BY jobinvolvement; 

--37 Текучесть по удовлетворённости работой.
SELECT jobsatisfaction, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) 
FROM empl GROUP BY jobsatisfaction; 

--38 Текучесть по балансу работы и личной жизни.
SELECT worklifebalance, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) 
FROM empl GROUP BY worklifebalance; 

--39 Текучесть по уровню дохода (группы).
SELECT (CASE WHEN monthlyincome < 3000 THEN '< 3000'
WHEN monthlyincome < 6000 THEN '> 3000 BUT < 6000'
WHEN monthlyincome < 9000 THEN '> 6000 BUT < 9000'
WHEN monthlyincome < 12000 THEN '> 9000 BUT < 12000'
WHEN monthlyincome < 15000 THEN '> 12000 BUT < 15000' ELSE '> 15000' END) AS qualification,
(AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS prcnt_attr, COUNT(*) FROM empl
GROUP BY qualification ORDER BY prcnt_attr  DESC; 

--40 Текучесть по возрасту (группы).
SELECT age, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) 
FROM empl GROUP BY age ORDER BY attr_yes DESC;

--41 Текучесть по стажу в компании (группы)
SELECT (CASE WHEN yearsatcompany = 1 THEN '1_year_at_company'
WHEN yearsatcompany = 2 THEN '2_years_at_company'
WHEN yearsatcompany = 3 THEN '3_years_at_company'
WHEN yearsatcompany = 4 THEN '4_years_at_company'
WHEN yearsatcompany = 5 THEN '5_years_at_company'
WHEN yearsatcompany = 6 THEN '6_years_at_company'
WHEN yearsatcompany = 7 THEN '7_years_at_company'
WHEN yearsatcompany = 8 THEN '8_years_at_company'
WHEN yearsatcompany = 9 THEN '9_years_at_company'
WHEN yearsatcompany = 10 THEN 'aten_years_at_company'
WHEN yearsatcompany = 11 THEN 'beleven_years_at_company' ELSE 'cMore_than_11_years' END) AS years_in_company,
(AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) FROM empl GROUP BY years_in_company
ORDER BY years_in_company;

--42 Текучесть по общему стажу (группы)
SELECT (CASE WHEN totalworkingyears = 1 THEN '1_year_of_working'
WHEN totalworkingyears = 2 THEN '2_year_of_working'
WHEN totalworkingyears = 3 THEN '3_year_of_working'
WHEN totalworkingyears = 4 THEN '4_year_of_working'
WHEN totalworkingyears = 5 THEN '5_year_of_working'
WHEN totalworkingyears = 6 THEN '6_year_of_working'
WHEN totalworkingyears = 7 THEN '7_year_of_working'
WHEN totalworkingyears = 8 THEN '8_year_of_working'
WHEN totalworkingyears = 9 THEN '9_year_of_working'
WHEN totalworkingyears = 10 THEN 'aten_years_of_working'
WHEN totalworkingyears = 11 THEN 'beleven_years_of_working' ELSE 'cMore_than_11_years' END) AS years_of_working,
(AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) FROM empl GROUP BY years_of_working
ORDER BY years_of_working;

--43 Текучесть по количеству компаний (группы).
SELECT (CASE WHEN numcompaniesworked = 1 THEN '1_company'
WHEN numcompaniesworked = 2 THEN '2_company'
WHEN numcompaniesworked = 3 THEN '3_company'
WHEN numcompaniesworked = 4 THEN '4_company'
WHEN numcompaniesworked = 5 THEN '5_company'
WHEN numcompaniesworked = 6 THEN '6_company'
WHEN numcompaniesworked = 7 THEN '7_company'
WHEN numcompaniesworked = 8 THEN '8_company'
WHEN numcompaniesworked = 9 THEN '9_company'
WHEN numcompaniesworked = 10 THEN 'aten_companies'
WHEN numcompaniesworked = 11 THEN 'beleven_companies' ELSE 'cMore_than_11_companies' END) AS num_of_companies,
(AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) FROM empl
GROUP BY num_of_companies ORDER BY num_of_companies;

--44 Текучесть по расстоянию от дома.
SELECT (CASE WHEN distancefromhome < 5 THEN '1-4'
WHEN distancefromhome < 10 THEN '5-9'
WHEN distancefromhome < 15 THEN '10-14'
WHEN distancefromhome < 20 THEN '15-19'
WHEN distancefromhome < 25 THEN '20-24'
WHEN distancefromhome < 30 THEN '25-29'
WHEN distancefromhome < 35 THEN '30-34'
WHEN distancefromhome < 40 THEN '35-39'
WHEN distancefromhome < 45 THEN '40-44'
WHEN distancefromhome < 50 THEN '45-49'
WHEN distancefromhome < 55 THEN '50-54'
WHEN distancefromhome < 60 THEN '55-59'
WHEN distancefromhome < 65 THEN '60-64' ELSE 'More_then_64' END) AS classification,
(AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) FROM empl
GROUP BY classification ORDER BY attr_yes;

--45 Текучесть по уровню должности (JobLevel)
SELECT joblevel, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) 
FROM empl GROUP BY joblevel ORDER BY attr_yes DESC;

--46 Текучесть по рейтингу производительности
SELECT performancerating, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) 
FROM empl GROUP BY performancerating ORDER BY performancerating;  

--47 Текучесть по опционам на акции
SELECT stockoptionlevel, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) 
FROM empl GROUP BY stockoptionlevel ORDER BY stockoptionlevel;

--48 Текучесть по проценту повышения зарплаты
SELECT percentsalaryhike, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) 
FROM empl GROUP BY percentsalaryhike ORDER BY attr_yes;

--49 Текучесть по стажу в текущей роли
SELECT yearsincurrentrole, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) 
FROM empl GROUP BY yearsincurrentrole ORDER BY yearsincurrentrole;

--50 Текучесть по стажу с последнего повышения
SELECT yearssincelastpromotion, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) 
FROM empl GROUP BY yearssincelastpromotion ORDER BY attr_yes;

--51 Текучесть по стажу с текущим руководителем
SELECT yearswithcurrmanager, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes, COUNT (*) 
FROM empl GROUP BY yearswithcurrmanager HAVING COUNT(*) > 10 ORDER BY yearswithcurrmanager; 
SELECT * FROM empl;

--63 Средний доход по стажу в компании (группы)
SELECT (CASE WHEN yearsatcompany = 1 THEN '1_year_at_company'
WHEN yearsatcompany = 2 THEN '2_years_at_company'
WHEN yearsatcompany = 3 THEN '3_years_at_company'
WHEN yearsatcompany = 4 THEN '4_years_at_company'
WHEN yearsatcompany = 5 THEN '5_years_at_company'
WHEN yearsatcompany = 6 THEN '6_years_at_company'
WHEN yearsatcompany = 7 THEN '7_years_at_company'
WHEN yearsatcompany = 8 THEN '8_years_at_company'
WHEN yearsatcompany = 9 THEN '9_years_at_company'
WHEN yearsatcompany = 10 THEN 'aten_years_at_company'
WHEN yearsatcompany = 11 THEN 'beleven_years_at_company' ELSE 'cMore_than_11_years' END) AS years_in_company,
AVG(monthlyincome) AS avg_profit FROM empl GROUP BY years_in_company ORDER BY years_in_company;

--64 Средний доход по общему стажу (группы)
SELECT (CASE WHEN totalworkingyears = 1 THEN '1_year_of_working'
WHEN totalworkingyears = 2 THEN '2_year_of_working'
WHEN totalworkingyears = 3 THEN '3_year_of_working'
WHEN totalworkingyears = 4 THEN '4_year_of_working'
WHEN totalworkingyears = 5 THEN '5_year_of_working'
WHEN totalworkingyears = 6 THEN '6_year_of_working'
WHEN totalworkingyears = 7 THEN '7_year_of_working'
WHEN totalworkingyears = 8 THEN '8_year_of_working'
WHEN totalworkingyears = 9 THEN '9_year_of_working'
WHEN totalworkingyears = 10 THEN 'aten_years_of_working'
WHEN totalworkingyears = 11 THEN 'beleven_years_of_working' ELSE 'cMore_than_11_years' END) AS years_of_working,
AVG(monthlyincome) AS avg_profit FROM empl GROUP BY years_of_working ORDER BY years_of_working;

--161 Процент сотрудников, работающих сверхурочно.
SELECT AVG(CASE WHEN overtime = 'Yes' THEN 1 ELSE 0 END) * 100 FROM empl;

--162 Процент сверхурочных по департаментам.
SELECT department, (AVG(CASE WHEN overtime = 'Yes' THEN 1 ELSE 0 END) * 100) AS prcnt FROM empl GROUP BY department;

--163 Процент сверхурочных по должностям.
SELECT jobrole, (AVG(CASE WHEN overtime = 'Yes' THEN 1 ELSE 0 END) * 100) AS prcnt FROM empl GROUP BY jobrole ORDER BY prcnt DESC;

--164 Процент сверхурочных по полу.
SELECT gender, (AVG(CASE WHEN overtime = 'Yes' THEN 1 ELSE 0 END) * 100) AS prcnt FROM empl GROUP BY gender ORDER BY prcnt DESC;

--165 Процент сверхурочных по семейному положению.
SELECT maritalstatus, (AVG(CASE WHEN overtime = 'Yes' THEN 1 ELSE 0 END) * 100) AS prcnt FROM empl GROUP BY maritalstatus ORDER BY prcnt DESC;

--166 Средний доход сотрудников, работающих сверхурочно, vs не работающих.
SELECT (CASE WHEN overtime = 'Yes' THEN 'overtimed' ELSE 'not overtimed' END) AS class, AVG(monthlyincome) FROM empl 
GROUP BY class;

--167 Средний баланс работы и личной жизни у работающих сверхурочно vs не работающих.
SELECT (CASE WHEN overtime = 'Yes' THEN 'overtimed' ELSE 'not overtimed' END) AS class, AVG(worklifebalance) FROM empl 
GROUP BY class;

--168 Средняя удовлетворённость работой у работающих сверхурочно vs не работающих.
SELECT (CASE WHEN overtime = 'Yes' THEN 'overtimed' ELSE 'not overtimed' END) AS class, AVG(jobsatisfaction) FROM empl 
GROUP BY class;

--169 Процент сотрудников, часто путешествующих.
SELECT AVG(CASE WHEN businesstravel = 'Travel_Frequently' THEN 1 ELSE 0 END) * 100.0 FROM empl;

--170 Процент частых поездок по департаментам.
SELECT department, (AVG(CASE WHEN businesstravel = 'Travel_Frequently' THEN 1 ELSE 0 END) * 100.0) AS prcnt FROM empl 
GROUP BY department;

--171 Процент частых поездок по должностям.
SELECT jobrole, (AVG(CASE WHEN businesstravel = 'Travel_Frequently' THEN 1 ELSE 0 END) * 100.0) AS prcnt FROM empl 
GROUP BY jobrole ORDER BY prcnt DESC;

--172 Средний доход сотрудников, часто путешествующих, vs остальных.
SELECT (CASE WHEN businesstravel = 'Travel_Frequently' THEN 'often_travveling' ELSE 'not_often_travelling' END) AS classification,
AVG(monthlyincome) FROM empl GROUP BY classification ORDER BY avg DESC;

--173 Средний баланс работы и личной жизни у часто путешествующих vs остальных.
SELECT (CASE WHEN businesstravel = 'Travel_Frequently' THEN 'often_travveling' ELSE 'not_often_travelling' END) AS classification,
AVG(worklifebalance) FROM empl GROUP BY classification ORDER BY avg DESC;

--174 Текучесть среди часто путешествующих vs остальных.
SELECT (CASE WHEN businesstravel = 'Travel_Frequently' THEN 'often_travveling' ELSE 'not_often_travelling' END) AS classification,
(AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS attr_yes FROM empl GROUP BY classification ORDER BY attr_yes DESC;

--175 Распределение уровня опциона на акции.
SELECT stockoptionlevel, COUNT (*), (COUNT (*) * 100.0/ SUM(COUNT(*)) OVER()) AS prcnt FROM empl
GROUP BY stockoptionlevel;

--176 Средний доход по уровню опциона на акции.
SELECT stockoptionlevel, AVG(monthlyincome) FROM empl GROUP BY stockoptionlevel ORDER BY avg DESC;

--177 Средний стаж по уровню опциона на акции.
SELECT stockoptionlevel, AVG(yearsatcompany) FROM empl GROUP BY stockoptionlevel ORDER BY avg DESC;

--178 Текучесть по уровню опциона на акции.
SELECT stockoptionlevel, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) as prcnt_of_attr FROM empl GROUP BY stockoptionlevel
ORDER BY prcnt_of_attr DESC;

--179 Средний процент повышения зарплаты по уровню опциона на акции.
SELECT stockoptionlevel, AVG(percentsalaryhike) FROM empl GROUP BY stockoptionlevel;
SELECT * FROM empl;

--206 Найти сотрудников с доходом выше 95-го перцентиля.
SELECT employeenumber, monthlyincome FROM empl WHERE monthlyincome > 
(SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY monthlyincome) FROM empl);

--207 Найти сотрудников с доходом ниже 5-го перцентиля.
SELECT employeenumber, monthlyincome FROM empl WHERE monthlyincome <
(SELECT PERCENTILE_CONT(0.05) WITHIN GROUP (ORDER BY monthlyincome) FROM empl);

--208 Найти сотрудников с возрастом выше 95-го перцентиля.
SELECT employeenumber, age FROM empl WHERE age >
(SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY age) FROM empl);

--209 Найти сотрудников с возрастом ниже 5-го перцентиля.
SELECT employeenumber, age FROM empl WHERE age <
(SELECT PERCENTILE_CONT(0.05) WITHIN GROUP (ORDER BY age) FROM empl);

--210 Найти сотрудников со стажем выше 95-го перцентиля.
SELECT employeenumber, yearsatcompany FROM empl WHERE yearsatcompany >
(SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY yearsatcompany) FROM empl);

--211 Найти сотрудников с количеством компаний выше 95-го перцентиля.
SELECT employeenumber, numcompaniesworked FROM empl WHERE numcompaniesworked >
(SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY numcompaniesworked) FROM empl);

--212 Найти сотрудников с расстоянием от дома выше 95-го перцентиля.
SELECT employeenumber, distancefromhome FROM empl WHERE distancefromhome >
(SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY distancefromhome) FROM empl);

--213 Найти сотрудников с процентом повышения зарплаты выше 95-го перцентиля.
SELECT employeenumber, percentsalaryhike FROM empl WHERE percentsalaryhike >
(SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY percentsalaryhike) FROM empl);

--214 Найти сотрудников с балансом работы и личной жизни = 1 (худший).
SELECT employeenumber, worklifebalance FROM empl WHERE worklifebalance = 1

--215 Найти сотрудников с удовлетворённостью работой = 1 (худшая).
SELECT employeenumber, jobsatisfaction FROM empl WHERE jobsatisfaction=1;

--216 Создать возрастные группы (18–25, 26–35, 36–45, 46–55, 56+) и посчитать текучесть.
SELECT CASE WHEN age >=18 AND age <=25 THEN 'От 18 до 25'
WHEN age >=26 AND age <=35 THEN 'От 26 до 35'
WHEN age >=36 AND age <=45 THEN 'От 36 до 45'
WHEN age >=46 AND age <=55 THEN 'От 46 до 55'
ELSE 'Больше 56' END AS "groups", AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 AS prcnt
FROM empl GROUP BY groups ORDER BY prcnt;

--217 Создать возрастные группы и посчитать средний доход.
SELECT CASE WHEN age >=18 AND age <=25 THEN 'От 18 до 25'
WHEN age >=26 AND age <=35 THEN 'От 26 до 35'
WHEN age >=36 AND age <=45 THEN 'От 36 до 45'
WHEN age >=46 AND age <=55 THEN 'От 46 до 55'
ELSE 'Больше 56' END AS "groups", AVG(monthlyincome) FROM empl GROUP BY groups ORDER BY avg;

--218 Создать возрастные группы и посчитать средний стаж.
SELECT CASE WHEN age >=18 AND age <=25 THEN 'От 18 до 25'
WHEN age >=26 AND age <=35 THEN 'От 26 до 35'
WHEN age >=36 AND age <=45 THEN 'От 36 до 45'
WHEN age >=46 AND age <=55 THEN 'От 46 до 55'
ELSE 'Больше 56' END AS "groups", AVG(yearsatcompany) FROM empl GROUP BY groups ORDER BY avg;

--219 Создать группы по стажу (0–2, 3–5, 6–10, 11–20, 21+) и посчитать текучесть.
SELECT CASE WHEN yearsatcompany >=0 AND yearsatcompany<=2 	THEN 'От 0 до 2 лет'
WHEN yearsatcompany >=3 AND yearsatcompany<=5 	THEN 'От 3 до 5 лет'
WHEN yearsatcompany >=6 AND yearsatcompany<=10 	THEN 'От 6 до 10 лет'
WHEN yearsatcompany >=11 AND yearsatcompany<=20 	THEN 'От 11 до 20 лет'
ELSE 'Более 21 года' END AS grouppa, (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) AS prcnt FROM empl 
GROUP BY grouppa ORDER BY prcnt DESC;

--220 Создать группы по стажу и посчитать средний доход.
SELECT CASE WHEN yearsatcompany >=0 AND yearsatcompany<=2 	THEN 'От 0 до 2 лет'
WHEN yearsatcompany >=3 AND yearsatcompany<=5 	THEN 'От 3 до 5 лет'
WHEN yearsatcompany >=6 AND yearsatcompany<=10 	THEN 'От 6 до 10 лет'
WHEN yearsatcompany >=11 AND yearsatcompany<=20 	THEN 'От 11 до 20 лет'
ELSE 'Более 21 года' END AS groupw, AVG(monthlyincome) FROM empl GROUP BY groupw ORDER BY avg;

--221 Создать группы по доходу (низкий, средний, высокий) и посчитать текучесть.
WITH virok AS (SELECT attrition, NTILE(3) OVER (ORDER BY monthlyincome) AS ntillle FROM empl)
SELECT CASE ntillle WHEN 1 THEN 'Низкий'
WHEN 2 THEN 'Средний'
WHEN 3 THEN 'Высокий' END AS class, AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 AS prcnt FROM virok
GROUP BY class ORDER BY prcnt DESC;

--222 Создать группы по доходу и посчитать средний стаж.
WITH virok AS (SELECT yearsatcompany, NTILE(3) OVER (ORDER BY monthlyincome) AS ntillle FROM empl)
SELECT CASE ntillle WHEN 1 THEN 'Низкий'
WHEN 2 THEN 'Средний'
WHEN 3 THEN 'Высокий' END AS class, AVG(yearsatcompany) FROM virok GROUP BY class;

--223 Создать группы по количеству компаний (0, 1–2, 3–5, 6+) и посчитать текучесть.
SELECT (CASE WHEN numcompaniesworked = 0 THEN '0'
WHEN numcompaniesworked >=1 AND numcompaniesworked <=2 THEN '1-2'
WHEN numcompaniesworked >=3 AND numcompaniesworked <=5 THEN '3-5'
ELSE '6+' END) AS groupped, AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100 AS prcnt 
GROUP BY groupped ORDER BY prcnt;

--224 Создать группы по расстоянию от дома (близко, средне, далеко) и посчитать текучесть.
WITH virok AS (SELECT attrition, NTILE(3) OVER(ORDER BY distancefromhome) AS ntillle FROM empl)
SELECT CASE WHEN ntillle = 1 THEN 'Близко'
WHEN ntillle = 2 THEN 'Средне'
WHEN ntillle = 3 THEN 'Далеко' END AS class, AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 AS prcnt_off_attrition
FROM virok GROUP BY class ORDER BY prcnt_off_attrition 

--225 Создать группы по расстоянию от дома и посчитать средний доход.
WITH virok AS (SELECT monthlyincome, NTILE(3) OVER(ORDER BY distancefromhome) AS ntillle FROM empl)
SELECT CASE WHEN ntillle = 1 THEN 'Близко'
WHEN ntillle = 2 THEN 'Средне'
WHEN ntillle = 3 THEN 'Далеко' END AS class, AVG(monthlyincome) FROM virok
GROUP BY class ORDER BY avg DESC;
SELECT * FROM empl;

--251 Какие департаменты имеют наибольшую текучесть?
SELECT department, AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) *100.0 AS prcnt FROM empl
GROUP BY department ORDER BY prcnt;

--252 Какие должности имеют наибольшую текучесть?
SELECT jobrole, AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) *100.0 AS prcnt FROM empl
GROUP BY jobrole ORDER BY prcnt; 

--253 Какие сотрудники наиболее склонны к увольнению?
SELECT CASE WHEN age >=18 AND age <=25 THEN 'От 18 до 25'
WHEN age >=26 AND age <=35 THEN 'От 26 до 35'
WHEN age >=36 AND age <=45 THEN 'От 36 до 45'
WHEN age >=46 AND age <=55 THEN 'От 46 до 55'
ELSE 'Больше 56' END AS "age_group", maritalstatus, department, overtime, COUNT (*) AS count_of_number,
AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) *100.0 AS prcnt_of_attrition 
FROM empl GROUP BY age_group, maritalstatus, department, overtime HAVING COUNT (*) > 10
ORDER BY prcnt_of_attrition DESC LIMIT 10;

--254 Какие факторы наиболее сильно влияют на текучесть?
WITH virok AS (SELECT 'Сверхурочные' AS format, CASE WHEN overtime = 'Yes' THEN 'Да' ELSE 'Нет' END AS status, COUNT(*) AS значение,
AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 AS prcnt_of_attr FROM empl
GROUP BY status
UNION ALL
SELECT 'Материальное положение', maritalstatus, COUNT(*),
AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 AS prcnt_of_attr FROM empl
GROUP BY maritalstatus
UNION ALL
SELECT 'Вовлеченность', CAST(jobinvolvement AS VARCHAR(50)), COUNT(*),
AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 AS prcnt_of_attr FROM empl
GROUP BY CAST(jobinvolvement AS VARCHAR(50)))
SELECT * FROM virok ORDER BY prcnt_of_attr DESC;

--255 Какие факторы наиболее сильно влияют на доход?
WITH virok AS (SELECT 'Сверхурочные' AS format, CASE WHEN overtime = 'Yes' THEN 'Да' ELSE 'Нет' END AS status, COUNT(*) AS значение,
AVG(monthlyincome) AS profit FROM empl
GROUP BY status
UNION ALL
SELECT 'Материальное положение', maritalstatus, COUNT(*),
AVG(monthlyincome) FROM empl
GROUP BY maritalstatus
UNION ALL
SELECT 'Вовлеченность', CAST(jobinvolvement AS VARCHAR(50)), COUNT(*),
AVG(monthlyincome) FROM empl
GROUP BY CAST(jobinvolvement AS VARCHAR(50)))
SELECT * FROM virok ORDER BY profit DESC;

--256 Какие факторы наиболее сильно влияют на удовлетворённость?
WITH virok AS (SELECT 'Сверхурочные' AS format, CASE WHEN overtime = 'Yes' THEN 'Да' ELSE 'Нет' END AS status, COUNT(*) AS значение,
AVG(jobsatisfaction) AS satisfaction FROM empl
GROUP BY status
UNION ALL
SELECT 'Материальное положение', maritalstatus, COUNT(*),
AVG(jobsatisfaction) FROM empl
GROUP BY maritalstatus
UNION ALL
SELECT 'Вовлеченность', CAST(jobinvolvement AS VARCHAR(50)), COUNT(*),
AVG(jobsatisfaction) FROM empl
GROUP BY CAST(jobinvolvement AS VARCHAR(50)))
SELECT * FROM virok ORDER BY satisfaction DESC;

--257 Какие факторы наиболее сильно влияют на производительность?
WITH virok AS (SELECT 'Сверхурочные' AS format, CASE WHEN overtime = 'Yes' THEN 'Да' ELSE 'Нет' END AS status, COUNT(*) AS значение,
AVG(performancerating) AS rating FROM empl
GROUP BY status
UNION ALL
SELECT 'Материальное положение', maritalstatus, COUNT(*),
AVG(performancerating) FROM empl
GROUP BY maritalstatus
UNION ALL
SELECT 'Вовлеченность', CAST(jobinvolvement AS VARCHAR(50)), COUNT(*),
AVG(performancerating) FROM empl
GROUP BY CAST(jobinvolvement AS VARCHAR(50)))
SELECT * FROM virok ORDER BY rating DESC;

--260 Какие сотрудники имеют наибольший риск увольнения? 
SELECT CASE WHEN age >=18 AND age <=25 THEN 'От 18 до 25'
WHEN age >=26 AND age <=35 THEN 'От 26 до 35'
WHEN age >=36 AND age <=45 THEN 'От 36 до 45'
WHEN age >=46 AND age <=55 THEN 'От 46 до 55'
ELSE 'Больше 56' END AS "age_group", maritalstatus, department, overtime, COUNT (*) AS count_of_number,
AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) *100.0 AS prcnt_of_attrition 
FROM empl GROUP BY age_group, maritalstatus, department, overtime, jobrole HAVING COUNT (*) > 10
ORDER BY prcnt_of_attrition DESC LIMIT 10;
SELECT * FROM empl;

--261 Какие сотрудники имеют наибольший потенциал для повышения?
SELECT employeenumber, jobrole, joblevel, department, age, yearsatcompany, performancerating, jobinvolvement FROM empl
WHERE yearsatcompany >=4 AND performancerating >=4 and jobinvolvement >=3 AND attrition = 'No' LIMIT 20;

--262 Какие сотрудники нуждаются в повышении зарплаты?
SELECT employeenumber, jobrole, joblevel, department, age, yearsatcompany, performancerating, jobinvolvement FROM empl
WHERE percentsalaryhike <=12 AND yearssincelastpromotion >=2 AND performancerating >=4 and jobinvolvement >=3 AND attrition = 'No' LIMIT 20;

--263 Какие сотрудники нуждаются в улучшении баланса работы и личной жизни?
SELECT employeenumber, jobrole, joblevel, department, age FROM empl
WHERE worklifebalance <= 2 AND attrition = 'No' AND (overtime = 'Yes' OR jobinvolvement >= 3);

--264 Какие сотрудники нуждаются в дополнительном обучении?
SELECT employeenumber, jobrole, joblevel, department, age, trainingtimeslastyear FROM empl
WHERE trainingtimeslastyear = 0 AND jobinvolvement <=2 AND attrition = 'No';

--265 Какие сотрудники нуждаются в смене роли?
SELECT employeenumber, jobrole, joblevel, department, age, trainingtimeslastyear FROM empl
WHERE yearsincurrentrole >=4 AND yearssincelastpromotion >=3 AND performancerating >=3 AND jobinvolvement >=3 AND attrition = 'No';

--266 Какие департаменты наиболее эффективны?
SELECT department, AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) *100.0 AS prcnt_of_attr, AVG(jobinvolvement) AS avg_involv,
AVG(performancerating) avg_of_perf FROM empl GROUP BY department;

--267 Какие должности наиболее эффективны?
SELECT jobrole, AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) *100.0 AS prcnt_of_attr, AVG(jobinvolvement) AS avg_involv,
AVG(performancerating) avg_of_perf FROM empl GROUP BY jobrole;

--268 Посмотреть из-за чего текучесть у ребят с третьем уровнем уровня работы
SELECT age, attrition,  FROM empl WHERE joblevel = 3 AND attrition = 'Yes';
