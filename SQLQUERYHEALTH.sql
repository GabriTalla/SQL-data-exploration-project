					--list of smokers who have had  heart attack, are less than 50 years old, and practice at least 1 hour of physical exercise per week
SELECT 
ID, NAME, AGE, GENDER, HEART_attack, smoker, exercise
FROM Heart_health_NEW
WHERE AGE < 50 
and heart_attack >= 1
and exercise > 1
and smoker like '%YES%'
order by smoker, heart_attack, exercise desc;


					--total_person
select 
count(id) as total_person
FROM Heart_health_NEW


					--n_smokers
select 
count(smoker) as smokers

FROM Heart_health_NEW
where smoker like '%yes%'


					--% smokers
SELECT 
    (COUNT(smoker)* 100.0 / (SELECT COUNT(id) FROM Heart_health_NEW)) as percentage_smokers
FROM 
    Heart_health_NEW
WHERE 
    smoker LIKE '%yes%'


					--Temp table
create table
#tempfumatori ( id int, name nvarchar(255), age float , gender nvarchar(255), smoker nvarchar(255)



	)


					-- temp table smokers
select*
	from #tempfumatori;


					--insert
insert into 
#tempfumatori (id, name, age, gender, smoker)
	select id, name, age, gender, smoker
	from Heart_health_new
	where smoker like '%YES%'


					--female smokers 44.82%
select 
	(count(smoker)*100.00/(select count(gender)from #tempfumatori)) as DonneFumatrici
	from #tempfumatori
	where gender like '%Female%';


					--n of smokers who had an heart_attack 224
select 
sum(h.heart_attack),t.smoker
	from Heart_health_new h
	join #tempfumatori t on h.id = t.id
	where Heart_Attack >=1 and h.Smoker = 'Yes'
	group by     t.smoker;

					--n of smokers who had an heart_attack 63
	select 
sum(h.heart_attack),t.smoker, h.Gender
	from Heart_health_new h
	join #tempfumatori t on h.id = t.id
	where Heart_Attack >=1 and h.Smoker  = 'Yes' and h.Gender = 'Female'
	group by     t.smoker, h.Gender;

					--% smokers who had an heart_attack 61.50%
SELECT
(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Heart_health_new WHERE smoker = 'Yes')) AS percentage 
FROM Heart_health_new
WHERE Heart_Attack >= 1 AND smoker = 'Yes';

					--% smokers who had an heart_attack (Female) 17.50%

SELECT
(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Heart_health_new WHERE smoker = 'Yes')) AS percentage 
FROM Heart_health_new
WHERE Heart_Attack >= 1 AND smoker = 'Yes' and Gender = 'Female';



					--% people who are older than 35 and exercise for 1h per week 89%
SELECT 
    (SELECT COUNT(*) AS NUMBER_PEOPLE
    FROM Heart_health_new
    WHERE AGE >= 35
    AND Exercise >= 1) * 100.0 / COUNT(*) AS percentage
	FROM 
    Heart_health_new;
					--% people who are older than 35 and exercise for 1h per week (Female) 42%
	SELECT 
    (SELECT COUNT(*) AS NUMBER_PEOPLE
    FROM Heart_health_new
    WHERE AGE >= 35
    AND Exercise >= 1 AND GENDER ='Female') * 100.0 / COUNT(*) AS percentage
	FROM 
    Heart_health_new;


					--% of people who are older than 35, exercise for 1h or plus per week and had at least 1 heart attack 54%
SELECT 
    (SELECT COUNT(*) AS NUMBER_PEOPLE
    FROM Heart_health_new
    WHERE AGE >= 35
    AND Exercise >= 1 AND Heart_Attack >=1) * 100.0 / COUNT(*) AS percentage
FROM 
    Heart_health_new;


						--% of people who are older than 35, exercise for 1h or plus per week and had at least 1 heart attack (female) 13%
SELECT 
    (SELECT COUNT(*) AS NUMBER_PEOPLE
    FROM Heart_health_new
    WHERE AGE >= 35
    AND Exercise >= 1 AND Heart_Attack >=1 and Gender = 'Female') * 100.0 / COUNT(*) AS percentage
FROM 
    Heart_health_new;

					--% of people who doesn't smokes and don't do workout 0%
SELECT
(select COUNT(*)
from Heart_health_new
where smoker= 'no' and Exercise <= 1 and Heart_Attack >=1)*100.00/ count(*) from Heart_health_new as percentage


					--% of people with BloodPressure over 120  74%
select
(select count(*) from Heart_health_new where bloodpressureMax >= 120)*100/COUNT(*) as '%ofpeoplewithBP>200'
from Heart_health_new


					--% of people with BloodPressure over 120 (female)  29%
select
(select count(*) from Heart_health_new where bloodpressureMax >= 120 and Gender = 'Female')*100/COUNT(*) as '%ofpeoplewithBP>200'
from Heart_health_new

					--%of people with BloodPressure over  120, older than 50  and had at least  1 heart attack 28%
select
(select count(*) from Heart_health_new where bloodpressureMax >= 120 AND AGE >50 AND Heart_Attack>=1)*100/COUNT(*) as '%ofpeoplewithBP>200'
from Heart_health_new

				--%of people with BloodPressure over  120, older than 50  and had at least  1 heart attack (female) 0%
select
(select count(*) from Heart_health_new where bloodpressureMax >= 120 AND AGE >50 AND Heart_Attack>=1 and Gender = ' Female')*100/COUNT(*) as '%ofpeoplewithBP>200'
from Heart_health_new



					--% of people with BloodPressure over 120  and had at least  1 heart attack 59%
select 
(select count(*)
from Heart_health_new where bloodpressureMax >= 120  AND Heart_Attack>=1 )*100/COUNT(*) as '%ofpeoplewithBP>200'
from Heart_health_new


					--% of people with BloodPressure over 120  and had at least  1 heart attack (female)15%
select 
(select count(*)
from Heart_health_new where bloodpressureMax >= 120  AND Heart_Attack>=1 and Gender = 'Female')*100/COUNT(*) as '%ofpeoplewithBP>200'
from Heart_health_new


					--% of smokers with BloodPressure  >120, Age >50 12%
select 
(select count(*)
from Heart_health_new where bloodpressureMax >= 120  AND AGE > 50 AND Smoker = 'yes')*100/COUNT(*) as '%ofpeoplewithBP>200'
from Heart_health_new


					--% of smokers with BloodPressure  >120, Age >50 (Female)2%
select 
(select count(*)
from Heart_health_new where bloodpressureMax >= 120  AND AGE > 50 AND Smoker  = 'yes'and Gender='Female')*100/COUNT(*) as '%ofpeoplewithBP>200'
from Heart_health_new



					--% of smokers with BloodPressure>120,Age >50, and exercise at least 1h per week 1 ora di es fisico 12%
select 
(select count(*) from Heart_health_new where bloodpressureMax >= 120  AND Smoker = 'yes' and age >50 and Exercise >=1)*100/COUNT(*) as '%ofpeoplewithBP>200'
from Heart_health_new


					--% of smokers with BloodPressure>120,Age >50, and exercise at least 1h per week 1 ora di es fisico 2%
select 
(select count(*) from Heart_health_new where bloodpressureMax >= 120  AND Smoker = 'yes' and age >50 and Exercise >=1 and Gender='Female')*100/COUNT(*) as '%ofpeoplewithBP>200'
from Heart_health_new


					--% of smokers with BloodPressure >120 age <50, exercise 2 hours per week, with at least one heart attack 0.50%
select
(select count(*) from Heart_health_new where bloodpressureMax >= 120  AND Smoker = 'yes' and age <50 and Exercise =2 and Heart_Attack >=1)*100.00/COUNT(*) as '%ofpeoplewithBP>200'
from Heart_health_new



					--% of smokers with BloodPressure >120 age <50, exercise 2 hours per week, with at least one heart attack 0.50%
select
(select count(*) from Heart_health_new where bloodpressureMax >= 120  AND Smoker = 'yes' and age <50 and Exercise =2 and Heart_Attack >=1 and Gender='Female')*100.00/COUNT(*) as '%ofpeoplewithBP>200'
from Heart_health_new


					--% of individuals with blood pressure over 120, age <50, who smoke, and exercise more than 2 hours per week with a history of heart attack 14%
select 
(select count(*) from Heart_health_new where bloodpressureMax >= 120  AND Smoker = 'yes' and age <50 and Exercise >=2 and Heart_Attack >=1)*100/COUNT(*) as '%ofpeoplewithBP>200'
from Heart_health_new




				--% of individuals with blood pressure over 120, age <50, who smoke, and exercise more than 2 hours per week with a history of heart attack 5%
select 
(select count(*) from Heart_health_new where bloodpressureMax >= 120  AND Smoker = 'yes' and age <50 and Exercise >=2 and Heart_Attack >=1 and Gender='Female')*100/COUNT(*) as '%ofpeoplewithBP>200'
from Heart_health_new