--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_0
USING DELTA
AS
SELECT
0 as analysis_id, CAST('' AS STRING) as stratum_1, CAST('1.7.2' AS STRING) as stratum_2, 
CAST(CURRENT_DATE AS STRING) as stratum_3,
cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
COUNT(distinct person_id) as count_value
FROM
etl_synthea_1k.person;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_0
 ZORDER BY stratum_1;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_0
USING DELTA
AS
SELECT
0 as analysis_id, CAST('' AS STRING) as stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
COUNT(distinct person_id) as count_value, 
 cast(null as float) as min_value,
 cast(null as float) as max_value,
 cast(null as float) as avg_value,
 cast(null as float) as stdev_value,
 cast(null as float) as median_value,
 cast(null as float) as p10_value,
 cast(null as float) as p25_value,
 cast(null as float) as p75_value,
 cast(null as float) as p90_value
FROM
etl_synthea_1k.person;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_0
 ZORDER BY stratum_1;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1
USING DELTA
AS
SELECT
1 as analysis_id, 
cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
COUNT(distinct person_id) as count_value
FROM
etl_synthea_1k.person;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2
USING DELTA
AS
SELECT
2 as analysis_id, 
CAST(gender_concept_id AS STRING) as stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
COUNT(distinct person_id) as count_value
FROM
etl_synthea_1k.person
group by GENDER_CONCEPT_ID;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_3
USING DELTA
AS
SELECT
3 as analysis_id, CAST(year_of_birth AS STRING) as stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
COUNT(distinct person_id) as count_value
FROM
etl_synthea_1k.person
group by YEAR_OF_BIRTH;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_3
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_4
USING DELTA
AS
SELECT
4 as analysis_id, CAST(RACE_CONCEPT_ID AS STRING) as stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
COUNT(distinct person_id) as count_value
FROM
etl_synthea_1k.person
group by RACE_CONCEPT_ID;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_4
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_5
USING DELTA
AS
SELECT
5 as analysis_id, CAST(ETHNICITY_CONCEPT_ID AS STRING) as stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
COUNT(distinct person_id) as count_value
FROM
etl_synthea_1k.person
group by ETHNICITY_CONCEPT_ID;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_5
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_10
USING DELTA
AS
SELECT
10 as analysis_id, CAST(year_of_birth AS STRING) as stratum_1,
 CAST(gender_concept_id AS STRING) as stratum_2,
 cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(distinct person_id) as count_value
FROM
etl_synthea_1k.person
group by YEAR_OF_BIRTH, gender_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_10
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_11
USING DELTA
AS
SELECT
11 as analysis_id, CAST(P.year_of_birth AS STRING) as stratum_1,
 CAST(P.gender_concept_id AS STRING) as stratum_2,
 cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(distinct P.person_id) as count_value
FROM
etl_synthea_1k.person P
where not exists
(
 select 1
 from etl_synthea_1k.death D
 where P.person_id = D.person_id
)
group by P.YEAR_OF_BIRTH, P.gender_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_11
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_12
USING DELTA
AS
SELECT
12 as analysis_id, CAST(RACE_CONCEPT_ID AS STRING) as stratum_1, CAST(ETHNICITY_CONCEPT_ID AS STRING) as stratum_2, 
cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
COUNT(distinct person_id) as count_value
FROM
etl_synthea_1k.person
group by RACE_CONCEPT_ID,ETHNICITY_CONCEPT_ID;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_12
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_101
USING DELTA
AS
WITH rawData  AS (
 select
 year(op1.index_date) - p1.YEAR_OF_BIRTH as stratum_1,
 COUNT(p1.person_id) as count_value
 from etl_synthea_1k.person p1
 inner join (select person_id, MIN(observation_period_start_date) as index_date from etl_synthea_1k.observation_period group by PERSON_ID) op1
 on p1.PERSON_ID = op1.PERSON_ID
 group by year(op1.index_date) - p1.YEAR_OF_BIRTH
)
 SELECT
101 as analysis_id,
 CAST(stratum_1 AS STRING) as stratum_1,
 cast(null as STRING) as stratum_2,
 cast(null as STRING) as stratum_3,
 cast(null as STRING) as stratum_4,
 cast(null as STRING) as stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_101
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_102
USING DELTA
AS
WITH rawData  AS (
 select
 p1.gender_concept_id as stratum_1,
 year(op1.index_date) - p1.YEAR_OF_BIRTH as stratum_2,
 COUNT(p1.person_id) as count_value
 from etl_synthea_1k.person p1
 inner join (select person_id, MIN(observation_period_start_date) as index_date from etl_synthea_1k.observation_period group by PERSON_ID) op1
 on p1.PERSON_ID = op1.PERSON_ID
 group by p1.gender_concept_id, year(op1.index_date) - p1.YEAR_OF_BIRTH)
 SELECT
102 as analysis_id,
 CAST(stratum_1 AS STRING) as stratum_1,
 cast(stratum_2 as STRING) as stratum_2,
 cast(null as STRING) as stratum_3,
 cast(null as STRING) as stratum_4,
 cast(null as STRING) as stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_102
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_103
USING DELTA
AS
WITH rawData (person_id, age_value)  AS (
select p.person_id, 
 MIN(YEAR(observation_period_start_date)) - P.YEAR_OF_BIRTH as age_value
 from etl_synthea_1k.person p
 JOIN etl_synthea_1k.observation_period op on p.person_id = op.person_id
 group by p.person_id, p.year_of_birth
),
overallStats (avg_value, stdev_value, min_value, max_value, total) as
(
 select CAST(avg(1.0 * age_value) AS FLOAT) as avg_value,
 CAST(STDDEV(age_value) AS FLOAT) as stdev_value,
 min(age_value) as min_value,
 max(age_value) as max_value,
 COUNT(*) as total
 FROM rawData
),
ageStats (age_value, total, rn) as
(
 select age_value, COUNT(*) as total, row_number() over (order by age_value) as rn
 from rawData
 group by age_value
),
ageStatsPrior (age_value, total, accumulated) as
(
 select s.age_value, s.total, sum(p.total) as accumulated
 from ageStats s
 join ageStats p on p.rn <= s.rn
 group by s.age_value, s.total, s.rn
),
tempResults as
(
 select 103 as analysis_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then age_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then age_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then age_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then age_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then age_value end) as p90_value
 --INTO #tempResults
 from ageStatsPrior p
 CROSS JOIN overallStats o
 GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
)
 SELECT
analysis_id, 
cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5, 
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
tempResults;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_103
 ZORDER BY count_value;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_104
USING DELTA
AS
WITH rawData (gender_concept_id, age_value)  AS (
 select p.gender_concept_id, MIN(YEAR(observation_period_start_date)) - P.YEAR_OF_BIRTH as age_value
 from etl_synthea_1k.person p
 JOIN etl_synthea_1k.observation_period op on p.person_id = op.person_id
 group by p.person_id,p.gender_concept_id, p.year_of_birth
),
overallStats (gender_concept_id, avg_value, stdev_value, min_value, max_value, total) as
(
 select gender_concept_id,
 CAST(avg(1.0 * age_value) AS FLOAT) as avg_value,
 CAST(STDDEV(age_value) AS FLOAT) as stdev_value,
 min(age_value) as min_value,
 max(age_value) as max_value,
 COUNT(*) as total
 FROM rawData
 group by gender_concept_id
),
ageStats (gender_concept_id, age_value, total, rn) as
(
 select gender_concept_id, age_value, COUNT(*) as total, row_number() over (order by age_value) as rn
 FROM rawData
 group by gender_concept_id, age_value
),
ageStatsPrior (gender_concept_id, age_value, total, accumulated) as
(
 select s.gender_concept_id, s.age_value, s.total, sum(p.total) as accumulated
 from ageStats s
 join ageStats p on s.gender_concept_id = p.gender_concept_id and p.rn <= s.rn
 group by s.gender_concept_id, s.age_value, s.total, s.rn
)
 SELECT
104 as analysis_id,
 CAST(o.gender_concept_id AS STRING) as stratum_1,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then age_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then age_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then age_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then age_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then age_value end) as p90_value
FROM
ageStatsPrior p
join overallStats o on p.gender_concept_id = o.gender_concept_id
GROUP BY o.gender_concept_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_104
 ZORDER BY stratum_1;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_104
USING DELTA
AS
SELECT
analysis_id, stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_104
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_104
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_104;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_104;

--HINT DISTRIBUTE_ON_KEY(count_value) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempObs_105
USING DELTA
AS
SELECT
count_value, rn 
FROM
(
 select datediff(op.observation_period_end_date,op.observation_period_start_date) as count_value,
 ROW_NUMBER() over (PARTITION by op.person_id order by op.observation_period_start_date asc) as rn
 from etl_synthea_1k.observation_period op
) A
where rn = 1;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempObs_105
 ZORDER BY count_value;
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdestatsView_105
USING DELTA
AS
SELECT
count_value, COUNT(*) as total, row_number() over (order by count_value) as rn
FROM
etl_synthea_1k_ach_res.ujk3kpdetempObs_105
group by count_value;
--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_105
USING DELTA
AS
WITH overallStats (avg_value, stdev_value, min_value, max_value, total)  AS (
 select CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 from etl_synthea_1k_ach_res.ujk3kpdetempObs_105
),
priorStats (count_value, total, accumulated) as
(
 select s.count_value, s.total, sum(p.total) as accumulated
 from etl_synthea_1k_ach_res.ujk3kpdestatsView_105 s
 join etl_synthea_1k_ach_res.ujk3kpdestatsView_105 p on p.rn <= s.rn
 group by s.count_value, s.total, s.rn
)
 SELECT
105 as analysis_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value end) as p90_value
FROM
priorStats p
CROSS JOIN overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_105
 ZORDER BY count_value;
--HINT DISTRIBUTE_ON_KEY(count_value) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_105
USING DELTA
AS
SELECT
analysis_id,
cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5, count_value,
min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_105
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_105
 ZORDER BY count_value;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempObs_105;
drop table etl_synthea_1k_ach_res.ujk3kpdetempObs_105;
truncate table etl_synthea_1k_ach_res.ujk3kpdestatsView_105;
drop table etl_synthea_1k_ach_res.ujk3kpdestatsView_105;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_105;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_105;

--HINT DISTRIBUTE_ON_KEY(gender_concept_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpderawData_106
USING DELTA
AS
SELECT
p.gender_concept_id, op.count_value
FROM
(
 select person_id, datediff(op.observation_period_end_date,op.observation_period_start_date) as count_value,
 ROW_NUMBER() over (PARTITION by op.person_id order by op.observation_period_start_date asc) as rn
 from etl_synthea_1k.observation_period op
) op
JOIN etl_synthea_1k.person p on op.person_id = p.person_id
where op.rn = 1
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpderawData_106
 ZORDER BY gender_concept_id;
--HINT DISTRIBUTE_ON_KEY(gender_concept_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_106
USING DELTA
AS
WITH overallStats (gender_concept_id, avg_value, stdev_value, min_value, max_value, total)  AS (
 select gender_concept_id,
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_106
 group by gender_concept_id
),
statsView (gender_concept_id, count_value, total, rn) as
(
 select gender_concept_id, count_value, COUNT(*) as total, row_number() over (order by count_value) as rn
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_106
 group by gender_concept_id, count_value
),
priorStats (gender_concept_id,count_value, total, accumulated) as
(
 select s.gender_concept_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.gender_concept_id = p.gender_concept_id and p.rn <= s.rn
 group by s.gender_concept_id, s.count_value, s.total, s.rn
)
 SELECT
106 as analysis_id,
 CAST(o.gender_concept_id AS STRING) as gender_concept_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value end) as p90_value
FROM
priorStats p
join overallStats o on p.gender_concept_id = o.gender_concept_id
GROUP BY o.gender_concept_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_106
 ZORDER BY gender_concept_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_106
USING DELTA
AS
SELECT
analysis_id, gender_concept_id as stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_106
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_106
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpderawData_106;
drop table etl_synthea_1k_ach_res.ujk3kpderawData_106;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_106;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_106;

--HINT DISTRIBUTE_ON_KEY(age_decile)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_107
USING DELTA
AS
WITH rawData (age_decile, count_value)  AS (
 select floor((year(op.OBSERVATION_PERIOD_START_DATE) - p.YEAR_OF_BIRTH)/10) as age_decile,
 datediff(op.observation_period_end_date,op.observation_period_start_date) as count_value
 FROM
 (
 select person_id, 
 op.observation_period_start_date,
 op.observation_period_end_date,
 ROW_NUMBER() over (PARTITION by op.person_id order by op.observation_period_start_date asc) as rn
 from etl_synthea_1k.observation_period op
 ) op
 JOIN etl_synthea_1k.person p on op.person_id = p.person_id
 where op.rn = 1
),
overallStats (age_decile, avg_value, stdev_value, min_value, max_value, total) as
(
 select age_decile,
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 from rawData
 group by age_decile
),
statsView (age_decile, count_value, total, rn) as
(
 select age_decile,
 count_value, 
 COUNT(*) as total, 
 row_number() over (order by count_value) as rn
 FROM rawData
 group by age_decile, count_value
),
priorStats (age_decile,count_value, total, accumulated) as
(
 select s.age_decile, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.age_decile = p.age_decile and p.rn <= s.rn
 group by s.age_decile, s.count_value, s.total, s.rn
)
 SELECT
107 as analysis_id,
 CAST(o.age_decile AS STRING) as age_decile,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.age_decile = o.age_decile
GROUP BY o.age_decile, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_107
 ZORDER BY age_decile;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_107
USING DELTA
AS
SELECT
analysis_id, age_decile as stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_107
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_107
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_107;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_107;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_108
USING DELTA
AS
WITH rawData  AS (
 select
 floor(datediff(op1.observation_period_end_date,op1.observation_period_start_date)/30) as stratum_1,
 COUNT(distinct p1.person_id) as count_value
 from etl_synthea_1k.person p1
 inner join
 (select person_id,
 OBSERVATION_PERIOD_START_DATE,
 OBSERVATION_PERIOD_END_DATE,
 ROW_NUMBER() over (PARTITION by person_id order by observation_period_start_date asc) as rn1
 from etl_synthea_1k.observation_period
 ) op1
 on p1.PERSON_ID = op1.PERSON_ID
 where op1.rn1 = 1
 group by floor(datediff(op1.observation_period_end_date,op1.observation_period_start_date)/30)
)
 SELECT
108 as analysis_id,
 CAST(stratum_1 AS STRING) as stratum_1,
 cast(null as STRING) as stratum_2,
 cast(null as STRING) as stratum_3,
 cast(null as STRING) as stratum_4,
 cast(null as STRING) as stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_108
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_109
USING DELTA
AS
WITH century   AS (SELECT  CAST('19' as STRING) num union select '20' num), 
tens as (select '0' num union select '1' num union select '2' num union select '3' num union select '4' num union select '5' num union select '6' num union select '7' num union select '8' num union select '9' num),
ones as (select '0' num union select '1' num union select '2' num union select '3' num union select '4' num union select '5' num union select '6' num union select '7' num union select '8' num union select '9' num),
months as (select '01' as num union select '02' num union select '03' num union select '04' num union select '05' num union select '06' num union select '07' num union select '08' num union select '09' num union select '10' num union select '11' num union select '12' num),
date_keys as (select concat(century.num, tens.num, ones.num,months.num) obs_month from century cross join tens cross join ones cross join months),
-- From date_keys, we just need each year and the first and last day of each year
ymd as (
select cast(SUBSTR(obs_month,4) as integer) as obs_year,
 min(cast(SUBSTR(SUBSTR(obs_month,6),-2) as integer)) as month_start,
 1 as day_start,
 max(cast(SUBSTR(SUBSTR(obs_month,6),-2) as integer)) as month_end,
 31 as day_end
 from date_keys
 where SUBSTR(SUBSTR(obs_month,6),-2) in ('01','12')
 group by SUBSTR(obs_month,4)
),
-- This gives us each year and the first and last day of the year 
year_ranges as (
select obs_year,
 to_date(cast(obs_year as string) || '-' || cast(month_start as string) || '-' || cast(day_start as string)) obs_year_start,
 to_date(cast(obs_year as string) || '-' || cast(month_end as string) || '-' || cast(day_end as string)) obs_year_end
 from ymd
 where obs_year >= (select min(year(observation_period_start_date)) from etl_synthea_1k.observation_period)
 and obs_year <= (select max(year(observation_period_start_date)) from etl_synthea_1k.observation_period)
) 
 SELECT
109 AS analysis_id, 
 CAST(yr.obs_year AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2, 
 CAST(NULL AS STRING) AS stratum_3, 
 CAST(NULL AS STRING) AS stratum_4, 
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(DISTINCT op.person_id) AS count_value
FROM
etl_synthea_1k.observation_period op
CROSS JOIN 
 year_ranges yr
WHERE
 op.observation_period_start_date <= yr.obs_year_start
AND
 op.observation_period_end_date >= yr.obs_year_end
GROUP BY 
 yr.obs_year;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_109
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_110
USING DELTA
AS
SELECT
110 as analysis_id, 
 CAST(t1.obs_month AS STRING) as stratum_1,
 cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(distinct op1.PERSON_ID) as count_value
FROM
etl_synthea_1k.observation_period op1
join 
(
 SELECT DISTINCT 
 YEAR(observation_period_start_date)*100 + MONTH(observation_period_start_date) AS obs_month,
 to_date(cast(YEAR(observation_period_start_date) as string) || '-' || cast(MONTH(observation_period_start_date) as string) || '-' || cast(1 as string))
 AS obs_month_start,
 last_day(observation_period_start_date) AS obs_month_end
 FROM etl_synthea_1k.observation_period
) t1 on op1.observation_period_start_date <= t1.obs_month_start
 and op1.observation_period_end_date >= t1.obs_month_end
group by t1.obs_month;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_110
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_111
USING DELTA
AS
WITH rawData  AS (
 select
 YEAR(observation_period_start_date)*100 + month(OBSERVATION_PERIOD_START_DATE) as stratum_1,
 COUNT(distinct op1.PERSON_ID) as count_value
 from
 etl_synthea_1k.observation_period op1
 group by YEAR(observation_period_start_date)*100 + month(OBSERVATION_PERIOD_START_DATE)
)
 SELECT
111 as analysis_id,
 CAST(stratum_1 AS STRING) as stratum_1,
 cast(null as STRING) as stratum_2,
 cast(null as STRING) as stratum_3,
 cast(null as STRING) as stratum_4,
 cast(null as STRING) as stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_111
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_112
USING DELTA
AS
WITH rawData  AS (
 select
 YEAR(observation_period_end_date)*100 + month(observation_period_end_date) as stratum_1,
 COUNT(distinct op1.PERSON_ID) as count_value
 from
 etl_synthea_1k.observation_period op1
 group by YEAR(observation_period_end_date)*100 + month(observation_period_end_date)
)
 SELECT
112 as analysis_id,
 CAST(stratum_1 AS STRING) as stratum_1,
 cast(null as STRING) as stratum_2,
 cast(null as STRING) as stratum_3,
 cast(null as STRING) as stratum_4,
 cast(null as STRING) as stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_112
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_113
USING DELTA
AS
SELECT
113 as analysis_id, 
 CAST(op1.num_periods AS STRING) as stratum_1, 
 cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(distinct op1.PERSON_ID) as count_value
FROM
(select person_id, COUNT(OBSERVATION_period_start_date) as num_periods from etl_synthea_1k.observation_period group by PERSON_ID) op1
group by op1.num_periods;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_113
 ZORDER BY stratum_1;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetemp_dates_116
USING DELTA
AS
SELECT
distinct 
 YEAR(observation_period_start_date) as obs_year 
FROM
etl_synthea_1k.observation_period
;
--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_116
USING DELTA
AS
WITH rawData  AS (
 select
 t1.obs_year as stratum_1,
 p1.gender_concept_id as stratum_2,
 floor((t1.obs_year - p1.year_of_birth)/10) as stratum_3,
 COUNT(distinct p1.PERSON_ID) as count_value
 from
 etl_synthea_1k.person p1
 inner join
 etl_synthea_1k.observation_period op1
 on p1.person_id = op1.person_id
 ,
 etl_synthea_1k_ach_res.ujk3kpdetemp_dates_116 t1
 where year(op1.OBSERVATION_PERIOD_START_DATE) <= t1.obs_year
 and year(op1.OBSERVATION_PERIOD_END_DATE) >= t1.obs_year
 group by t1.obs_year,
 p1.gender_concept_id,
 floor((t1.obs_year - p1.year_of_birth)/10)
)
 SELECT
116 as analysis_id,
 CAST(stratum_1 AS STRING) as stratum_1,
 cast(stratum_2 as STRING) as stratum_2,
 cast(stratum_3 as STRING) as stratum_3,
 cast(null as STRING) as stratum_4,
 cast(null as STRING) as stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_116
 ZORDER BY stratum_1;
TRUNCATE TABLE etl_synthea_1k_ach_res.ujk3kpdetemp_dates_116;
DROP TABLE etl_synthea_1k_ach_res.ujk3kpdetemp_dates_116;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_117 
USING DELTA
AS
WITH century   AS (SELECT  CAST('19' as STRING) num union select '20' num), 
tens as (select '0' num union select '1' num union select '2' num union select '3' num union select '4' num union select '5' num union select '6' num union select '7' num union select '8' num union select '9' num),
ones as (select '0' num union select '1' num union select '2' num union select '3' num union select '4' num union select '5' num union select '6' num union select '7' num union select '8' num union select '9' num),
months as (select '01' as num union select '02' num union select '03' num union select '04' num union select '05' num union select '06' num union select '07' num union select '08' num union select '09' num union select '10' num union select '11' num union select '12' num),
date_keys as (select cast(concat(century.num, tens.num, ones.num,months.num) as int) obs_month from century cross join tens cross join ones cross join months)
 SELECT
117 as analysis_id, 
 CAST(t1.obs_month AS STRING) as stratum_1,
 cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COALESCE(COUNT(distinct op1.PERSON_ID),0) as count_value
FROM
date_keys t1
left join
 (select t2.obs_month, op2.*
 from etl_synthea_1k.observation_period op2, date_keys t2
 where year(op2.observation_period_start_date)*100 + month(op2.observation_period_start_date) <= t2.obs_month
 and year(op2.observation_period_end_date)*100 + month(op2.observation_period_end_date) >= t2.obs_month
 ) op1 on op1.obs_month = t1.obs_month
group by t1.obs_month
having COALESCE(COUNT(distinct op1.PERSON_ID),0) > 0;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_117 
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_119
USING DELTA
AS
SELECT
119 as analysis_id,
 CAST(op1.period_type_concept_id AS STRING) as stratum_1,
 cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(*) as count_value
FROM
etl_synthea_1k.observation_period op1
group by op1.period_type_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_119
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_200
USING DELTA
AS
SELECT
200 AS analysis_id,
 CAST(vo.visit_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(DISTINCT vo.person_id) AS count_value
FROM
etl_synthea_1k.visit_occurrence vo
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vo.person_id = op.person_id
AND 
 vo.visit_start_date >= op.observation_period_start_date
AND 
 vo.visit_start_date <= op.observation_period_end_date
GROUP BY 
 vo.visit_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_200
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_201
USING DELTA
AS
SELECT
201 AS analysis_id,
 CAST(vo.visit_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(vo.person_id) AS count_value
FROM
etl_synthea_1k.visit_occurrence vo
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vo.person_id = op.person_id
AND 
 vo.visit_start_date >= op.observation_period_start_date
AND 
 vo.visit_start_date <= op.observation_period_end_date
GROUP BY 
 vo.visit_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_201
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_202
USING DELTA
AS
WITH rawData  AS (
SELECT 
 vo.visit_concept_id AS stratum_1,
 YEAR(vo.visit_start_date) * 100 + MONTH(vo.visit_start_date) AS stratum_2,
 COUNT(DISTINCT vo.person_id) AS count_value
FROM 
 etl_synthea_1k.visit_occurrence vo
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vo.person_id = op.person_id
AND 
 vo.visit_start_date >= op.observation_period_start_date
AND 
 vo.visit_start_date <= op.observation_period_end_date
GROUP BY 
 vo.visit_concept_id,
 YEAR(vo.visit_start_date) * 100 + MONTH(vo.visit_start_date)
)
 SELECT
202 as analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_202
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_203
USING DELTA
AS
WITH rawData(person_id, count_value)  AS (
SELECT 
 vo.person_id,
 COUNT(DISTINCT vo.visit_concept_id) AS count_value
FROM 
 etl_synthea_1k.visit_occurrence vo
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vo.person_id = op.person_id
AND 
 vo.visit_start_date >= op.observation_period_start_date
AND 
 vo.visit_start_date <= op.observation_period_end_date
GROUP BY 
 vo.person_id
),
overallStats (avg_value, stdev_value, min_value, max_value, total) as
(
 select CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 from rawData
),
statsView (count_value, total, rn) as
(
 select count_value, 
 COUNT(*) as total, 
 row_number() over (order by count_value) as rn
 FROM rawData
 group by count_value
),
priorStats (count_value, total, accumulated) as
(
 select s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on p.rn <= s.rn
 group by s.count_value, s.total, s.rn
)
 SELECT
203 as analysis_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
CROSS JOIN overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_203
 ZORDER BY count_value;
--HINT DISTRIBUTE_ON_KEY(count_value) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_203
USING DELTA
AS
SELECT
analysis_id, 
cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_203
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_203
 ZORDER BY count_value;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_203;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_203;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_204
USING DELTA
AS
WITH rawData  AS (
SELECT 
 vo.visit_concept_id AS stratum_1,
 YEAR(vo.visit_start_date) AS stratum_2,
 p.gender_concept_id AS stratum_3,
 FLOOR((YEAR(vo.visit_start_date) - p.year_of_birth) / 10) AS stratum_4,
 COUNT(DISTINCT p.person_id) AS count_value
FROM 
 etl_synthea_1k.person p
JOIN 
 etl_synthea_1k.visit_occurrence vo 
ON 
 p.person_id = vo.person_id
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vo.person_id = op.person_id
AND 
 vo.visit_start_date >= op.observation_period_start_date
AND 
 vo.visit_start_date <= op.observation_period_end_date
GROUP BY 
 vo.visit_concept_id,
 YEAR(vo.visit_start_date),
 p.gender_concept_id,
 FLOOR((YEAR(vo.visit_start_date) - p.year_of_birth) / 10)
)
 SELECT
204 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 as STRING) AS stratum_2,
 CAST(stratum_3 as STRING) AS stratum_3,
 CAST(stratum_4 as STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_204
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_206
USING DELTA
AS
WITH rawData (stratum1_id, stratum2_id, count_value)  AS (
SELECT 
 v.visit_concept_id AS stratum1_id,
 p.gender_concept_id AS stratum2_id,
 v.visit_start_year - p.year_of_birth AS count_value
FROM 
 etl_synthea_1k.person p
JOIN (
 SELECT 
 vo.person_id,
 vo.visit_concept_id,
 MIN(YEAR(vo.visit_start_date)) AS visit_start_year
 FROM 
 etl_synthea_1k.visit_occurrence vo
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 vo.person_id = op.person_id
 AND 
 vo.visit_start_date >= op.observation_period_start_date
 AND 
 vo.visit_start_date <= op.observation_period_end_date
 GROUP BY 
 vo.person_id,
 vo.visit_concept_id
 ) v
ON 
 p.person_id = v.person_id
),
overallStats (stratum1_id, stratum2_id, avg_value, stdev_value, min_value, max_value, total) as
(
 select stratum1_id,
 stratum2_id,
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 FROM rawData
 group by stratum1_id, stratum2_id
),
statsView (stratum1_id, stratum2_id, count_value, total, rn) as
(
 select stratum1_id, stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by stratum1_id, stratum2_id order by count_value) as rn
 FROM rawData
 group by stratum1_id, stratum2_id, count_value
),
priorStats (stratum1_id, stratum2_id, count_value, total, accumulated) as
(
 select s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
 group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn
)
 SELECT
206 as analysis_id,
 CAST(o.stratum1_id AS STRING) AS stratum1_id,
 CAST(o.stratum2_id AS STRING) AS stratum2_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id 
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_206
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_206
USING DELTA
AS
SELECT
analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2, 
cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_206
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_206
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_206;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_206;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_207
USING DELTA
AS
SELECT
207 as analysis_id, 
 cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(vo1.PERSON_ID) as count_value
FROM
etl_synthea_1k.visit_occurrence vo1
 left join etl_synthea_1k.person p1
 on p1.person_id = vo1.person_id
where p1.person_id is null;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_209
USING DELTA
AS
SELECT
209 as analysis_id,
 cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(vo1.PERSON_ID) as count_value
FROM
etl_synthea_1k.visit_occurrence vo1
 left join etl_synthea_1k.care_site cs1
 on vo1.care_site_id = cs1.care_site_id
where vo1.care_site_id is not null
 and cs1.care_site_id is null;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_210
USING DELTA
AS
SELECT
210 AS analysis_id,
 CAST(NULL AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.visit_occurrence vo
LEFT JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vo.person_id = op.person_id
AND 
 vo.visit_start_date >= op.observation_period_start_date
AND 
 vo.visit_start_date <= op.observation_period_end_date
WHERE 
 op.person_id IS NULL;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_212
USING DELTA
AS
WITH rawData  AS (
 select
 YEAR(visit_start_date) as stratum_1,
 p1.gender_concept_id as stratum_2,
 floor((year(visit_start_date) - p1.year_of_birth)/10) as stratum_3,
 COUNT(distinct p1.PERSON_ID) as count_value
 from etl_synthea_1k.person p1
 inner join
 etl_synthea_1k.visit_occurrence vo1
 on p1.person_id = vo1.person_id
 group by
 YEAR(visit_start_date),
 p1.gender_concept_id,
 floor((year(visit_start_date) - p1.year_of_birth)/10)
)
 SELECT
212 as analysis_id,
 CAST(stratum_1 AS STRING) as stratum_1,
 cast(stratum_2 as STRING) as stratum_2,
 cast(stratum_3 as STRING) as stratum_3,
 cast(null as STRING) as stratum_4,
 cast(null as STRING) as stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_212
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_213
USING DELTA
AS
WITH rawData(stratum_id, count_value)  AS (
 select visit_concept_id AS stratum_id, datediff(visit_end_date,visit_start_date) as count_value
 from etl_synthea_1k.visit_occurrence vo inner join 
 etl_synthea_1k.observation_period op on vo.person_id = op.person_id
 -- only include events that occur during observation period
 where vo.visit_start_date >= op.observation_period_start_date and
 COALESCE(vo.visit_end_date,vo.visit_start_date) <= op.observation_period_end_date
),
overallStats (stratum_id, avg_value, stdev_value, min_value, max_value, total) as
(
 select stratum_id,
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 FROM rawData
 group by stratum_id
),
statsView (stratum_id, count_value, total, rn) as
(
 select stratum_id, count_value, COUNT(*) as total, row_number() over (order by count_value) as rn
 FROM rawData
 group by stratum_id, count_value
),
priorStats (stratum_id, count_value, total, accumulated) as
(
 select s.stratum_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum_id = p.stratum_id and p.rn <= s.rn
 group by s.stratum_id, s.count_value, s.total, s.rn
)
 SELECT
213 as analysis_id,
 CAST(o.stratum_id AS STRING) AS stratum_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum_id = o.stratum_id
GROUP BY o.stratum_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_213
 ZORDER BY stratum_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_213
USING DELTA
AS
SELECT
analysis_id, stratum_id as stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_213
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_213
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_213;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_213;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_220
USING DELTA
AS
WITH rawData  AS (
SELECT 
 YEAR(vo.visit_start_date) * 100 + MONTH(vo.visit_start_date) AS stratum_1,
 COUNT(vo.person_id) AS count_value
FROM 
 etl_synthea_1k.visit_occurrence vo
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vo.person_id = op.person_id
AND 
 vo.visit_start_date >= op.observation_period_start_date
AND 
 vo.visit_start_date <= op.observation_period_end_date
GROUP BY 
 YEAR(vo.visit_start_date) * 100 + MONTH(vo.visit_start_date)
)
 SELECT
220 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_220
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_221
USING DELTA
AS
WITH rawData  AS (
SELECT 
 YEAR(vo.visit_start_date) AS stratum_1,
 COUNT(DISTINCT vo.person_id) AS count_value
FROM 
 etl_synthea_1k.visit_occurrence vo
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vo.person_id = op.person_id
AND 
 vo.visit_start_date >= op.observation_period_start_date
AND 
 vo.visit_start_date <= op.observation_period_end_date
GROUP BY 
 YEAR(vo.visit_start_date)
)
 SELECT
221 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_221
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_225
USING DELTA
AS
SELECT
225 AS analysis_id,
 CAST(vo.visit_source_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.visit_occurrence vo
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vo.person_id = op.person_id
AND 
 vo.visit_start_date >= op.observation_period_start_date
AND 
 vo.visit_start_date <= op.observation_period_end_date
GROUP BY 
 visit_source_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_225
 ZORDER BY stratum_1;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_226
USING DELTA
AS
SELECT
226 as analysis_id, 
 CAST(v.visit_concept_id AS STRING) as stratum_1,
 v.cdm_table as stratum_2,
 cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 v.record_count as count_value
FROM
(
 select 'drug_exposure' cdm_table, coalesce(visit_concept_id,0) visit_concept_id, count(*) record_count
 from etl_synthea_1k.drug_exposure t
 left join etl_synthea_1k.visit_occurrence v on t.visit_occurrence_id = v.visit_occurrence_id
 group by visit_concept_id
 union
 select 'condition_occurrence' cdm_table, coalesce(visit_concept_id,0) visit_concept_id, count(*) record_count
 from etl_synthea_1k.condition_occurrence t
 left join etl_synthea_1k.visit_occurrence v on t.visit_occurrence_id = v.visit_occurrence_id
 group by visit_concept_id
 union
 select 'device_exposure' cdm_table, coalesce(visit_concept_id,0) visit_concept_id, count(*) record_count
 from etl_synthea_1k.device_exposure t
 left join etl_synthea_1k.visit_occurrence v on t.visit_occurrence_id = v.visit_occurrence_id
 group by visit_concept_id
 union
 select 'procedure_occurrence' cdm_table, coalesce(visit_concept_id,0) visit_concept_id, count(*) record_count
 from etl_synthea_1k.procedure_occurrence t
 left join etl_synthea_1k.visit_occurrence v on t.visit_occurrence_id = v.visit_occurrence_id
 group by visit_concept_id
 union
 select 'measurement' cdm_table, coalesce(visit_concept_id,0) visit_concept_id, count(*) record_count
 from etl_synthea_1k.measurement t
 left join etl_synthea_1k.visit_occurrence v on t.visit_occurrence_id = v.visit_occurrence_id
 group by visit_concept_id
 union
 select 'observation' cdm_table, coalesce(visit_concept_id,0) visit_concept_id, count(*) record_count
 from etl_synthea_1k.observation t
 left join etl_synthea_1k.visit_occurrence v on t.visit_occurrence_id = v.visit_occurrence_id
 group by visit_concept_id
) v;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_300
USING DELTA
AS
SELECT
300 as analysis_id, 
cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
COUNT(distinct provider_id) as count_value
FROM
etl_synthea_1k.provider;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_301
USING DELTA
AS
SELECT
301 as analysis_id,
CAST(specialty_concept_id AS STRING) as stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
COUNT(distinct provider_id) as count_value
FROM
etl_synthea_1k.provider
group by specialty_CONCEPT_ID;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_301
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_303 
USING DELTA
AS
SELECT
303 as analysis_id,
 cast(p.specialty_concept_id AS STRING) AS stratum_1,
 cast(vo.visit_concept_id AS STRING) AS stratum_2,
 cast(null as STRING) as stratum_3,
 cast(null as STRING) as stratum_4,
 cast(null as STRING) as stratum_5, 
 COUNT(*) AS count_value
FROM
etl_synthea_1k.provider p
 join etl_synthea_1k.visit_occurrence vo
 on vo.provider_id = p.provider_id
 group by p.specialty_concept_id, visit_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_303 
  ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_325 
USING DELTA
AS
SELECT
325 as analysis_id,
 cast(specialty_source_concept_id AS STRING) AS stratum_1,
 cast(null AS STRING) AS stratum_2,
 cast(null as STRING) as stratum_3,
 cast(null as STRING) as stratum_4,
 cast(null as STRING) as stratum_5, 
 COUNT(*) AS count_value
FROM
etl_synthea_1k.provider
 group by specialty_source_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_325 
  ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_400
USING DELTA
AS
SELECT
400 AS analysis_id,
 CAST(co.condition_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(DISTINCT co.person_id) AS count_value
FROM
etl_synthea_1k.condition_occurrence co
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 co.person_id = op.person_id
AND 
 co.condition_start_date >= op.observation_period_start_date
AND 
 co.condition_start_date <= op.observation_period_end_date
GROUP BY 
 co.condition_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_400
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_401
USING DELTA
AS
SELECT
401 AS analysis_id,
 CAST(co.condition_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(co.person_id) AS count_value
FROM
etl_synthea_1k.condition_occurrence co
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 co.person_id = op.person_id
AND 
 co.condition_start_date >= op.observation_period_start_date
AND 
 co.condition_start_date <= op.observation_period_end_date
GROUP BY 
 co.condition_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_401
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_402
USING DELTA
AS
WITH rawData  AS (
SELECT 
 co.condition_concept_id AS stratum_1,
 YEAR(co.condition_start_date) * 100 + MONTH(co.condition_start_date) AS stratum_2,
 COUNT(DISTINCT co.person_id) AS count_value
FROM 
 etl_synthea_1k.condition_occurrence co
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 co.person_id = op.person_id
AND 
 co.condition_start_date >= op.observation_period_start_date
AND 
 co.condition_start_date <= op.observation_period_end_date
GROUP BY 
 co.condition_concept_id,
 YEAR(co.condition_start_date) * 100 + MONTH(co.condition_start_date)
)
 SELECT
402 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_402
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_403
USING DELTA
AS
WITH rawData(person_id, count_value)  AS (
SELECT 
 co.person_id,
 COUNT(DISTINCT co.condition_concept_id) AS count_value
FROM 
 etl_synthea_1k.condition_occurrence co
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 co.person_id = op.person_id
AND 
 co.condition_start_date >= op.observation_period_start_date
AND 
 co.condition_start_date <= op.observation_period_end_date
GROUP BY 
 co.person_id
),
overallStats (avg_value, stdev_value, min_value, max_value, total) as
(
 select CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 from rawData
),
statsView (count_value, total, rn) as
(
 select count_value, 
 COUNT(*) as total, 
 row_number() over (order by count_value) as rn
 FROM rawData
 group by count_value
),
priorStats (count_value, total, accumulated) as
(
 select s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on p.rn <= s.rn
 group by s.count_value, s.total, s.rn
)
 SELECT
403 as analysis_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
CROSS JOIN overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_403
 ZORDER BY count_value;
--HINT DISTRIBUTE_ON_KEY(count_value) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_403
USING DELTA
AS
SELECT
analysis_id, 
cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_403
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_403
 ZORDER BY count_value;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_403;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_403;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_404
USING DELTA
AS
WITH rawData  AS (
SELECT 
 co.condition_concept_id AS stratum_1,
 YEAR(co.condition_start_date) AS stratum_2,
 p.gender_concept_id AS stratum_3,
 FLOOR((YEAR(co.condition_start_date) - p.year_of_birth) / 10) AS stratum_4,
 COUNT(DISTINCT p.person_id) AS count_value
FROM 
 etl_synthea_1k.person p
JOIN 
 etl_synthea_1k.condition_occurrence co 
ON 
 p.person_id = co.person_id
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 co.person_id = op.person_id
AND 
 co.condition_start_date >= op.observation_period_start_date
AND 
 co.condition_start_date <= op.observation_period_end_date
GROUP BY 
 co.condition_concept_id,
 YEAR(co.condition_start_date),
 p.gender_concept_id,
 FLOOR((YEAR(co.condition_start_date) - p.year_of_birth) / 10)
)
 SELECT
404 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(stratum_3 AS STRING) AS stratum_3,
 CAST(stratum_4 AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_404
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_405
USING DELTA
AS
SELECT
405 AS analysis_id,
 CAST(co.condition_concept_id AS STRING) AS stratum_1,
 CAST(co.condition_type_concept_id AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(co.person_id) AS count_value
FROM
etl_synthea_1k.condition_occurrence co
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 co.person_id = op.person_id
AND 
 co.condition_start_date >= op.observation_period_start_date
AND 
 co.condition_start_date <= op.observation_period_end_date
GROUP BY 
 co.condition_CONCEPT_ID,
 co.condition_type_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_405
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(subject_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpderawData_406
USING DELTA
AS
SELECT
c.condition_concept_id AS subject_id,
 p.gender_concept_id,
 (c.condition_start_year - p.year_of_birth) AS count_value
FROM
etl_synthea_1k.person p
JOIN (
 SELECT 
 co.person_id,
 co.condition_concept_id,
 MIN(YEAR(co.condition_start_date)) AS condition_start_year
 FROM 
 etl_synthea_1k.condition_occurrence co
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 co.person_id = op.person_id
 AND 
 co.condition_start_date >= op.observation_period_start_date
 AND 
 co.condition_start_date <= op.observation_period_end_date
 GROUP BY 
 co.person_id,
 co.condition_concept_id
 ) c 
ON 
 p.person_id = c.person_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpderawData_406
 ZORDER BY subject_id;
--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_406
USING DELTA
AS
WITH overallStats (stratum1_id, stratum2_id, avg_value, stdev_value, min_value, max_value, total)  AS (
 select subject_id as stratum1_id,
 gender_concept_id as stratum2_id,
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_406
 group by subject_id, gender_concept_id
),
statsView (stratum1_id, stratum2_id, count_value, total, rn) as
(
 select subject_id as stratum1_id, gender_concept_id as stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by subject_id, gender_concept_id order by count_value) as rn
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_406
 group by subject_id, gender_concept_id, count_value
),
priorStats (stratum1_id, stratum2_id, count_value, total, accumulated) as
(
 select s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
 group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn
)
 SELECT
406 as analysis_id,
 CAST(o.stratum1_id AS STRING) AS stratum1_id,
 CAST(o.stratum2_id AS STRING) AS stratum2_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id 
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_406
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_406
USING DELTA
AS
SELECT
analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2, 
cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_406
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_406
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_406;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_406;
truncate Table etl_synthea_1k_ach_res.ujk3kpderawData_406;
drop table etl_synthea_1k_ach_res.ujk3kpderawData_406;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_414
USING DELTA
AS
SELECT
414 AS analysis_id,
 CAST(co.condition_status_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.condition_occurrence co
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 co.person_id = op.person_id
AND 
 co.condition_start_date >= op.observation_period_start_date
AND 
 co.condition_start_date <= op.observation_period_end_date
GROUP BY 
 co.condition_status_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_414
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_415
USING DELTA
AS
SELECT
415 AS analysis_id,
 CAST(co.condition_type_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.condition_occurrence co
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 co.person_id = op.person_id
AND 
 co.condition_start_date >= op.observation_period_start_date
AND 
 co.condition_start_date <= op.observation_period_end_date
GROUP BY 
 co.condition_type_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_415
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_416
USING DELTA
AS
SELECT
416 AS analysis_id,
 CAST(co.condition_status_concept_id AS STRING) AS stratum_1,
 CAST(co.condition_type_concept_id AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.condition_occurrence co
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 co.person_id = op.person_id
AND 
 co.condition_start_date >= op.observation_period_start_date
AND 
 co.condition_start_date <= op.observation_period_end_date
GROUP BY 
 co.condition_status_concept_id, co.condition_type_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_416
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_420
USING DELTA
AS
WITH rawData  AS (
SELECT 
 YEAR(co.condition_start_date) * 100 + MONTH(co.condition_start_date) AS stratum_1,
 COUNT(co.person_id) AS count_value
FROM 
 etl_synthea_1k.condition_occurrence co
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 co.person_id = op.person_id
AND 
 co.condition_start_date >= op.observation_period_start_date
AND 
 co.condition_start_date <= op.observation_period_end_date
GROUP BY 
 YEAR(co.condition_start_date) * 100 + MONTH(co.condition_start_date)
)
 SELECT
420 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_420
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_425
USING DELTA
AS
SELECT
425 AS analysis_id,
 CAST(co.condition_source_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.condition_occurrence co
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 co.person_id = op.person_id
AND 
 co.condition_start_date >= op.observation_period_start_date
AND 
 co.condition_start_date <= op.observation_period_end_date
GROUP BY 
 co.condition_source_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_425
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_500
USING DELTA
AS
SELECT
500 AS analysis_id,
 CAST(d.cause_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(DISTINCT d.person_id) AS count_value
FROM
etl_synthea_1k.death d
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 d.person_id = op.person_id
AND 
 d.death_date >= op.observation_period_start_date
AND 
 d.death_date <= op.observation_period_end_date 
GROUP BY 
 d.cause_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_500
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_501
USING DELTA
AS
SELECT
501 AS analysis_id,
 CAST(d.cause_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(d.person_id) AS count_value
FROM
etl_synthea_1k.death d
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 d.person_id = op.person_id
AND 
 d.death_date >= op.observation_period_start_date
AND 
 d.death_date <= op.observation_period_end_date 
GROUP BY 
 d.cause_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_501
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_502
USING DELTA
AS
WITH rawData  AS (
SELECT 
 YEAR(d.death_date) * 100 + MONTH(d.death_date) AS stratum_1,
 COUNT(DISTINCT d.person_id) AS count_value
FROM 
 etl_synthea_1k.death d
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 d.person_id = op.person_id
AND 
 d.death_date >= op.observation_period_start_date
AND 
 d.death_date <= op.observation_period_end_date 
GROUP BY 
 YEAR(d.death_date) * 100 + MONTH(d.death_date)
)
 SELECT
502 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_502
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_504
USING DELTA
AS
WITH rawData  AS (
SELECT 
 YEAR(d.death_date) AS stratum_1,
 p.gender_concept_id AS stratum_2,
 FLOOR((YEAR(d.death_date) - p.year_of_birth) / 10) AS stratum_3,
 COUNT(DISTINCT p.person_id) AS count_value
FROM 
 etl_synthea_1k.person p
JOIN 
 etl_synthea_1k.death d 
ON 
 p.person_id = d.person_id
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 d.person_id = op.person_id
AND 
 d.death_date >= op.observation_period_start_date
AND 
 d.death_date <= op.observation_period_end_date 
GROUP BY 
 YEAR(d.death_date),
 p.gender_concept_id,
 FLOOR((YEAR(d.death_date) - p.year_of_birth) / 10)
)
 SELECT
504 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(stratum_3 AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_504
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_505
USING DELTA
AS
SELECT
505 AS analysis_id,
 CAST(d.death_type_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(d.person_id) AS count_value
FROM
etl_synthea_1k.death d
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 d.person_id = op.person_id
AND 
 d.death_date >= op.observation_period_start_date
AND 
 d.death_date <= op.observation_period_end_date 
GROUP BY 
 d.death_type_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_505
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_506
USING DELTA
AS
WITH rawData(stratum_id, count_value)  AS (
SELECT 
 p.gender_concept_id AS stratum_id,
 d.death_year - p.year_of_birth AS count_value
FROM 
 etl_synthea_1k.person p
JOIN (
 SELECT 
 d.person_id,
 MIN(YEAR(d.death_date)) AS death_year
 FROM 
 etl_synthea_1k.death d
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 d.person_id = op.person_id
 AND 
 d.death_date >= op.observation_period_start_date
 AND 
 d.death_date <= op.observation_period_end_date 
 GROUP BY 
 d.person_id
 ) d
ON 
 p.person_id = d.person_id
),
overallStats (stratum_id, avg_value, stdev_value, min_value, max_value, total) as
(
 select stratum_id,
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 FROM rawData
 group by stratum_id
),
statsView (stratum_id, count_value, total, rn) as
(
 select stratum_id, count_value, COUNT(*) as total, row_number() over (order by count_value) as rn
 FROM rawData
 group by stratum_id, count_value
),
priorStats (stratum_id, count_value, total, accumulated) as
(
 select s.stratum_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum_id = p.stratum_id and p.rn <= s.rn
 group by s.stratum_id, s.count_value, s.total, s.rn
)
 SELECT
506 as analysis_id,
 CAST(o.stratum_id AS STRING) AS stratum_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum_id = o.stratum_id
GROUP BY o.stratum_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_506
 ZORDER BY stratum_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_506
USING DELTA
AS
SELECT
analysis_id, stratum_id as stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_506
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_506
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_506;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_506;

--HINT DISTRIBUTE_ON_KEY(count_value) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_511
USING DELTA
AS
SELECT
511 AS analysis_id,
 CAST(NULL AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(count_value) AS count_value,
 MIN(count_value) AS min_value,
 MAX(count_value) AS max_value,
 CAST(AVG(1.0 * count_value) AS FLOAT) AS avg_value,
 CAST(STDDEV(count_value) AS FLOAT) AS stdev_value,
 MAX(CASE WHEN p1 <= 0.50 THEN count_value ELSE - 9999 END) AS median_value,
 MAX(CASE WHEN p1 <= 0.10 THEN count_value ELSE - 9999 END) AS p10_value,
 MAX(CASE WHEN p1 <= 0.25 THEN count_value ELSE - 9999 END) AS p25_value,
 MAX(CASE WHEN p1 <= 0.75 THEN count_value ELSE - 9999 END) AS p75_value,
 MAX(CASE WHEN p1 <= 0.90 THEN count_value ELSE - 9999 END) AS p90_value
FROM
(
SELECT 
 datediff(co.max_date,d.death_date) AS count_value,
 1.0 * (ROW_NUMBER() OVER (ORDER BY datediff(co.max_date,d.death_date))) / (COUNT(*) OVER () + 1) AS p1
FROM 
 etl_synthea_1k.death d
JOIN (
 SELECT 
 co.person_id,
 MAX(co.condition_start_date) AS max_date
 FROM 
 etl_synthea_1k.condition_occurrence co
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 co.person_id = op.person_id
 AND 
 co.condition_start_date >= op.observation_period_start_date
 AND 
 co.condition_start_date <= op.observation_period_end_date 
 GROUP BY 
 co.person_id
 ) co 
ON d.person_id = co.person_id
 ) t1;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_511
 ZORDER BY count_value;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_512
USING DELTA
AS
WITH rawData(count_value)  AS (
SELECT 
 datediff(de.max_date,d.death_date) AS count_value
FROM 
 etl_synthea_1k.death d
JOIN (
 SELECT 
 de.person_id,
 MAX(de.drug_exposure_start_date) AS max_date
 FROM 
 etl_synthea_1k.drug_exposure de
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 de.person_id = op.person_id
 AND 
 de.drug_exposure_start_date >= op.observation_period_start_date
 AND 
 de.drug_exposure_start_date <= op.observation_period_end_date 
 GROUP BY 
 de.person_id
 ) de
ON 
 d.person_id = de.person_id
),
overallStats (avg_value, stdev_value, min_value, max_value, total) as
(
 select CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 from rawData
),
statsView (count_value, total, rn) as
(
 select count_value, 
 COUNT(*) as total, 
 row_number() over (order by count_value) as rn
 FROM rawData
 group by count_value
),
priorStats (count_value, total, accumulated) as
(
 select s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on p.rn <= s.rn
 group by s.count_value, s.total, s.rn
)
 SELECT
512 as analysis_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
CROSS JOIN overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_512
 ZORDER BY count_value;
--HINT DISTRIBUTE_ON_KEY(count_value) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_512
USING DELTA
AS
SELECT
analysis_id, 
cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_512
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_512
 ZORDER BY count_value;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_512;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_512;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_513
USING DELTA
AS
WITH rawData(count_value)  AS (
SELECT 
 datediff(vo.max_date,d.death_date) AS count_value
FROM 
 etl_synthea_1k.death d
JOIN (
 SELECT 
 vo.person_id,
 MAX(vo.visit_start_date) AS max_date
 FROM 
 etl_synthea_1k.visit_occurrence vo
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 vo.person_id = op.person_id
 AND 
 vo.visit_start_date >= op.observation_period_start_date
 AND 
 vo.visit_start_date <= op.observation_period_end_date 
 GROUP BY 
 vo.person_id
 ) vo
ON 
 d.person_id = vo.person_id
),
overallStats (avg_value, stdev_value, min_value, max_value, total) as
(
 select CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 from rawData
),
statsView (count_value, total, rn) as
(
 select count_value, 
 COUNT(*) as total, 
 row_number() over (order by count_value) as rn
 FROM rawData
 group by count_value
),
priorStats (count_value, total, accumulated) as
(
 select s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on p.rn <= s.rn
 group by s.count_value, s.total, s.rn
)
 SELECT
513 as analysis_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
CROSS JOIN overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_513
 ZORDER BY count_value;
--HINT DISTRIBUTE_ON_KEY(count_value) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_513
USING DELTA
AS
SELECT
analysis_id, 
cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_513
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_513
 ZORDER BY count_value;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_513;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_513;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_514
USING DELTA
AS
WITH rawData(count_value)  AS (
SELECT 
 datediff(po.max_date,d.death_date) AS count_value
FROM 
 etl_synthea_1k.death d
JOIN (
 SELECT 
 po.person_id,
 MAX(po.procedure_date) AS max_date
 FROM 
 etl_synthea_1k.procedure_occurrence po
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 po.person_id = op.person_id
 AND 
 po.procedure_date >= op.observation_period_start_date
 AND 
 po.procedure_date <= op.observation_period_end_date 
 GROUP BY 
 po.person_id
 ) po
ON 
 d.person_id = po.person_id
),
overallStats (avg_value, stdev_value, min_value, max_value, total) as
(
 select CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 from rawData
),
statsView (count_value, total, rn) as
(
 select count_value, 
 COUNT(*) as total, 
 row_number() over (order by count_value) as rn
 FROM rawData
 group by count_value
),
priorStats (count_value, total, accumulated) as
(
 select s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on p.rn <= s.rn
 group by s.count_value, s.total, s.rn
)
 SELECT
514 as analysis_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
CROSS JOIN overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_514
 ZORDER BY count_value;
--HINT DISTRIBUTE_ON_KEY(count_value) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_514
USING DELTA
AS
SELECT
analysis_id, 
cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_514
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_514
 ZORDER BY count_value;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_514;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_514;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_515
USING DELTA
AS
WITH rawData(count_value)  AS (
SELECT 
 datediff(o.max_date,d.death_date) AS count_value
FROM 
 etl_synthea_1k.death d
JOIN (
 SELECT 
 o.person_id,
 MAX(o.observation_date) AS max_date
 FROM 
 etl_synthea_1k.observation o
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 o.person_id = op.person_id
 AND 
 o.observation_date >= op.observation_period_start_date
 AND 
 o.observation_date <= op.observation_period_end_date 
 GROUP BY 
 o.person_id
 ) o
ON 
 d.person_id = o.person_id
),
overallStats (avg_value, stdev_value, min_value, max_value, total) as
(
 select CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 from rawData
),
statsView (count_value, total, rn) as
(
 select count_value, 
 COUNT(*) as total, 
 row_number() over (order by count_value) as rn
 FROM rawData
 group by count_value
),
priorStats (count_value, total, accumulated) as
(
 select s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on p.rn <= s.rn
 group by s.count_value, s.total, s.rn
)
 SELECT
515 as analysis_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
CROSS JOIN overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_515
 ZORDER BY count_value;
--HINT DISTRIBUTE_ON_KEY(count_value) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_515
USING DELTA
AS
SELECT
analysis_id, 
cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_515
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_515
 ZORDER BY count_value;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_515;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_515;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_525 
USING DELTA
AS
SELECT
525 as analysis_id,
 cast(cause_source_concept_id AS STRING) AS stratum_1,
 cast(null AS STRING) AS stratum_2,
 cast(null as STRING) as stratum_3,
 cast(null as STRING) as stratum_4,
 cast(null as STRING) as stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.death
 group by cause_source_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_525 
  ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_600
USING DELTA
AS
SELECT
600 AS analysis_id,
 CAST(po.procedure_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(DISTINCT po.person_id) AS count_value
FROM
etl_synthea_1k.procedure_occurrence po
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 po.person_id = op.person_id
AND 
 po.procedure_date >= op.observation_period_start_date
AND 
 po.procedure_date <= op.observation_period_end_date
GROUP BY 
 po.procedure_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_600
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_601
USING DELTA
AS
SELECT
601 AS analysis_id,
 CAST(po.procedure_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(po.person_id) AS count_value
FROM
etl_synthea_1k.procedure_occurrence po
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 po.person_id = op.person_id
AND 
 po.procedure_date >= op.observation_period_start_date
AND 
 po.procedure_date <= op.observation_period_end_date
GROUP BY 
 po.procedure_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_601
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_602
USING DELTA
AS
WITH rawData  AS (
SELECT 
 po.procedure_concept_id AS stratum_1,
 YEAR(po.procedure_date) * 100 + MONTH(po.procedure_date) AS stratum_2,
 COUNT(DISTINCT po.person_id) AS count_value
FROM 
 etl_synthea_1k.procedure_occurrence po
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 po.person_id = op.person_id
AND 
 po.procedure_date >= op.observation_period_start_date
AND 
 po.procedure_date <= op.observation_period_end_date
GROUP BY 
 po.procedure_concept_id,
 YEAR(po.procedure_date) * 100 + MONTH(po.procedure_date)
)
 SELECT
602 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_602
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_603
USING DELTA
AS
WITH rawData(count_value)  AS (
SELECT 
 COUNT(DISTINCT po.procedure_concept_id) AS count_value
FROM 
 etl_synthea_1k.procedure_occurrence po
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 po.person_id = op.person_id
AND 
 po.procedure_date >= op.observation_period_start_date
AND 
 po.procedure_date <= op.observation_period_end_date
GROUP BY 
 po.person_id
),
overallStats (avg_value, stdev_value, min_value, max_value, total) as
(
 select CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 from rawData
),
statsView (count_value, total, rn) as
(
 select count_value, 
 COUNT(*) as total, 
 row_number() over (order by count_value) as rn
 FROM rawData
 group by count_value
),
priorStats (count_value, total, accumulated) as
(
 select s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on p.rn <= s.rn
 group by s.count_value, s.total, s.rn
)
 SELECT
603 as analysis_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
CROSS JOIN overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_603
 ZORDER BY count_value;
--HINT DISTRIBUTE_ON_KEY(count_value) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_603
USING DELTA
AS
SELECT
analysis_id, 
cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_603
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_603
 ZORDER BY count_value;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_603;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_603;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_604
USING DELTA
AS
WITH rawData  AS (
SELECT 
 po.procedure_concept_id AS stratum_1,
 YEAR(po.procedure_date) AS stratum_2,
 p.gender_concept_id AS stratum_3,
 FLOOR((YEAR(po.procedure_date) - p.year_of_birth) / 10) AS stratum_4,
 COUNT(DISTINCT p.person_id) AS count_value
FROM 
 etl_synthea_1k.person p
JOIN 
 etl_synthea_1k.procedure_occurrence po 
ON 
 p.person_id = po.person_id
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 po.person_id = op.person_id
AND 
 po.procedure_date >= op.observation_period_start_date
AND 
 po.procedure_date <= op.observation_period_end_date
GROUP BY 
 po.procedure_concept_id,
 YEAR(po.procedure_date),
 p.gender_concept_id,
 FLOOR((YEAR(po.procedure_date) - p.year_of_birth) / 10)
)
 SELECT
604 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(stratum_3 AS STRING) AS stratum_3,
 CAST(stratum_4 AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_604
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_605
USING DELTA
AS
SELECT
605 AS analysis_id,
 CAST(po.procedure_CONCEPT_ID AS STRING) AS stratum_1,
 CAST(po.procedure_type_concept_id AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(po.person_id) AS count_value
FROM
etl_synthea_1k.procedure_occurrence po
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 po.person_id = op.person_id
AND 
 po.procedure_date >= op.observation_period_start_date
AND 
 po.procedure_date <= op.observation_period_end_date
GROUP BY 
 po.procedure_CONCEPT_ID,
 po.procedure_type_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_605
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(subject_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpderawData_606
USING DELTA
AS
SELECT
po.procedure_concept_id AS subject_id,
 p.gender_concept_id,
 po.procedure_start_year - p.year_of_birth AS count_value
FROM
etl_synthea_1k.person p
JOIN (
 SELECT 
 po.person_id,
 po.procedure_concept_id,
 MIN(YEAR(po.procedure_date)) AS procedure_start_year
 FROM 
 etl_synthea_1k.procedure_occurrence po
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 po.person_id = op.person_id
 AND 
 po.procedure_date >= op.observation_period_start_date
 AND 
 po.procedure_date <= op.observation_period_end_date
 GROUP BY 
 po.person_id,
 po.procedure_concept_id
 ) po 
ON 
 p.person_id = po.person_id
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpderawData_606
 ZORDER BY subject_id;
--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_606
USING DELTA
AS
WITH overallStats (stratum1_id, stratum2_id, avg_value, stdev_value, min_value, max_value, total)  AS (
 select subject_id as stratum1_id,
 gender_concept_id as stratum2_id,
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_606
 group by subject_id, gender_concept_id
),
statsView (stratum1_id, stratum2_id, count_value, total, rn) as
(
 select subject_id as stratum1_id, gender_concept_id as stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by subject_id, gender_concept_id order by count_value) as rn
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_606
 group by subject_id, gender_concept_id, count_value
),
priorStats (stratum1_id, stratum2_id, count_value, total, accumulated) as
(
 select s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
 group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn
)
 SELECT
606 as analysis_id,
 CAST(o.stratum1_id AS STRING) AS stratum1_id,
 CAST(o.stratum2_id AS STRING) AS stratum2_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id 
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_606
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_606
USING DELTA
AS
SELECT
analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2, 
cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_606
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_606
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_606;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_606;
truncate table etl_synthea_1k_ach_res.ujk3kpderawData_606;
drop table etl_synthea_1k_ach_res.ujk3kpderawData_606;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_620
USING DELTA
AS
WITH rawData  AS (
SELECT 
 YEAR(po.procedure_date) * 100 + MONTH(po.procedure_date) AS stratum_1,
 COUNT(po.person_id) AS count_value
FROM
 etl_synthea_1k.procedure_occurrence po
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 po.person_id = op.person_id
AND 
 po.procedure_date >= op.observation_period_start_date
AND 
 po.procedure_date <= op.observation_period_end_date
GROUP BY 
 YEAR(po.procedure_date)*100 + MONTH(po.procedure_date)
)
 SELECT
620 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_620
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_625
USING DELTA
AS
SELECT
625 AS analysis_id,
 CAST(po.procedure_source_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.procedure_occurrence po
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 po.person_id = op.person_id
AND 
 po.procedure_date >= op.observation_period_start_date
AND 
 po.procedure_date <= op.observation_period_end_date
GROUP BY 
 po.procedure_source_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_625
 ZORDER BY stratum_1;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_630
USING DELTA
AS
SELECT
630 AS analysis_id,
 CAST(NULL AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.procedure_occurrence po
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 po.person_id = op.person_id
AND 
 po.procedure_date >= op.observation_period_start_date
AND 
 po.procedure_date <= op.observation_period_end_date;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_691
USING DELTA
AS
SELECT
691 AS analysis_id,
 CAST(po.procedure_concept_id AS STRING) AS stratum_1,
 CAST(po.prc_cnt AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 SUM(COUNT(po.person_id)) OVER (PARTITION BY po.procedure_concept_id ORDER BY po.prc_cnt DESC) AS count_value
FROM
(
 SELECT 
 po.procedure_concept_id,
 COUNT(po.procedure_occurrence_id) AS prc_cnt,
 po.person_id
 FROM 
 etl_synthea_1k.procedure_occurrence po
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 po.person_id = op.person_id
 AND 
 po.procedure_date >= op.observation_period_start_date
 AND 
 po.procedure_date <= op.observation_period_end_date
 GROUP BY 
 po.person_id,
 po.procedure_concept_id
 ) po
GROUP BY 
 po.procedure_concept_id,
 po.prc_cnt;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_691
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_700
USING DELTA
AS
SELECT
700 AS analysis_id,
 CAST(de.drug_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(DISTINCT de.person_id) AS count_value
FROM
etl_synthea_1k.drug_exposure de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_exposure_start_date >= op.observation_period_start_date
AND 
 de.drug_exposure_start_date <= op.observation_period_end_date
GROUP BY 
 de.drug_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_700
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_701
USING DELTA
AS
SELECT
701 AS analysis_id,
 CAST(de.drug_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(de.person_id) AS count_value
FROM
etl_synthea_1k.drug_exposure de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_exposure_start_date >= op.observation_period_start_date
AND 
 de.drug_exposure_start_date <= op.observation_period_end_date
GROUP BY 
 de.drug_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_701
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_702
USING DELTA
AS
WITH rawData  AS (
SELECT 
 de.drug_concept_id AS stratum_1,
 YEAR(de.drug_exposure_start_date) * 100 + MONTH(de.drug_exposure_start_date) AS stratum_2,
 COUNT(DISTINCT de.person_id) AS count_value
FROM 
 etl_synthea_1k.drug_exposure de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_exposure_start_date >= op.observation_period_start_date
AND 
 de.drug_exposure_start_date <= op.observation_period_end_date
GROUP BY 
 de.drug_concept_id,
 YEAR(de.drug_exposure_start_date) * 100 + MONTH(de.drug_exposure_start_date)
)
 SELECT
702 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_702
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_703
USING DELTA
AS
WITH rawData(count_value)  AS (
SELECT 
 COUNT(DISTINCT de.drug_concept_id) AS count_value
FROM 
 etl_synthea_1k.drug_exposure de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_exposure_start_date >= op.observation_period_start_date
AND 
 de.drug_exposure_start_date <= op.observation_period_end_date
GROUP BY 
 de.person_id
),
overallStats (avg_value, stdev_value, min_value, max_value, total) as
(
 select CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 from rawData
),
statsView (count_value, total, rn) as
(
 select count_value, 
 COUNT(*) as total, 
 row_number() over (order by count_value) as rn
 FROM rawData
 group by count_value
),
priorStats (count_value, total, accumulated) as
(
 select s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on p.rn <= s.rn
 group by s.count_value, s.total, s.rn
)
 SELECT
703 as analysis_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
CROSS JOIN overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_703
 ZORDER BY count_value;
--HINT DISTRIBUTE_ON_KEY(count_value) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_703
USING DELTA
AS
SELECT
analysis_id, 
cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_703
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_703
 ZORDER BY count_value;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_703;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_703;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_704
USING DELTA
AS
WITH rawData  AS (
SELECT 
 de.drug_concept_id AS stratum_1,
 YEAR(de.drug_exposure_start_date) AS stratum_2,
 p.gender_concept_id AS stratum_3,
 FLOOR((YEAR(de.drug_exposure_start_date) - p.year_of_birth) / 10) AS stratum_4,
 COUNT(DISTINCT p.person_id) AS count_value
FROM 
 etl_synthea_1k.person p
JOIN 
 etl_synthea_1k.drug_exposure de 
ON 
 p.person_id = de.person_id
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_exposure_start_date >= op.observation_period_start_date
AND 
 de.drug_exposure_start_date <= op.observation_period_end_date
GROUP BY 
 de.drug_concept_id,
 YEAR(de.drug_exposure_start_date),
 p.gender_concept_id,
 FLOOR((YEAR(de.drug_exposure_start_date) - p.year_of_birth) / 10)
)
 SELECT
704 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(stratum_3 AS STRING) AS stratum_3,
 CAST(stratum_4 AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_704
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_705
USING DELTA
AS
SELECT
705 AS analysis_id,
 CAST(de.drug_concept_id AS STRING) AS stratum_1,
 CAST(de.drug_type_concept_id AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(de.person_id) AS count_value
FROM
etl_synthea_1k.drug_exposure de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_exposure_start_date >= op.observation_period_start_date
AND 
 de.drug_exposure_start_date <= op.observation_period_end_date
GROUP BY 
 de.drug_CONCEPT_ID,
 de.drug_type_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_705
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(subject_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpderawData_706
USING DELTA
AS
SELECT
de.drug_concept_id AS subject_id,
 p.gender_concept_id,
 de.drug_start_year - p.year_of_birth AS count_value
FROM
etl_synthea_1k.person p
JOIN (
 SELECT 
 de.person_id,
 de.drug_concept_id,
 MIN(YEAR(de.drug_exposure_start_date)) AS drug_start_year
 FROM 
 etl_synthea_1k.drug_exposure de
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 de.person_id = op.person_id
 AND 
 de.drug_exposure_start_date >= op.observation_period_start_date
 AND 
 de.drug_exposure_start_date <= op.observation_period_end_date
 GROUP BY 
 de.person_id,
 de.drug_concept_id
 ) de 
ON 
 p.person_id = de.person_id
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpderawData_706
 ZORDER BY subject_id;
--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_706
USING DELTA
AS
WITH overallStats (stratum1_id, stratum2_id, avg_value, stdev_value, min_value, max_value, total)  AS (
 select subject_id as stratum1_id,
 gender_concept_id as stratum2_id,
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_706
 group by subject_id, gender_concept_id
),
statsView (stratum1_id, stratum2_id, count_value, total, rn) as
(
 select subject_id as stratum1_id, gender_concept_id as stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by subject_id, gender_concept_id order by count_value) as rn
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_706
 group by subject_id, gender_concept_id, count_value
),
priorStats (stratum1_id, stratum2_id, count_value, total, accumulated) as
(
 select s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
 group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn
)
 SELECT
706 as analysis_id,
 CAST(o.stratum1_id AS STRING) AS stratum1_id,
 CAST(o.stratum2_id AS STRING) AS stratum2_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id 
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_706
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_706
USING DELTA
AS
SELECT
analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2, 
cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_706
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_706
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpderawData_706;
drop table etl_synthea_1k_ach_res.ujk3kpderawData_706;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_706;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_706;

--HINT DISTRIBUTE_ON_KEY(stratum_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_715
USING DELTA
AS
WITH rawData(stratum_id, count_value)  AS (
SELECT 
 de.drug_concept_id AS stratum_id,
 de.days_supply AS count_value
FROM 
 etl_synthea_1k.drug_exposure de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_exposure_start_date >= op.observation_period_start_date
AND 
 de.drug_exposure_start_date <= op.observation_period_end_date
WHERE 
 de.days_supply IS NOT NULL
),
overallStats (stratum_id, avg_value, stdev_value, min_value, max_value, total) as
(
 select stratum_id,
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 FROM rawData
 group by stratum_id
),
statsView (stratum_id, count_value, total, rn) as
(
 select stratum_id, count_value, COUNT(*) as total, row_number() over (partition by stratum_id order by count_value) as rn
 FROM rawData
 group by stratum_id, count_value
),
priorStats (stratum_id, count_value, total, accumulated) as
(
 select s.stratum_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum_id = p.stratum_id and p.rn <= s.rn
 group by s.stratum_id, s.count_value, s.total, s.rn
)
 SELECT
715 as analysis_id,
 CAST(o.stratum_id AS STRING) AS stratum_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum_id = o.stratum_id
GROUP BY o.stratum_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_715
 ZORDER BY stratum_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_715
USING DELTA
AS
SELECT
analysis_id, stratum_id as stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_715
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_715
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_715;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_715;

--HINT DISTRIBUTE_ON_KEY(stratum_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_716
USING DELTA
AS
WITH rawData(stratum_id, count_value)  AS (
SELECT 
 de.drug_concept_id AS stratum_id,
 de.refills AS count_value
FROM 
 etl_synthea_1k.drug_exposure de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_exposure_start_date >= op.observation_period_start_date
AND 
 de.drug_exposure_start_date <= op.observation_period_end_date
WHERE 
 de.refills IS NOT NULL
),
overallStats (stratum_id, avg_value, stdev_value, min_value, max_value, total) as
(
 select stratum_id,
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 FROM rawData
 group by stratum_id
),
statsView (stratum_id, count_value, total, rn) as
(
 select stratum_id, count_value, COUNT(*) as total, row_number() over (partition by stratum_id order by count_value) as rn
 FROM rawData
 group by stratum_id, count_value
),
priorStats (stratum_id, count_value, total, accumulated) as
(
 select s.stratum_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum_id = p.stratum_id and p.rn <= s.rn
 group by s.stratum_id, s.count_value, s.total, s.rn
)
 SELECT
716 as analysis_id,
 CAST(o.stratum_id AS STRING) AS stratum_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum_id = o.stratum_id
GROUP BY o.stratum_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_716
 ZORDER BY stratum_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_716
USING DELTA
AS
SELECT
analysis_id, stratum_id as stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_716
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_716
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_716;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_716;

--HINT DISTRIBUTE_ON_KEY(stratum_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_717
USING DELTA
AS
WITH rawData(stratum_id, count_value)  AS (
SELECT 
 de.drug_concept_id AS stratum_id,
 CAST(de.quantity AS FLOAT) AS count_value
FROM 
 etl_synthea_1k.drug_exposure de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_exposure_start_date >= op.observation_period_start_date
AND 
 de.drug_exposure_start_date <= op.observation_period_end_date
WHERE 
 de.quantity IS NOT NULL
),
overallStats (stratum_id, avg_value, stdev_value, min_value, max_value, total) as
(
 select stratum_id,
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 FROM rawData
 group by stratum_id
),
statsView (stratum_id, count_value, total, rn) as
(
 select stratum_id, count_value, COUNT(*) as total, row_number() over (order by count_value) as rn
 FROM rawData
 group by stratum_id, count_value
),
priorStats (stratum_id, count_value, total, accumulated) as
(
 select s.stratum_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum_id = p.stratum_id and p.rn <= s.rn
 group by s.stratum_id, s.count_value, s.total, s.rn
)
 SELECT
717 as analysis_id,
 CAST(o.stratum_id AS STRING) AS stratum_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum_id = o.stratum_id
GROUP BY o.stratum_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_717
 ZORDER BY stratum_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_717
USING DELTA
AS
SELECT
analysis_id, stratum_id as stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_717
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_717
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_717;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_717;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_720
USING DELTA
AS
WITH rawData  AS (
SELECT 
 YEAR(de.drug_exposure_start_date) * 100 + MONTH(de.drug_exposure_start_date) AS stratum_1,
 COUNT(de.person_id) AS count_value
FROM 
 etl_synthea_1k.drug_exposure de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_exposure_start_date >= op.observation_period_start_date
AND 
 de.drug_exposure_start_date <= op.observation_period_end_date 
GROUP BY 
 YEAR(de.drug_exposure_start_date)*100 + MONTH(de.drug_exposure_start_date)
)
 SELECT
720 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_720
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_725
USING DELTA
AS
SELECT
725 AS analysis_id,
 CAST(de.drug_source_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.drug_exposure de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_exposure_start_date >= op.observation_period_start_date
AND 
 de.drug_exposure_start_date <= op.observation_period_end_date
GROUP BY 
 de.drug_source_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_725
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_791
USING DELTA
AS
SELECT
791 AS analysis_id,
 CAST(de.drug_concept_id AS STRING) AS stratum_1,
 CAST(de.drg_cnt AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 SUM(COUNT(de.person_id)) OVER (PARTITION BY de.drug_concept_id ORDER BY de.drg_cnt DESC) AS count_value
FROM
(
 SELECT 
 de.drug_concept_id,
 COUNT(de.drug_exposure_id) AS drg_cnt,
 de.person_id
 FROM 
 etl_synthea_1k.drug_exposure de
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 de.person_id = op.person_id
 AND 
 de.drug_exposure_start_date >= op.observation_period_start_date
 AND 
 de.drug_exposure_start_date <= op.observation_period_end_date
 GROUP BY 
 de.person_id,
 de.drug_concept_id
 ) de
GROUP BY 
 de.drug_concept_id, 
 de.drg_cnt;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_791
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_800
USING DELTA
AS
SELECT
800 AS analysis_id,
 CAST(o.observation_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(DISTINCT o.person_id) AS count_value
FROM
etl_synthea_1k.observation o
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 o.person_id = op.person_id
AND 
 o.observation_date >= op.observation_period_start_date
AND 
 o.observation_date <= op.observation_period_end_date
GROUP BY 
 o.observation_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_800
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_801
USING DELTA
AS
SELECT
801 AS analysis_id,
 CAST(o.observation_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(o.person_id) AS count_value
FROM
etl_synthea_1k.observation o
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 o.person_id = op.person_id
AND 
 o.observation_date >= op.observation_period_start_date
AND 
 o.observation_date <= op.observation_period_end_date
GROUP BY 
 o.observation_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_801
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_802
USING DELTA
AS
WITH rawData  AS (
SELECT 
 o.observation_concept_id AS stratum_1,
 YEAR(o.observation_date) * 100 + MONTH(o.observation_date) AS stratum_2,
 COUNT(DISTINCT o.person_id) AS count_value
FROM 
 etl_synthea_1k.observation o
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 o.person_id = op.person_id
AND 
 o.observation_date >= op.observation_period_start_date
AND 
 o.observation_date <= op.observation_period_end_date
GROUP BY 
 o.observation_concept_id,
 YEAR(o.observation_date) * 100 + MONTH(o.observation_date)
)
 SELECT
802 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_802
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_803
USING DELTA
AS
WITH rawData(count_value)  AS (
SELECT 
 COUNT(DISTINCT o.observation_concept_id) AS count_value
FROM 
 etl_synthea_1k.observation o
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 o.person_id = op.person_id
AND 
 o.observation_date >= op.observation_period_start_date
AND 
 o.observation_date <= op.observation_period_end_date
GROUP BY 
 o.person_id
),
overallStats (avg_value, stdev_value, min_value, max_value, total) as
(
 select CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 from rawData
),
statsView (count_value, total, rn) as
(
 select count_value, 
 COUNT(*) as total, 
 row_number() over (order by count_value) as rn
 FROM rawData
 group by count_value
),
priorStats (count_value, total, accumulated) as
(
 select s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on p.rn <= s.rn
 group by s.count_value, s.total, s.rn
)
 SELECT
803 as analysis_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
CROSS JOIN overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_803
 ZORDER BY count_value;
--HINT DISTRIBUTE_ON_KEY(count_value) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_803
USING DELTA
AS
SELECT
analysis_id, 
cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_803
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_803
 ZORDER BY count_value;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_803;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_803;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_804
USING DELTA
AS
WITH rawData  AS (
SELECT 
 o.observation_concept_id AS stratum_1,
 YEAR(o.observation_date) AS stratum_2,
 p.gender_concept_id AS stratum_3,
 FLOOR((YEAR(o.observation_date) - p.year_of_birth) / 10) AS stratum_4,
 COUNT(DISTINCT p.person_id) AS count_value
FROM 
 etl_synthea_1k.person p
JOIN 
 etl_synthea_1k.observation o 
ON 
 p.person_id = o.person_id
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 o.person_id = op.person_id
AND 
 o.observation_date >= op.observation_period_start_date
AND 
 o.observation_date <= op.observation_period_end_date
GROUP BY 
 o.observation_concept_id,
 YEAR(o.observation_date),
 p.gender_concept_id,
 FLOOR((YEAR(o.observation_date) - p.year_of_birth) / 10)
)
 SELECT
804 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(stratum_3 AS STRING) AS stratum_3,
 CAST(stratum_4 AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_804
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_805
USING DELTA
AS
SELECT
805 AS analysis_id,
 CAST(o.observation_concept_id AS STRING) AS stratum_1,
 CAST(o.observation_type_concept_id AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(o.person_id) AS count_value
FROM
etl_synthea_1k.observation o
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 o.person_id = op.person_id
AND 
 o.observation_date >= op.observation_period_start_date
AND 
 o.observation_date <= op.observation_period_end_date
GROUP BY 
 o.observation_concept_id,
 o.observation_type_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_805
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(subject_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpderawData_806
USING DELTA
AS
SELECT
o.observation_concept_id AS subject_id,
 p.gender_concept_id,
 o.observation_start_year - p.year_of_birth AS count_value
FROM
etl_synthea_1k.person p
JOIN (
 SELECT 
 o.person_id,
 o.observation_concept_id,
 MIN(YEAR(o.observation_date)) AS observation_start_year
 FROM 
 etl_synthea_1k.observation o
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 o.person_id = op.person_id
 AND 
 o.observation_date >= op.observation_period_start_date
 AND 
 o.observation_date <= op.observation_period_end_date
 GROUP BY 
 o.person_id,
 o.observation_concept_id
 ) o
ON 
 p.person_id = o.person_id
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpderawData_806
 ZORDER BY subject_id;
--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_806
USING DELTA
AS
WITH overallStats (stratum1_id, stratum2_id, avg_value, stdev_value, min_value, max_value, total)  AS (
 select subject_id as stratum1_id,
 gender_concept_id as stratum2_id,
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_806
 group by subject_id, gender_concept_id
),
statsView (stratum1_id, stratum2_id, count_value, total, rn) as
(
 select subject_id as stratum1_id, gender_concept_id as stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by subject_id, gender_concept_id order by count_value) as rn
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_806
 group by subject_id, gender_concept_id, count_value
),
priorStats (stratum1_id, stratum2_id, count_value, total, accumulated) as
(
 select s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
 group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn
)
 SELECT
806 as analysis_id,
 CAST(o.stratum1_id AS STRING) AS stratum1_id,
 CAST(o.stratum2_id AS STRING) AS stratum2_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id 
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_806
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_806
USING DELTA
AS
SELECT
analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2, 
cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_806
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_806
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpderawData_806;
drop table etl_synthea_1k_ach_res.ujk3kpderawData_806;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_806;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_806;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_807
USING DELTA
AS
SELECT
807 AS analysis_id,
 CAST(o.observation_concept_id AS STRING) AS stratum_1,
 CAST(o.unit_concept_id AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(o.person_id) AS count_value
FROM
etl_synthea_1k.observation o
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 o.person_id = op.person_id
AND 
 o.observation_date >= op.observation_period_start_date
AND 
 o.observation_date <= op.observation_period_end_date
GROUP BY 
 o.observation_CONCEPT_ID,
 o.unit_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_807
 ZORDER BY stratum_1;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_814
USING DELTA
AS
SELECT
814 as analysis_id, 
 cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(o1.PERSON_ID) as count_value
FROM
etl_synthea_1k.observation o1
where o1.value_as_number is null
 and o1.value_as_string is null
 and o1.value_as_concept_id is null;

--HINT DISTRIBUTE_ON_KEY(stratum1_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdeoverallStats_815
USING DELTA
AS
SELECT
o.subject_id AS stratum1_id,
 o.unit_concept_id AS stratum2_id,
 CAST(AVG(1.0 * o.count_value) AS FLOAT) AS avg_value,
 CAST(STDDEV(count_value) AS FLOAT) AS stdev_value,
 MIN(o.count_value) AS min_value,
 MAX(o.count_value) AS max_value,
 COUNT(*) AS total
FROM
(
 SELECT 
 o.observation_concept_id AS subject_id,
 o.unit_concept_id,
 CAST(o.value_as_number AS FLOAT) AS count_value
 FROM 
 etl_synthea_1k.observation o
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 o.person_id = op.person_id
 AND 
 o.observation_date >= op.observation_period_start_date
 AND 
 o.observation_date <= op.observation_period_end_date
 WHERE 
 o.unit_concept_id IS NOT NULL
 AND 
 o.value_as_number IS NOT NULL
 ) o
GROUP BY 
 o.subject_id,
 o.unit_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdeoverallStats_815
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum1_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdestatsView_815
USING DELTA
AS
SELECT
o.subject_id AS stratum1_id,
 o.unit_concept_id AS stratum2_id,
 o.count_value,
 COUNT(*) AS total,
 ROW_NUMBER() OVER (PARTITION BY o.subject_id,o.unit_concept_id ORDER BY o.count_value) AS rn
FROM
(
 SELECT 
 o.observation_concept_id AS subject_id,
 o.unit_concept_id,
 CAST(o.value_as_number AS FLOAT) AS count_value
 FROM 
 etl_synthea_1k.observation o
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 o.person_id = op.person_id
 AND 
 o.observation_date >= op.observation_period_start_date
 AND 
 o.observation_date <= op.observation_period_end_date
 WHERE 
 o.unit_concept_id IS NOT NULL
 AND 
 o.value_as_number IS NOT NULL
 ) o
GROUP BY 
 o.subject_id,
 o.unit_concept_id,
 o.count_value;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdestatsView_815
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_815
USING DELTA
AS
WITH priorStats (stratum1_id, stratum2_id, count_value, total, accumulated)  AS (
 select s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
 from etl_synthea_1k_ach_res.ujk3kpdestatsView_815 s
 join etl_synthea_1k_ach_res.ujk3kpdestatsView_815 p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
 group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn
)
 SELECT
815 as analysis_id,
 CAST(o.stratum1_id AS STRING) AS stratum1_id,
 CAST(o.stratum2_id AS STRING) AS stratum2_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join etl_synthea_1k_ach_res.ujk3kpdeoverallStats_815 o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id 
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_815
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_815
USING DELTA
AS
SELECT
analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2, 
cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_815
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_815
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdeoverallStats_815;
drop table etl_synthea_1k_ach_res.ujk3kpdeoverallStats_815;
truncate table etl_synthea_1k_ach_res.ujk3kpdestatsView_815;
drop table etl_synthea_1k_ach_res.ujk3kpdestatsView_815;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_815;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_815;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_820
USING DELTA
AS
WITH rawData  AS (
SELECT 
 YEAR(o.observation_date) * 100 + MONTH(o.observation_date) AS stratum_1,
 COUNT(o.person_id) AS count_value
FROM 
 etl_synthea_1k.observation o
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 o.person_id = op.person_id
AND 
 o.observation_date >= op.observation_period_start_date
AND 
 o.observation_date <= op.observation_period_end_date
GROUP BY 
 YEAR(o.observation_date) * 100 + MONTH(o.observation_date)
)
 SELECT
820 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_820
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_822
USING DELTA
AS
SELECT
822 AS analysis_id,
 CAST(o.observation_concept_id AS STRING) AS stratum_1,
 CAST(o.value_as_concept_id AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.observation o
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 o.person_id = op.person_id
AND 
 o.observation_date >= op.observation_period_start_date
AND 
 o.observation_date <= op.observation_period_end_date
GROUP BY 
 o.observation_concept_id,
 o.value_as_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_822
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_823
USING DELTA
AS
SELECT
823 AS analysis_id,
 CAST(o.observation_concept_id AS STRING) AS stratum_1,
 CAST(o.qualifier_concept_id AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.observation o
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 o.person_id = op.person_id
AND 
 o.observation_date >= op.observation_period_start_date
AND 
 o.observation_date <= op.observation_period_end_date
GROUP BY 
 o.observation_concept_id,
 o.qualifier_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_823
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_825
USING DELTA
AS
SELECT
825 AS analysis_id,
 CAST(o.observation_source_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.observation o
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 o.person_id = op.person_id
AND 
 o.observation_date >= op.observation_period_start_date
AND 
 o.observation_date <= op.observation_period_end_date
GROUP BY 
 o.observation_source_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_825
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_826
USING DELTA
AS
SELECT
826 AS analysis_id,
 CAST(o.value_as_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.observation o
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 o.person_id = op.person_id
AND 
 o.observation_date >= op.observation_period_start_date
AND 
 o.observation_date <= op.observation_period_end_date
GROUP BY 
 o.value_as_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_826
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_827
USING DELTA
AS
SELECT
827 AS analysis_id,
 CAST(o.unit_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.observation o
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 o.person_id = op.person_id
AND 
 o.observation_date >= op.observation_period_start_date
AND 
 o.observation_date <= op.observation_period_end_date
GROUP BY 
 o.unit_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_827
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_891
USING DELTA
AS
SELECT
891 AS analysis_id,
 CAST(o.observation_concept_id AS STRING) AS stratum_1,
 CAST(o.obs_cnt AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 SUM(COUNT(o.person_id)) OVER (PARTITION BY o.observation_concept_id ORDER BY o.obs_cnt DESC) AS count_value
FROM
(
 SELECT 
 o.observation_concept_id,
 COUNT(o.observation_id) AS obs_cnt,
 o.person_id
 FROM 
 etl_synthea_1k.observation o
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 o.person_id = op.person_id
 AND 
 o.observation_date >= op.observation_period_start_date
 AND 
 o.observation_date <= op.observation_period_end_date
 GROUP BY 
 o.person_id,
 o.observation_concept_id
 ) o
GROUP BY 
 o.observation_concept_id, 
 o.obs_cnt;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_891
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_900
USING DELTA
AS
SELECT
900 AS analysis_id,
 CAST(de.drug_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(DISTINCT de.person_id) AS count_value
FROM
etl_synthea_1k.drug_era de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_era_start_date >= op.observation_period_start_date
AND 
 de.drug_era_start_date <= op.observation_period_end_date
GROUP BY 
 de.drug_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_900
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_901
USING DELTA
AS
SELECT
901 AS analysis_id,
 CAST(de.drug_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(de.person_id) AS count_value
FROM
etl_synthea_1k.drug_era de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_era_start_date >= op.observation_period_start_date
AND 
 de.drug_era_start_date <= op.observation_period_end_date
GROUP BY 
 de.drug_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_901
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_902
USING DELTA
AS
WITH rawData  AS (
SELECT 
 de.drug_concept_id AS stratum_1,
 YEAR(de.drug_era_start_date) * 100 + MONTH(de.drug_era_start_date) AS stratum_2,
 COUNT(DISTINCT de.person_id) AS count_value
FROM 
 etl_synthea_1k.drug_era de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_era_start_date >= op.observation_period_start_date
AND 
 de.drug_era_start_date <= op.observation_period_end_date
GROUP BY 
 de.drug_concept_id,
 YEAR(de.drug_era_start_date) * 100 + MONTH(de.drug_era_start_date)
)
 SELECT
902 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_902
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_903
USING DELTA
AS
WITH rawData(count_value)  AS (
SELECT
 COUNT(DISTINCT de.drug_concept_id) AS count_value
FROM 
 etl_synthea_1k.drug_era de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_era_start_date >= op.observation_period_start_date
AND 
 de.drug_era_start_date <= op.observation_period_end_date
GROUP BY 
 de.person_id
),
overallStats (avg_value, stdev_value, min_value, max_value, total) as
(
 select CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 from rawData
),
statsView (count_value, total, rn) as
(
 select count_value, 
 COUNT(*) as total, 
 row_number() over (order by count_value) as rn
 FROM rawData
 group by count_value
),
priorStats (count_value, total, accumulated) as
(
 select s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on p.rn <= s.rn
 group by s.count_value, s.total, s.rn
)
 SELECT
903 as analysis_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
CROSS JOIN overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_903
 ZORDER BY count_value;
--HINT DISTRIBUTE_ON_KEY(count_value) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_903
USING DELTA
AS
SELECT
analysis_id, 
cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_903
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_903
 ZORDER BY count_value;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_903;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_903;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_904
USING DELTA
AS
WITH rawData  AS (
SELECT 
 de.drug_concept_id AS stratum_1,
 YEAR(de.drug_era_start_date) AS stratum_2,
 p.gender_concept_id AS stratum_3,
 FLOOR((YEAR(de.drug_era_start_date) - p.year_of_birth) / 10) AS stratum_4,
 COUNT(DISTINCT p.person_id) AS count_value
FROM 
 etl_synthea_1k.person p
JOIN 
 etl_synthea_1k.drug_era de 
ON 
 p.person_id = de.person_id
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_era_start_date >= op.observation_period_start_date
AND 
 de.drug_era_start_date <= op.observation_period_end_date
GROUP BY 
 de.drug_concept_id,
 YEAR(de.drug_era_start_date),
 p.gender_concept_id,
 FLOOR((YEAR(de.drug_era_start_date) - p.year_of_birth) / 10)
)
 SELECT
904 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(stratum_3 AS STRING) AS stratum_3,
 CAST(stratum_4 AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_904
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(subject_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpderawData_906
USING DELTA
AS
SELECT
de.drug_concept_id AS subject_id,
 p.gender_concept_id,
 de.drug_start_year - p.year_of_birth AS count_value
FROM
etl_synthea_1k.person p
JOIN (
 SELECT 
 de.person_id,
 de.drug_concept_id,
 MIN(YEAR(de.drug_era_start_date)) AS drug_start_year
 FROM 
 etl_synthea_1k.drug_era de
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 de.person_id = op.person_id
 AND 
 de.drug_era_start_date >= op.observation_period_start_date
 AND 
 de.drug_era_start_date <= op.observation_period_end_date 
 GROUP BY 
 de.person_id,
 de.drug_concept_id
 ) de 
ON 
 p.person_id = de.person_id
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpderawData_906
 ZORDER BY subject_id;
--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_906
USING DELTA
AS
WITH overallStats (stratum1_id, stratum2_id, avg_value, stdev_value, min_value, max_value, total)  AS (
 select subject_id as stratum1_id,
 gender_concept_id as stratum2_id,
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_906
 group by subject_id, gender_concept_id
),
statsView (stratum1_id, stratum2_id, count_value, total, rn) as
(
 select subject_id as stratum1_id, gender_concept_id as stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by subject_id, gender_concept_id order by count_value) as rn
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_906
 group by subject_id, gender_concept_id, count_value
),
priorStats (stratum1_id, stratum2_id, count_value, total, accumulated) as
(
 select s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
 group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn
)
 SELECT
906 as analysis_id,
 CAST(o.stratum1_id AS STRING) AS stratum1_id,
 CAST(o.stratum2_id AS STRING) AS stratum2_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id 
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_906
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_906
USING DELTA
AS
SELECT
analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2, 
cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_906
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_906
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpderawData_906;
drop table etl_synthea_1k_ach_res.ujk3kpderawData_906;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_906;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_906;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_907
USING DELTA
AS
WITH rawData(stratum1_id, count_value)  AS (
SELECT 
 de.drug_concept_id AS stratum1_id,
 datediff(de.drug_era_end_date,de.drug_era_start_date) AS count_value
FROM 
 etl_synthea_1k.drug_era de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_era_start_date >= op.observation_period_start_date
AND 
 de.drug_era_start_date <= op.observation_period_end_date
),
overallStats (stratum1_id, avg_value, stdev_value, min_value, max_value, total) as
(
 select stratum1_id, 
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 from rawData
 group by stratum1_id
),
statsView (stratum1_id, count_value, total, rn) as
(
 select stratum1_id, 
 count_value, 
 COUNT(*) as total, 
 row_number() over (partition by stratum1_id order by count_value) as rn
 FROM rawData
 group by stratum1_id, count_value
),
priorStats (stratum1_id, count_value, total, accumulated) as
(
 select s.stratum1_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum1_id = p.stratum1_id and p.rn <= s.rn
 group by s.stratum1_id, s.count_value, s.total, s.rn
)
 SELECT
907 as analysis_id,
 CAST(p.stratum1_id AS STRING) as stratum_1,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum1_id = o.stratum1_id
GROUP BY p.stratum1_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_907
 ZORDER BY stratum_1;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_907
USING DELTA
AS
SELECT
analysis_id, stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_907
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_907
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_907;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_907;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_920
USING DELTA
AS
WITH rawData  AS (
SELECT 
 YEAR(de.drug_era_start_date) * 100 + MONTH(de.drug_era_start_date) AS stratum_1,
 COUNT(de.person_id) AS count_value
FROM 
 etl_synthea_1k.drug_era de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.drug_era_start_date >= op.observation_period_start_date
AND 
 de.drug_era_start_date <= op.observation_period_end_date
GROUP BY 
 YEAR(de.drug_era_start_date)*100 + MONTH(de.drug_era_start_date)
)
 SELECT
920 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_920
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1000
USING DELTA
AS
SELECT
1000 AS analysis_id,
 CAST(ce.condition_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(DISTINCT ce.person_id) AS count_value
FROM
etl_synthea_1k.condition_era ce
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 ce.person_id = op.person_id
AND 
 ce.condition_era_start_date >= op.observation_period_start_date
AND 
 ce.condition_era_start_date <= op.observation_period_end_date 
GROUP BY 
 ce.condition_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1000
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1001
USING DELTA
AS
SELECT
1001 AS analysis_id,
 CAST(ce.condition_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(ce.person_id) AS count_value
FROM
etl_synthea_1k.condition_era ce
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 ce.person_id = op.person_id
AND 
 ce.condition_era_start_date >= op.observation_period_start_date
AND 
 ce.condition_era_start_date <= op.observation_period_end_date 
GROUP BY 
 ce.condition_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1001
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1002
USING DELTA
AS
WITH rawData  AS (
SELECT 
 ce.condition_concept_id AS stratum_1,
 YEAR(ce.condition_era_start_date) * 100 + MONTH(ce.condition_era_start_date) AS stratum_2,
 COUNT(DISTINCT ce.person_id) AS count_value
FROM 
 etl_synthea_1k.condition_era ce
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 ce.person_id = op.person_id
AND 
 ce.condition_era_start_date >= op.observation_period_start_date
AND 
 ce.condition_era_start_date <= op.observation_period_end_date 
GROUP BY 
 ce.condition_concept_id,
 YEAR(ce.condition_era_start_date) * 100 + MONTH(ce.condition_era_start_date)
)
 SELECT
1002 as analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1002
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1003
USING DELTA
AS
WITH rawData(count_value)  AS (
SELECT 
 COUNT(DISTINCT ce.condition_concept_id) AS count_value
FROM 
 etl_synthea_1k.condition_era ce
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 ce.person_id = op.person_id
AND 
 ce.condition_era_start_date >= op.observation_period_start_date
AND 
 ce.condition_era_start_date <= op.observation_period_end_date 
GROUP BY 
 ce.person_id
),
overallStats (avg_value, stdev_value, min_value, max_value, total) as
(
 select CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 from rawData
),
statsView (count_value, total, rn) as
(
 select count_value, 
 COUNT(*) as total, 
 row_number() over (order by count_value) as rn
 FROM rawData
 group by count_value
),
priorStats (count_value, total, accumulated) as
(
 select s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on p.rn <= s.rn
 group by s.count_value, s.total, s.rn
)
 SELECT
1003 as analysis_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
CROSS JOIN overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_1003
 ZORDER BY count_value;
--HINT DISTRIBUTE_ON_KEY(count_value) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1003
USING DELTA
AS
SELECT
analysis_id, 
cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_1003
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1003
 ZORDER BY count_value;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_1003;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_1003;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1004
USING DELTA
AS
WITH rawData  AS (
SELECT 
 ce.condition_concept_id AS stratum_1,
 YEAR(ce.condition_era_start_date) AS stratum_2,
 p.gender_concept_id AS stratum_3,
 FLOOR((YEAR(ce.condition_era_start_date) - p.year_of_birth) / 10) AS stratum_4,
 COUNT(DISTINCT p.person_id) AS count_value
FROM 
 etl_synthea_1k.person p
JOIN 
 etl_synthea_1k.condition_era ce 
ON 
 p.person_id = ce.person_id
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 ce.person_id = op.person_id
AND 
 ce.condition_era_start_date >= op.observation_period_start_date
AND 
 ce.condition_era_start_date <= op.observation_period_end_date 
GROUP BY 
 ce.condition_concept_id,
 YEAR(ce.condition_era_start_date),
 p.gender_concept_id,
 FLOOR((YEAR(ce.condition_era_start_date) - p.year_of_birth) / 10)
)
 SELECT
1004 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(stratum_3 AS STRING) AS stratum_3,
 CAST(stratum_4 AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1004
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(subject_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpderawData_1006
USING DELTA
AS
SELECT
ce.condition_concept_id AS subject_id,
 p.gender_concept_id,
 ce.condition_start_year - p.year_of_birth AS count_value
FROM
etl_synthea_1k.person p
JOIN (
 SELECT 
 ce.person_id,
 ce.condition_concept_id,
 MIN(YEAR(ce.condition_era_start_date)) AS condition_start_year
 FROM 
 etl_synthea_1k.condition_era ce
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 ce.person_id = op.person_id
 AND 
 ce.condition_era_start_date >= op.observation_period_start_date
 AND 
 ce.condition_era_start_date <= op.observation_period_end_date 
 GROUP BY 
 ce.person_id,
 ce.condition_concept_id
 ) ce 
ON 
 p.person_id = ce.person_id
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpderawData_1006
 ZORDER BY subject_id;
--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1006
USING DELTA
AS
WITH overallStats (stratum1_id, stratum2_id, avg_value, stdev_value, min_value, max_value, total)  AS (
 select subject_id as stratum1_id,
 gender_concept_id as stratum2_id,
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_1006
 group by subject_id, gender_concept_id
),
statsView (stratum1_id, stratum2_id, count_value, total, rn) as
(
 select subject_id as stratum1_id, gender_concept_id as stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by subject_id, gender_concept_id order by count_value) as rn
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_1006
 group by subject_id, gender_concept_id, count_value
),
priorStats (stratum1_id, stratum2_id, count_value, total, accumulated) as
(
 select s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
 group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn
)
 SELECT
1006 as analysis_id,
 CAST(o.stratum1_id AS STRING) AS stratum1_id,
 CAST(o.stratum2_id AS STRING) AS stratum2_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id 
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_1006
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1006
USING DELTA
AS
SELECT
analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2, 
cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_1006
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1006
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpderawData_1006;
drop table etl_synthea_1k_ach_res.ujk3kpderawData_1006;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_1006;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_1006;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1007
USING DELTA
AS
WITH rawData(stratum1_id, count_value)  AS (
SELECT 
 ce.condition_concept_id AS stratum1_id,
 datediff(ce.condition_era_end_date,ce.condition_era_start_date) AS count_value
FROM 
 etl_synthea_1k.condition_era ce
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 ce.person_id = op.person_id
AND 
 ce.condition_era_start_date >= op.observation_period_start_date
AND 
 ce.condition_era_start_date <= op.observation_period_end_date 
),
overallStats (stratum1_id, avg_value, stdev_value, min_value, max_value, total) as
(
 select stratum1_id, 
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 from rawData
 group by stratum1_id
),
statsView (stratum1_id, count_value, total, rn) as
(
 select stratum1_id, 
 count_value, 
 COUNT(*) as total, 
 row_number() over (partition by stratum1_id order by count_value) as rn
 FROM rawData
 group by stratum1_id, count_value
),
priorStats (stratum1_id, count_value, total, accumulated) as
(
 select s.stratum1_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum1_id = p.stratum1_id and p.rn <= s.rn
 group by s.stratum1_id, s.count_value, s.total, s.rn
)
 SELECT
1007 as analysis_id,
 CAST(p.stratum1_id AS STRING) as stratum_1,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum1_id = o.stratum1_id
GROUP BY p.stratum1_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_1007
 ZORDER BY stratum_1;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1007
USING DELTA
AS
SELECT
analysis_id, stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_1007
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1007
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_1007;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_1007;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1020
USING DELTA
AS
WITH rawData  AS (
SELECT 
 YEAR(ce.condition_era_start_date) * 100 + MONTH(ce.condition_era_start_date) AS stratum_1,
 COUNT(ce.person_id) AS count_value
FROM 
 etl_synthea_1k.condition_era ce
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 ce.person_id = op.person_id
AND 
 ce.condition_era_start_date >= op.observation_period_start_date
AND 
 ce.condition_era_start_date <= op.observation_period_end_date 
GROUP BY 
 YEAR(ce.condition_era_start_date)*100 + MONTH(ce.condition_era_start_date)
)
 SELECT
1020 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1020
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1100
USING DELTA
AS
WITH rawData  AS (
 select
 SUBSTR(l1.zip,3) as stratum_1,
 COUNT(distinct person_id) as count_value
 from etl_synthea_1k.person p1
 inner join etl_synthea_1k.location l1
 on p1.location_id = l1.location_id
 where p1.location_id is not null
 and l1.zip is not null
 group by SUBSTR(l1.zip,3)
)
 SELECT
1100 as analysis_id,
 CAST(stratum_1 AS STRING) as stratum_1,
 cast(null as STRING) as stratum_2,
 cast(null as STRING) as stratum_3,
 cast(null as STRING) as stratum_4,
 cast(null as STRING) as stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1100
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1101
USING DELTA
AS
SELECT
1101 as analysis_id, 
 CAST(l1.state AS STRING) as stratum_1, 
 cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(distinct person_id) as count_value
FROM
etl_synthea_1k.person p1
 inner join etl_synthea_1k.location l1
 on p1.location_id = l1.location_id
where p1.location_id is not null
 and l1.state is not null
group by l1.state;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1101
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1102
USING DELTA
AS
WITH rawData  AS (
 select
 SUBSTR(l1.zip,3) as stratum_1,
 COUNT(distinct care_site_id) as count_value
 from etl_synthea_1k.care_site cs1
 inner join etl_synthea_1k.location l1
 on cs1.location_id = l1.location_id
 where cs1.location_id is not null
 and l1.zip is not null
 group by SUBSTR(l1.zip,3)
)
 SELECT
1102 as analysis_id,
 CAST(stratum_1 AS STRING) as stratum_1,
 cast(null as STRING) as stratum_2,
 cast(null as STRING) as stratum_3,
 cast(null as STRING) as stratum_4,
 cast(null as STRING) as stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1102
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1103
USING DELTA
AS
SELECT
1103 as analysis_id, 
 CAST(l1.state AS STRING) as stratum_1, 
 cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(distinct care_site_id) as count_value
FROM
etl_synthea_1k.care_site cs1
 inner join etl_synthea_1k.location l1
 on cs1.location_id = l1.location_id
where cs1.location_id is not null
 and l1.state is not null
group by l1.state;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1103
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1200
USING DELTA
AS
SELECT
1200 as analysis_id, 
 CAST(cs1.place_of_service_concept_id AS STRING) as stratum_1, 
 cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(person_id) as count_value
FROM
etl_synthea_1k.person p1
 inner join etl_synthea_1k.care_site cs1
 on p1.care_site_id = cs1.care_site_id
where p1.care_site_id is not null
 and cs1.place_of_service_concept_id is not null
group by cs1.place_of_service_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1200
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1201
USING DELTA
AS
SELECT
1201 as analysis_id, 
 CAST(cs1.place_of_service_concept_id AS STRING) as stratum_1, 
 cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(visit_occurrence_id) as count_value
FROM
etl_synthea_1k.visit_occurrence vo1
 inner join etl_synthea_1k.care_site cs1
 on vo1.care_site_id = cs1.care_site_id
where vo1.care_site_id is not null
 and cs1.place_of_service_concept_id is not null
group by cs1.place_of_service_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1201
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1202
USING DELTA
AS
SELECT
1202 as analysis_id, 
 CAST(cs1.place_of_service_concept_id AS STRING) as stratum_1,
 cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(care_site_id) as count_value
FROM
etl_synthea_1k.care_site cs1
where cs1.place_of_service_concept_id is not null
group by cs1.place_of_service_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1202
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1203
USING DELTA
AS
SELECT
1203 AS analysis_id,
 CAST(vo.discharge_to_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.visit_occurrence vo
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vo.person_id = op.person_id
AND 
 vo.visit_start_date >= op.observation_period_start_date
AND 
 vo.visit_start_date <= op.observation_period_end_date
WHERE 
 vo.discharge_to_concept_id != 0
GROUP BY 
 vo.discharge_to_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1203
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1300
USING DELTA
AS
SELECT
1300 AS analysis_id,
 CAST(vd.visit_detail_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(DISTINCT vd.person_id) AS count_value
FROM
etl_synthea_1k.visit_detail vd
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vd.person_id = op.person_id
AND 
 vd.visit_detail_start_date >= op.observation_period_start_date 
AND 
 vd.visit_detail_start_date <= op.observation_period_end_date
GROUP BY 
 vd.visit_detail_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1300
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1301
USING DELTA
AS
SELECT
1301 AS analysis_id,
 CAST(vd.visit_detail_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(vd.person_id) AS count_value
FROM
etl_synthea_1k.visit_detail vd
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vd.person_id = op.person_id
AND 
 vd.visit_detail_start_date >= op.observation_period_start_date 
AND 
 vd.visit_detail_start_date <= op.observation_period_end_date
GROUP BY 
 vd.visit_detail_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1301
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1302
USING DELTA
AS
WITH rawData  AS (
SELECT
 vd.visit_detail_concept_id AS stratum_1,
 YEAR(vd.visit_detail_start_date)*100 + MONTH(vd.visit_detail_start_date) AS stratum_2,
 COUNT(DISTINCT vd.person_id) AS count_value
FROM
 etl_synthea_1k.visit_detail vd 
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vd.person_id = op.person_id
AND 
 vd.visit_detail_start_date >= op.observation_period_start_date 
AND 
 vd.visit_detail_start_date <= op.observation_period_end_date
GROUP BY 
 vd.visit_detail_concept_id,
 YEAR(vd.visit_detail_start_date)*100 + MONTH(vd.visit_detail_start_date)
)
 SELECT
1302 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1302
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1303
USING DELTA
AS
WITH rawData(person_id, count_value)  AS (
SELECT 
 vd.person_id,
 COUNT(DISTINCT vd.visit_detail_concept_id) AS count_value
FROM 
 etl_synthea_1k.visit_detail vd
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vd.person_id = op.person_id
AND 
 vd.visit_detail_start_date >= op.observation_period_start_date 
AND 
 vd.visit_detail_start_date <= op.observation_period_end_date
GROUP BY 
 vd.person_id
),
overallStats (avg_value, stdev_value, min_value, max_value, total) AS
(
SELECT 
 CAST(AVG(1.0 * count_value) AS FLOAT) AS avg_value,
 CAST(STDDEV(count_value) AS FLOAT) AS stdev_value,
 MIN(count_value) AS min_value,
 MAX(count_value) AS max_value,
 COUNT(*) AS total
FROM 
 rawData
),
statsView (count_value, total, rn) AS
(
SELECT 
 count_value,
 COUNT(*) AS total,
 ROW_NUMBER() OVER (ORDER BY count_value) AS rn
FROM 
 rawData
GROUP BY 
 count_value
),
priorStats (count_value, total, accumulated) AS
(
SELECT 
 s.count_value,
 s.total,
 SUM(p.total) AS accumulated
FROM 
 statsView s
JOIN 
 statsView p ON p.rn <= s.rn
GROUP BY 
 s.count_value,
 s.total,
 s.rn
)
 SELECT
1303 AS analysis_id,
 o.total AS count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(CASE WHEN p.accumulated >= .50 * o.total THEN count_value ELSE o.max_value END) AS median_value,
 MIN(CASE WHEN p.accumulated >= .10 * o.total THEN count_value ELSE o.max_value END) AS p10_value,
 MIN(CASE WHEN p.accumulated >= .25 * o.total THEN count_value ELSE o.max_value END) AS p25_value,
 MIN(CASE WHEN p.accumulated >= .75 * o.total THEN count_value ELSE o.max_value END) AS p75_value,
 MIN(CASE WHEN p.accumulated >= .90 * o.total THEN count_value ELSE o.max_value END) AS p90_value
FROM
priorStats p
CROSS JOIN 
 overallStats o
GROUP BY 
 o.total,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_1303
 ZORDER BY count_value;
--HINT DISTRIBUTE_ON_KEY(count_value) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1303
USING DELTA
AS
SELECT
analysis_id,
 CAST(NULL AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value,
 min_value,
 max_value,
 avg_value,
 stdev_value,
 median_value,
 p10_value,
 p25_value,
 p75_value,
 p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_1303
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1303
 ZORDER BY count_value;
TRUNCATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1303;
DROP TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1303;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1304
USING DELTA
AS
WITH rawData  AS (
SELECT 
 vd.visit_detail_concept_id AS stratum_1,
 YEAR(vd.visit_detail_start_date) AS stratum_2,
 p.gender_concept_id AS stratum_3,
 FLOOR((YEAR(vd.visit_detail_start_date) - p.year_of_birth) / 10) AS stratum_4,
 COUNT(DISTINCT p.person_id) AS count_value
FROM 
 etl_synthea_1k.person p
JOIN 
 etl_synthea_1k.visit_detail vd 
ON 
 p.person_id = vd.person_id 
JOIN
 etl_synthea_1k.observation_period op 
ON 
 vd.person_id = op.person_id
AND 
 vd.visit_detail_start_date >= op.observation_period_start_date 
AND 
 vd.visit_detail_start_date <= op.observation_period_end_date
GROUP BY 
 vd.visit_detail_concept_id,
 YEAR(vd.visit_detail_start_date),
 p.gender_concept_id,
 FLOOR((YEAR(vd.visit_detail_start_date) - p.year_of_birth)/10)
)
 SELECT
1304 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(stratum_3 AS STRING) AS stratum_3,
 CAST(stratum_4 AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1304
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1306
USING DELTA
AS
WITH rawData (stratum1_id, stratum2_id, count_value)  AS (
SELECT 
 vd.visit_detail_concept_id AS stratum1_id,
 p.gender_concept_id AS stratum2_id,
 vd.visit_detail_start_year - p.year_of_birth AS count_value
FROM 
 etl_synthea_1k.person p
JOIN (
 SELECT 
 vd.person_id,
 vd.visit_detail_concept_id,
 MIN(YEAR(vd.visit_detail_start_date)) AS visit_detail_start_year
 FROM 
 etl_synthea_1k.visit_detail vd
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 vd.person_id = op.person_id
 AND 
 vd.visit_detail_start_date >= op.observation_period_start_date 
 AND 
 vd.visit_detail_start_date <= op.observation_period_end_date
 GROUP BY 
 vd.person_id,
 vd.visit_detail_concept_id
 ) vd 
ON 
 p.person_id = vd.person_id
),
overallStats (stratum1_id, stratum2_id, avg_value, stdev_value, min_value, max_value, total) AS
(
SELECT 
 stratum1_id,
 stratum2_id,
 CAST(AVG(1.0 * count_value) AS FLOAT) AS avg_value,
 CAST(STDDEV(count_value) AS FLOAT) AS stdev_value,
 MIN(count_value) AS min_value,
 MAX(count_value) AS max_value,
 COUNT(*) AS total
FROM 
 rawData
GROUP BY 
 stratum1_id,
 stratum2_id
),
statsView (stratum1_id, stratum2_id, count_value, total, rn) AS
(
SELECT 
 stratum1_id,
 stratum2_id,
 count_value,
 COUNT(*) AS total,
 ROW_NUMBER() OVER (PARTITION BY stratum1_id,stratum2_id ORDER BY count_value) AS rn
FROM 
 rawData
GROUP BY 
 stratum1_id,
 stratum2_id,
 count_value
),
priorStats (stratum1_id, stratum2_id, count_value, total, accumulated) AS
(
SELECT 
 s.stratum1_id,
 s.stratum2_id,
 s.count_value,
 s.total,
 SUM(p.total) AS accumulated
FROM 
 statsView s
JOIN 
 statsView p ON s.stratum1_id = p.stratum1_id 
 AND s.stratum2_id = p.stratum2_id 
 AND p.rn <= s.rn
GROUP BY 
 s.stratum1_id,
 s.stratum2_id,
 s.count_value,
 s.total,
 s.rn
)
 SELECT
1306 AS analysis_id,
 CAST(o.stratum1_id AS STRING) AS stratum1_id,
 CAST(o.stratum2_id AS STRING) AS stratum2_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(CASE WHEN p.accumulated >= .50 * o.total THEN count_value ELSE o.max_value END) AS median_value,
 MIN(CASE WHEN p.accumulated >= .10 * o.total THEN count_value ELSE o.max_value END) AS p10_value,
 MIN(CASE WHEN p.accumulated >= .25 * o.total THEN count_value ELSE o.max_value END) AS p25_value,
 MIN(CASE WHEN p.accumulated >= .75 * o.total THEN count_value ELSE o.max_value END) AS p75_value,
 MIN(CASE WHEN p.accumulated >= .90 * o.total THEN count_value ELSE o.max_value END) AS p90_value
FROM
priorStats p
JOIN 
 overallStats o ON p.stratum1_id = o.stratum1_id AND p.stratum2_id = o.stratum2_id 
GROUP BY 
 o.stratum1_id, 
 o.stratum2_id, 
 o.total, 
 o.min_value, 
 o.max_value, 
 o.avg_value, 
 o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_1306
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1306
USING DELTA
AS
SELECT
analysis_id,
 stratum1_id AS stratum_1,
 stratum2_id AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value,
 min_value,
 max_value,
 avg_value,
 stdev_value,
 median_value,
 p10_value,
 p25_value,
 p75_value,
 p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_1306
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1306
 ZORDER BY stratum_1;
TRUNCATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1306;
DROP TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1306;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1312
USING DELTA
AS
WITH rawData  AS (
SELECT 
 YEAR(vd.visit_detail_start_date) AS stratum_1,
 p.gender_concept_id AS stratum_2,
 FLOOR((YEAR(vd.visit_detail_start_date) - p.year_of_birth) / 10) AS stratum_3,
 COUNT(DISTINCT vd.person_id) AS count_value
FROM 
 etl_synthea_1k.person p
JOIN 
 etl_synthea_1k.visit_detail vd 
ON 
 vd.person_id = p.person_id
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vd.person_id = op.person_id
AND 
 vd.visit_detail_start_date >= op.observation_period_start_date 
AND 
 vd.visit_detail_start_date <= op.observation_period_end_date
GROUP BY 
 YEAR(vd.visit_detail_start_date),
 p.gender_concept_id,
 FLOOR((YEAR(vd.visit_detail_start_date) - p.year_of_birth) / 10)
)
 SELECT
1312 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(stratum_3 AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1312
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1313
USING DELTA
AS
WITH rawData(stratum_id, count_value)  AS (
SELECT 
 vd.visit_detail_concept_id AS stratum_id,
 datediff(vd.visit_detail_END_date,vd.visit_detail_start_date) AS count_value
FROM 
 etl_synthea_1k.visit_detail vd
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vd.person_id = op.person_id
AND 
 vd.visit_detail_start_date >= op.observation_period_start_date 
AND 
 vd.visit_detail_start_date <= op.observation_period_end_date
),
overallStats (stratum_id, avg_value, stdev_value, min_value, max_value, total) AS
(
SELECT 
 stratum_id,
 CAST(AVG(1.0 * count_value) AS FLOAT) AS avg_value,
 CAST(STDDEV(count_value) AS FLOAT) AS stdev_value,
 MIN(count_value) AS min_value,
 MAX(count_value) AS max_value,
 COUNT(*) AS total
FROM 
 rawData
GROUP BY 
 stratum_id
),
statsView (stratum_id, count_value, total, rn) AS
(
SELECT 
 stratum_id,
 count_value,
 COUNT(*) AS total,
 ROW_NUMBER() OVER (ORDER BY count_value) AS rn
FROM 
 rawData
GROUP BY 
 stratum_id,
 count_value
),
priorStats (stratum_id, count_value, total, accumulated) AS
(
SELECT 
 s.stratum_id,
 s.count_value,
 s.total,
 SUM(p.total) AS accumulated
FROM 
 statsView s
JOIN 
 statsView p 
ON 
 s.stratum_id = p.stratum_id
AND 
 p.rn <= s.rn
GROUP BY 
 s.stratum_id,
 s.count_value,
 s.total,
 s.rn
)
 SELECT
1313 AS analysis_id,
 CAST(o.stratum_id AS STRING) AS stratum_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(CASE WHEN p.accumulated >= .50 * o.total THEN count_value ELSE o.max_value END) AS median_value,
 MIN(CASE WHEN p.accumulated >= .10 * o.total THEN count_value ELSE o.max_value END) AS p10_value,
 MIN(CASE WHEN p.accumulated >= .25 * o.total THEN count_value ELSE o.max_value END) AS p25_value,
 MIN(CASE WHEN p.accumulated >= .75 * o.total THEN count_value ELSE o.max_value END) AS p75_value,
 MIN(CASE WHEN p.accumulated >= .90 * o.total THEN count_value ELSE o.max_value END) AS p90_value
FROM
priorStats p
JOIN 
 overallStats o ON p.stratum_id = o.stratum_id
GROUP BY 
 o.stratum_id, 
 o.total, 
 o.min_value, 
 o.max_value, 
 o.avg_value, 
 o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_1313
 ZORDER BY stratum_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1313
USING DELTA
AS
SELECT
analysis_id,
 stratum_id AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value,
 min_value,
 max_value,
 avg_value,
 stdev_value,
 median_value,
 p10_value,
 p25_value,
 p75_value,
 p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_1313;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1313
 ZORDER BY stratum_1;
TRUNCATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1313;
DROP TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1313;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1320
USING DELTA
AS
WITH rawData  AS (
SELECT 
 YEAR(vd.visit_detail_start_date) * 100 + MONTH(vd.visit_detail_start_date) AS stratum_1,
 COUNT(vd.person_id) AS count_value
FROM 
 etl_synthea_1k.visit_detail vd
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vd.person_id = op.person_id
AND 
 vd.visit_detail_start_date >= op.observation_period_start_date 
AND 
 vd.visit_detail_start_date <= op.observation_period_end_date
GROUP BY 
 YEAR(vd.visit_detail_start_date) * 100 + MONTH(vd.visit_detail_start_date)
)
 SELECT
1320 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1320
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1321
USING DELTA
AS
WITH rawData  AS (
SELECT 
 YEAR(vd.visit_detail_start_date) AS stratum_1,
 COUNT(DISTINCT vd.person_id) AS count_value
FROM 
 etl_synthea_1k.visit_detail vd
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vd.person_id = op.person_id
AND 
 vd.visit_detail_start_date >= op.observation_period_start_date 
AND 
 vd.visit_detail_start_date <= op.observation_period_end_date
GROUP BY 
 YEAR(vd.visit_detail_start_date)
)
 SELECT
1321 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1321
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1325
USING DELTA
AS
SELECT
1325 AS analysis_id,
 CAST(vd.visit_detail_source_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.visit_detail vd
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vd.person_id = op.person_id
AND 
 vd.visit_detail_start_date >= op.observation_period_start_date 
AND 
 vd.visit_detail_start_date <= op.observation_period_end_date
GROUP BY 
 visit_detail_source_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1325
 ZORDER BY stratum_1;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1326
USING DELTA
AS
SELECT
1326 AS analysis_id,
 CAST(v.visit_detail_concept_id AS STRING) AS stratum_1,
 v.cdm_table AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 v.record_count AS count_value
FROM
(
 SELECT 'drug_exposure' cdm_table,
 COALESCE(vd.visit_detail_concept_id, 0) visit_detail_concept_id,
 COUNT(*) record_count
 FROM 
 etl_synthea_1k.drug_exposure de
 LEFT JOIN 
 etl_synthea_1k.visit_detail vd 
 ON 
 de.visit_occurrence_id = vd.visit_occurrence_id
 GROUP BY 
 vd.visit_detail_concept_id
 UNION
 SELECT 
 'condition_occurrence' cdm_table,
 COALESCE(vd.visit_detail_concept_id, 0) visit_detail_concept_id,
 COUNT(*) record_count
 FROM 
 etl_synthea_1k.condition_occurrence co
 LEFT JOIN 
 etl_synthea_1k.visit_detail vd 
 ON 
 co.visit_occurrence_id = vd.visit_occurrence_id
 GROUP BY 
 vd.visit_detail_concept_id
 UNION
 SELECT 
 'device_exposure' cdm_table,
 COALESCE(visit_detail_concept_id, 0) visit_detail_concept_id,
 COUNT(*) record_count
 FROM 
 etl_synthea_1k.device_exposure de
 LEFT JOIN 
 etl_synthea_1k.visit_detail vd 
 ON 
 de.visit_occurrence_id = vd.visit_occurrence_id
 GROUP BY 
 vd.visit_detail_concept_id
 UNION
 SELECT 
 'procedure_occurrence' cdm_table,
 COALESCE(vd.visit_detail_concept_id, 0) visit_detail_concept_id,
 COUNT(*) record_count
 FROM 
 etl_synthea_1k.procedure_occurrence po
 LEFT JOIN 
 etl_synthea_1k.visit_detail vd 
 ON 
 po.visit_occurrence_id = vd.visit_occurrence_id
 GROUP BY 
 vd.visit_detail_concept_id
 UNION
 SELECT 
 'measurement' cdm_table,
 COALESCE(vd.visit_detail_concept_id, 0) visit_detail_concept_id,
 COUNT(*) record_count
 FROM 
 etl_synthea_1k.measurement m
 LEFT JOIN 
 etl_synthea_1k.visit_detail vd 
 ON 
 m.visit_occurrence_id = vd.visit_occurrence_id
 GROUP BY 
 vd.visit_detail_concept_id
 UNION
 SELECT 
 'observation' cdm_table,
 COALESCE(vd.visit_detail_concept_id, 0) visit_detail_concept_id,
 COUNT(*) record_count
 FROM 
 etl_synthea_1k.observation o
 LEFT JOIN 
 etl_synthea_1k.visit_detail vd 
 ON 
 o.visit_occurrence_id = vd.visit_occurrence_id
 GROUP BY 
 vd.visit_detail_concept_id
 ) v;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1406
USING DELTA
AS
WITH rawData(stratum1_id, count_value)  AS (
 select p1.gender_concept_id as stratum1_id,
 datediff(ppp1.payer_plan_period_end_date,ppp1.payer_plan_period_start_date) as count_value
 from etl_synthea_1k.person p1
 inner join 
 (select person_id, 
 payer_plan_period_START_DATE, 
 payer_plan_period_END_DATE, 
 ROW_NUMBER() over (PARTITION by person_id order by payer_plan_period_start_date asc) as rn1
 from etl_synthea_1k.payer_plan_period
 ) ppp1
 on p1.PERSON_ID = ppp1.PERSON_ID
 where ppp1.rn1 = 1
),
overallStats (stratum1_id, avg_value, stdev_value, min_value, max_value, total) as
(
 select stratum1_id, 
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 from rawData
 group by stratum1_id
),
statsView (stratum1_id, count_value, total, rn) as
(
 select stratum1_id, 
 count_value, 
 COUNT(*) as total, 
 row_number() over (partition by stratum1_id order by count_value) as rn
 FROM rawData
 group by stratum1_id, count_value
),
priorStats (stratum1_id, count_value, total, accumulated) as
(
 select s.stratum1_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum1_id = p.stratum1_id and p.rn <= s.rn
 group by s.stratum1_id, s.count_value, s.total, s.rn
)
 SELECT
1406 as analysis_id,
 CAST(p.stratum1_id AS STRING) as stratum_1,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum1_id = o.stratum1_id
GROUP BY p.stratum1_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_1406
 ZORDER BY stratum_1;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1406
USING DELTA
AS
SELECT
analysis_id, stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_1406
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1406
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_1406;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_1406;

--HINT DISTRIBUTE_ON_KEY(stratum_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1407
USING DELTA
AS
WITH rawData(stratum_id, count_value)  AS (
 select floor((year(ppp1.payer_plan_period_START_DATE) - p1.YEAR_OF_BIRTH)/10) as stratum_id,
 datediff(ppp1.payer_plan_period_end_date,ppp1.payer_plan_period_start_date) as count_value
 from etl_synthea_1k.person p1
 inner join 
 (select person_id, 
 payer_plan_period_START_DATE, 
 payer_plan_period_END_DATE, 
 ROW_NUMBER() over (PARTITION by person_id order by payer_plan_period_start_date asc) as rn1
 from etl_synthea_1k.payer_plan_period
 ) ppp1
 on p1.PERSON_ID = ppp1.PERSON_ID
 where ppp1.rn1 = 1
),
overallStats (stratum_id, avg_value, stdev_value, min_value, max_value, total) as
(
 select stratum_id,
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 FROM rawData
 group by stratum_id
),
statsView (stratum_id, count_value, total, rn) as
(
 select stratum_id, count_value, COUNT(*) as total, row_number() over (order by count_value) as rn
 FROM rawData
 group by stratum_id, count_value
),
priorStats (stratum_id, count_value, total, accumulated) as
(
 select s.stratum_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum_id = p.stratum_id and p.rn <= s.rn
 group by s.stratum_id, s.count_value, s.total, s.rn
)
 SELECT
1407 as analysis_id,
 CAST(o.stratum_id AS STRING) AS stratum_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum_id = o.stratum_id
GROUP BY o.stratum_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_1407
 ZORDER BY stratum_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1407
USING DELTA
AS
SELECT
analysis_id, stratum_id as stratum_1, 
cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_1407
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1407
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_1407;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_1407;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1408
USING DELTA
AS
SELECT
1408 as analysis_id, 
 CAST(floor(datediff(ppp1.payer_plan_period_end_date,ppp1.payer_plan_period_start_date)/30) AS STRING) as stratum_1,
 cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(distinct p1.person_id) as count_value
FROM
etl_synthea_1k.person p1
 inner join 
 (select person_id, 
 payer_plan_period_START_DATE, 
 payer_plan_period_END_DATE, 
 ROW_NUMBER() over (PARTITION by person_id order by payer_plan_period_start_date asc) as rn1
 from etl_synthea_1k.payer_plan_period
 ) ppp1
 on p1.PERSON_ID = ppp1.PERSON_ID
 where ppp1.rn1 = 1
group by CAST(floor(datediff(ppp1.payer_plan_period_end_date,ppp1.payer_plan_period_start_date)/30) AS STRING);
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1408
 ZORDER BY stratum_1;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetemp_dates_1409
USING DELTA
AS
SELECT
distinct 
 YEAR(payer_plan_period_start_date) as obs_year 
FROM
etl_synthea_1k.payer_plan_period
;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1409
USING DELTA
AS
SELECT
1409 as analysis_id, 
 CAST(t1.obs_year AS STRING) as stratum_1, 
 cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(distinct p1.PERSON_ID) as count_value
FROM
etl_synthea_1k.person p1
 inner join 
 etl_synthea_1k.payer_plan_period ppp1
 on p1.person_id = ppp1.person_id
 ,
 etl_synthea_1k_ach_res.ujk3kpdetemp_dates_1409 t1 
where year(ppp1.payer_plan_period_START_DATE) <= t1.obs_year
 and year(ppp1.payer_plan_period_END_DATE) >= t1.obs_year
group by t1.obs_year
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1409
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdetemp_dates_1409;
drop table etl_synthea_1k_ach_res.ujk3kpdetemp_dates_1409;

--HINT DISTRIBUTE_ON_KEY(obs_month) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetemp_dates_1410
USING DELTA
AS
SELECT
DISTINCT 
 YEAR(payer_plan_period_start_date)*100 + MONTH(payer_plan_period_start_date) AS obs_month,
 to_date(cast(YEAR(payer_plan_period_start_date) as string) || '-' || cast(MONTH(payer_plan_period_start_date) as string) || '-' || cast(1 as string)) as obs_month_start,
 last_day(payer_plan_period_start_date) as obs_month_end
FROM
etl_synthea_1k.payer_plan_period
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetemp_dates_1410
 ZORDER BY obs_month;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1410
USING DELTA
AS
SELECT
1410 as analysis_id, 
 CAST(obs_month AS STRING) as stratum_1,
 cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(distinct p1.PERSON_ID) as count_value
FROM
etl_synthea_1k.person p1
 inner join 
 etl_synthea_1k.payer_plan_period ppp1
 on p1.person_id = ppp1.person_id
 ,
 etl_synthea_1k_ach_res.ujk3kpdetemp_dates_1410
where ppp1.payer_plan_period_START_DATE <= obs_month_start
 and ppp1.payer_plan_period_END_DATE >= obs_month_end
group by obs_month
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1410
 ZORDER BY stratum_1;
TRUNCATE TABLE etl_synthea_1k_ach_res.ujk3kpdetemp_dates_1410;
DROP TABLE etl_synthea_1k_ach_res.ujk3kpdetemp_dates_1410;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1411
USING DELTA
AS
SELECT
1411 as analysis_id, 
 to_date(cast(YEAR(payer_plan_period_start_date) as string) || '-' || cast(MONTH(payer_plan_period_start_date) as string) || '-' || cast(1 as string)) as stratum_1,
 cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(distinct p1.PERSON_ID) as count_value
FROM
etl_synthea_1k.person p1
 inner join etl_synthea_1k.payer_plan_period ppp1
 on p1.person_id = ppp1.person_id
group by to_date(cast(YEAR(payer_plan_period_start_date) as string) || '-' || cast(MONTH(payer_plan_period_start_date) as string) || '-' || cast(1 as string));
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1411
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1412
USING DELTA
AS
SELECT
1412 as analysis_id, 
 to_date(cast(YEAR(payer_plan_period_start_date) as string) || '-' || cast(MONTH(payer_plan_period_start_date) as string) || '-' || cast(1 as string)) as stratum_1,
 cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(distinct p1.PERSON_ID) as count_value
FROM
etl_synthea_1k.person p1
 inner join etl_synthea_1k.payer_plan_period ppp1
 on p1.person_id = ppp1.person_id
group by to_date(cast(YEAR(payer_plan_period_start_date) as string) || '-' || cast(MONTH(payer_plan_period_start_date) as string) || '-' || cast(1 as string));
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1412
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1413
USING DELTA
AS
SELECT
1413 as analysis_id, 
 CAST(ppp1.num_periods AS STRING) as stratum_1,
 cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(distinct p1.PERSON_ID) as count_value
FROM
etl_synthea_1k.person p1
 inner join (select person_id, COUNT(payer_plan_period_start_date) as num_periods from etl_synthea_1k.payer_plan_period group by PERSON_ID) ppp1
 on p1.person_id = ppp1.person_id
group by ppp1.num_periods;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1413
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1425 
USING DELTA
AS
SELECT
1425 as analysis_id,
 cast(payer_source_concept_id AS STRING) AS stratum_1,
 cast(null AS STRING) AS stratum_2,
 cast(null as STRING) as stratum_3,
 cast(null as STRING) as stratum_4,
 cast(null as STRING) as stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.payer_plan_period
 group by payer_source_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1425 
  ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1800
USING DELTA
AS
SELECT
1800 AS analysis_id,
 CAST(m.measurement_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(DISTINCT m.person_id) AS count_value
FROM
etl_synthea_1k.measurement m
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 m.person_id = op.person_id
AND 
 m.measurement_date >= op.observation_period_start_date
AND 
 m.measurement_date <= op.observation_period_end_date 
GROUP BY 
 m.measurement_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1800
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1801
USING DELTA
AS
SELECT
1801 AS analysis_id,
 CAST(m.measurement_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(m.person_id) AS count_value
FROM
etl_synthea_1k.measurement m
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 m.person_id = op.person_id
AND 
 m.measurement_date >= op.observation_period_start_date
AND 
 m.measurement_date <= op.observation_period_end_date 
GROUP BY 
 m.measurement_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1801
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1802
USING DELTA
AS
WITH rawData  AS (
SELECT 
 m.measurement_concept_id AS stratum_1,
 YEAR(m.measurement_date) * 100 + MONTH(m.measurement_date) AS stratum_2,
 COUNT(DISTINCT m.person_id) AS count_value
FROM 
 etl_synthea_1k.measurement m
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 m.person_id = op.person_id
AND 
 m.measurement_date >= op.observation_period_start_date
AND 
 m.measurement_date <= op.observation_period_end_date 
GROUP BY 
 m.measurement_concept_id,
 YEAR(m.measurement_date) * 100 + MONTH(m.measurement_date)
)
 SELECT
1802 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1802
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(count_value)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1803
USING DELTA
AS
WITH rawData(count_value)  AS (
SELECT 
 COUNT(DISTINCT m.measurement_concept_id) AS count_value
FROM 
 etl_synthea_1k.measurement m
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 m.person_id = op.person_id
AND 
 m.measurement_date >= op.observation_period_start_date
AND 
 m.measurement_date <= op.observation_period_end_date 
GROUP BY 
 m.person_id
),
overallStats (avg_value, stdev_value, min_value, max_value, total) as
(
 select CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 from rawData
),
statsView (count_value, total, rn) as
(
 select count_value, 
 COUNT(*) as total, 
 row_number() over (order by count_value) as rn
 FROM rawData
 group by count_value
),
priorStats (count_value, total, accumulated) as
(
 select s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on p.rn <= s.rn
 group by s.count_value, s.total, s.rn
)
 SELECT
1803 as analysis_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
CROSS JOIN overallStats o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_1803
 ZORDER BY count_value;
--HINT DISTRIBUTE_ON_KEY(count_value) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1803
USING DELTA
AS
SELECT
analysis_id, 
cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_1803
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1803
 ZORDER BY count_value;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_1803;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_1803;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1804
USING DELTA
AS
WITH rawData  AS (
SELECT 
 m.measurement_concept_id AS stratum_1,
 YEAR(m.measurement_date) AS stratum_2,
 p.gender_concept_id AS stratum_3,
 FLOOR((YEAR(m.measurement_date) - p.year_of_birth) / 10) AS stratum_4,
 COUNT(DISTINCT p.person_id) AS count_value
FROM 
 etl_synthea_1k.person p
JOIN 
 etl_synthea_1k.measurement m 
ON 
 p.person_id = m.person_id
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 m.person_id = op.person_id
AND 
 m.measurement_date >= op.observation_period_start_date
AND 
 m.measurement_date <= op.observation_period_end_date 
GROUP BY 
 m.measurement_concept_id,
 YEAR(m.measurement_date),
 p.gender_concept_id,
 FLOOR((YEAR(m.measurement_date) - p.year_of_birth) / 10)
)
 SELECT
1804 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(stratum_3 AS STRING) AS stratum_3,
 CAST(stratum_4 AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1804
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1805
USING DELTA
AS
SELECT
1805 AS analysis_id,
 CAST(m.measurement_concept_id AS STRING) AS stratum_1,
 CAST(m.measurement_type_concept_id AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(m.person_id) AS count_value
FROM
etl_synthea_1k.measurement m
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 m.person_id = op.person_id
 AND 
 m.measurement_date >= op.observation_period_start_date
 AND 
 m.measurement_date <= op.observation_period_end_date 
GROUP BY 
 m.measurement_concept_id,
 m.measurement_type_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1805
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(subject_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpderawData_1806
USING DELTA
AS
SELECT
o.measurement_concept_id AS subject_id,
 p.gender_concept_id,
 o.measurement_start_year - p.year_of_birth AS count_value
FROM
etl_synthea_1k.person p
JOIN (
 SELECT 
 m.person_id,
 m.measurement_concept_id,
 MIN(YEAR(m.measurement_date)) AS measurement_start_year
 FROM 
 etl_synthea_1k.measurement m
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 m.person_id = op.person_id
 AND 
 m.measurement_date >= op.observation_period_start_date
 AND 
 m.measurement_date <= op.observation_period_end_date 
 GROUP BY 
 m.person_id,
 m.measurement_concept_id
 ) o
ON 
 p.person_id = o.person_id
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpderawData_1806
 ZORDER BY subject_id;
--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1806
USING DELTA
AS
WITH overallStats (stratum1_id, stratum2_id, avg_value, stdev_value, min_value, max_value, total)  AS (
 select subject_id as stratum1_id,
 gender_concept_id as stratum2_id,
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_1806
 group by subject_id, gender_concept_id
),
statsView (stratum1_id, stratum2_id, count_value, total, rn) as
(
 select subject_id as stratum1_id, gender_concept_id as stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by subject_id, gender_concept_id order by count_value) as rn
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_1806
 group by subject_id, gender_concept_id, count_value
),
priorStats (stratum1_id, stratum2_id, count_value, total, accumulated) as
(
 select s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
 group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn
)
 SELECT
1806 as analysis_id,
 CAST(o.stratum1_id AS STRING) AS stratum1_id,
 CAST(o.stratum2_id AS STRING) AS stratum2_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id 
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_1806
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1806
USING DELTA
AS
SELECT
analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2, 
cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_1806
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1806
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpderawData_1806;
drop table etl_synthea_1k_ach_res.ujk3kpderawData_1806;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_1806;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_1806;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1807
USING DELTA
AS
SELECT
1807 AS analysis_id,
 CAST(m.measurement_concept_id AS STRING) AS stratum_1,
 CAST(m.unit_concept_id AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(m.person_id) AS count_value
FROM
etl_synthea_1k.measurement m
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 m.person_id = op.person_id
AND 
 m.measurement_date >= op.observation_period_start_date
AND 
 m.measurement_date <= op.observation_period_end_date 
GROUP BY 
 m.measurement_concept_id,
 m.unit_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1807
 ZORDER BY stratum_1;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1811
USING DELTA
AS
SELECT
1811 AS analysis_id,
 CAST(NULL AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(m.person_id) AS count_value
FROM
etl_synthea_1k.measurement m
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 m.person_id = op.person_id
AND 
 m.measurement_date >= op.observation_period_start_date
AND 
 m.measurement_date <= op.observation_period_end_date 
WHERE 
 m.value_as_number IS NOT NULL
OR 
 m.value_as_concept_id != 0;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1814
USING DELTA
AS
SELECT
1814 AS analysis_id,
 CAST(NULL AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(m.person_id) AS count_value
FROM
etl_synthea_1k.measurement m
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 m.person_id = op.person_id
AND 
 m.measurement_date >= op.observation_period_start_date
AND 
 m.measurement_date <= op.observation_period_end_date 
WHERE 
 m.value_as_number IS NULL
AND 
 (m.value_as_concept_id IS NULL OR m.value_as_concept_id = 0);

--HINT DISTRIBUTE_ON_KEY(stratum1_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdestatsView_1815
USING DELTA
AS
SELECT
m.subject_id AS stratum1_id,
 m.unit_concept_id AS stratum2_id,
 m.count_value,
 COUNT(*) AS total,
 ROW_NUMBER() OVER (PARTITION BY m.subject_id,m.unit_concept_id ORDER BY m.count_value) AS rn
FROM
(
 SELECT 
 m.measurement_concept_id AS subject_id,
 m.unit_concept_id,
 CAST(m.value_as_number AS FLOAT) AS count_value
 FROM 
 etl_synthea_1k.measurement m
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 m.person_id = op.person_id
 AND 
 m.measurement_date >= op.observation_period_start_date
 AND 
 m.measurement_date <= op.observation_period_end_date 
 WHERE 
 m.value_as_number IS NOT NULL
 ) m
GROUP BY 
 m.subject_id, 
 m.unit_concept_id, 
 m.count_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdestatsView_1815
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum1_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1815
USING DELTA
AS
SELECT
1815 as analysis_id,
 CAST(o.stratum1_id AS STRING) AS stratum1_id,
 CAST(o.stratum2_id AS STRING) AS stratum2_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
(
 select s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
 from etl_synthea_1k_ach_res.ujk3kpdestatsView_1815 s
 join etl_synthea_1k_ach_res.ujk3kpdestatsView_1815 p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
 group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn
) p
join 
(
 SELECT 
 m.subject_id AS stratum1_id,
 m.unit_concept_id AS stratum2_id,
 CAST(AVG(1.0 * m.count_value) AS FLOAT) AS avg_value,
 CAST(STDDEV(m.count_value) AS FLOAT) AS stdev_value,
 MIN(m.count_value) AS min_value,
 MAX(m.count_value) AS max_value,
 COUNT(*) AS total
 FROM 
 (
 SELECT 
 m.measurement_concept_id AS subject_id,
 m.unit_concept_id,
 CAST(m.value_as_number AS FLOAT) AS count_value
 FROM 
 etl_synthea_1k.measurement m
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 m.person_id = op.person_id
 AND 
 m.measurement_date >= op.observation_period_start_date
 AND 
 m.measurement_date <= op.observation_period_end_date 
 WHERE 
 m.unit_concept_id IS NOT NULL
 AND 
 m.value_as_number IS NOT NULL
 ) m
 GROUP BY 
 m.subject_id, 
 m.unit_concept_id
) o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id 
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_1815
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1815
USING DELTA
AS
SELECT
analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2, 
cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_1815
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1815
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdestatsView_1815;
drop table etl_synthea_1k_ach_res.ujk3kpdestatsView_1815;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_1815;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_1815;

--HINT DISTRIBUTE_ON_KEY(stratum1_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdeoverallStats_1816
USING DELTA
AS
SELECT
m.subject_id AS stratum1_id,
 m.unit_concept_id AS stratum2_id,
 CAST(AVG(1.0 * m.count_value) AS FLOAT) AS avg_value,
 CAST(STDDEV(m.count_value) AS FLOAT) AS stdev_value,
 MIN(m.count_value) AS min_value,
 MAX(m.count_value) AS max_value,
 COUNT(*) AS total
FROM
(
 SELECT 
 m.measurement_concept_id AS subject_id,
 m.unit_concept_id,
 CAST(m.range_low AS FLOAT) AS count_value
 FROM 
 etl_synthea_1k.measurement m
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 m.person_id = op.person_id
 AND 
 m.measurement_date >= op.observation_period_start_date
 AND 
 m.measurement_date <= op.observation_period_end_date 
 WHERE 
 m.unit_concept_id IS NOT NULL
 AND 
 m.value_as_number IS NOT NULL
 AND 
 m.range_low IS NOT NULL
 AND 
 m.range_high IS NOT NULL
 ) m
GROUP BY 
 m.subject_id, 
 m.unit_concept_id
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdeoverallStats_1816
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum1_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdestatsView_1816
USING DELTA
AS
SELECT
m.subject_id AS stratum1_id,
 m.unit_concept_id AS stratum2_id,
 m.count_value,
 COUNT(*) AS total,
 ROW_NUMBER() OVER (PARTITION BY m.subject_id,m.unit_concept_id ORDER BY m.count_value) AS rn
FROM
(
 SELECT 
 m.measurement_concept_id AS subject_id,
 m.unit_concept_id,
 CAST(m.range_low AS FLOAT) AS count_value
 FROM 
 etl_synthea_1k.measurement m
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 m.person_id = op.person_id
 AND 
 m.measurement_date >= op.observation_period_start_date
 AND 
 m.measurement_date <= op.observation_period_end_date 
 WHERE 
 m.unit_concept_id IS NOT NULL
 AND 
 m.value_as_number IS NOT NULL
 AND 
 m.range_low IS NOT NULL
 AND 
 m.range_high IS NOT NULL
 ) m
GROUP BY 
 m.subject_id, 
 m.unit_concept_id, 
 m.count_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdestatsView_1816
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum1_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1816
USING DELTA
AS
SELECT
1816 as analysis_id,
 CAST(o.stratum1_id AS STRING) AS stratum1_id,
 CAST(o.stratum2_id AS STRING) AS stratum2_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
(
 select s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
 from etl_synthea_1k_ach_res.ujk3kpdestatsView_1816 s
 join etl_synthea_1k_ach_res.ujk3kpdestatsView_1816 p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
 group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn
) p
join etl_synthea_1k_ach_res.ujk3kpdeoverallStats_1816 o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id 
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_1816
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1816
USING DELTA
AS
SELECT
analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2, 
 cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_1816
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1816
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdeoverallStats_1816;
drop table etl_synthea_1k_ach_res.ujk3kpdeoverallStats_1816;
truncate table etl_synthea_1k_ach_res.ujk3kpdestatsView_1816;
drop table etl_synthea_1k_ach_res.ujk3kpdestatsView_1816;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_1816;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_1816;

--HINT DISTRIBUTE_ON_KEY(stratum1_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdeoverallStats_1817
USING DELTA
AS
SELECT
m.subject_id AS stratum1_id,
 m.unit_concept_id AS stratum2_id,
 CAST(AVG(1.0 * m.count_value) AS FLOAT) AS avg_value,
 CAST(STDDEV(m.count_value) AS FLOAT) AS stdev_value,
 MIN(m.count_value) AS min_value,
 MAX(m.count_value) AS max_value,
 COUNT(*) AS total
FROM
(
 SELECT 
 measurement_concept_id AS subject_id,
 unit_concept_id,
 CAST(range_high AS FLOAT) AS count_value
 FROM 
 etl_synthea_1k.measurement m
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 m.person_id = op.person_id
 AND 
 m.measurement_date >= op.observation_period_start_date
 AND 
 m.measurement_date <= op.observation_period_end_date 
 WHERE 
 m.unit_concept_id IS NOT NULL
 AND 
 m.value_as_number IS NOT NULL
 AND 
 m.range_low IS NOT NULL
 AND 
 m.range_high IS NOT NULL
 ) m
GROUP BY 
 m.subject_id, 
 m.unit_concept_id
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdeoverallStats_1817
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum1_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdestatsView_1817
USING DELTA
AS
SELECT
m.subject_id AS stratum1_id,
 m.unit_concept_id AS stratum2_id,
 m.count_value,
 COUNT(*) AS total,
 ROW_NUMBER() OVER (PARTITION BY m.subject_id,m.unit_concept_id ORDER BY m.count_value) AS rn
FROM
(
 SELECT 
 m.measurement_concept_id AS subject_id,
 m.unit_concept_id,
 CAST(m.range_high AS FLOAT) AS count_value
 FROM 
 etl_synthea_1k.measurement m
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 m.person_id = op.person_id
 AND 
 m.measurement_date >= op.observation_period_start_date
 AND 
 m.measurement_date <= op.observation_period_end_date 
 WHERE 
 m.unit_concept_id IS NOT NULL
 AND 
 m.value_as_number IS NOT NULL
 AND 
 m.range_low IS NOT NULL
 AND 
 m.range_high IS NOT NULL
 ) m
GROUP BY 
 m.subject_id, 
 m.unit_concept_id, 
 m.count_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdestatsView_1817
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum1_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_1817
USING DELTA
AS
SELECT
1817 as analysis_id,
 CAST(o.stratum1_id AS STRING) AS stratum1_id,
 CAST(o.stratum2_id AS STRING) AS stratum2_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
(
 select s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
 from etl_synthea_1k_ach_res.ujk3kpdestatsView_1817 s
 join etl_synthea_1k_ach_res.ujk3kpdestatsView_1817 p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
 group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn
) p
join etl_synthea_1k_ach_res.ujk3kpdeoverallStats_1817 o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_1817
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1817
USING DELTA
AS
SELECT
analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2, 
 cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_1817
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1817
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpdeoverallStats_1817;
drop table etl_synthea_1k_ach_res.ujk3kpdeoverallStats_1817;
truncate table etl_synthea_1k_ach_res.ujk3kpdestatsView_1817;
drop table etl_synthea_1k_ach_res.ujk3kpdestatsView_1817;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_1817;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_1817;

--HINT DISTRIBUTE_ON_KEY(person_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpderawData_1818
USING DELTA
AS
SELECT
m.person_id,
 m.measurement_concept_id,
 m.unit_concept_id,
 CAST(CASE 
 WHEN m.value_as_number < m.range_low
 THEN 'Below Range Low'
 WHEN m.value_as_number >= m.range_low AND m.value_as_number <= m.range_high
 THEN 'Within Range'
 WHEN m.value_as_number > m.range_high
 THEN 'Above Range High'
 ELSE 'Other'
 END AS STRING) AS stratum_3
FROM
etl_synthea_1k.measurement m
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 m.person_id = op.person_id
AND 
 m.measurement_date >= op.observation_period_start_date
AND 
 m.measurement_date <= op.observation_period_end_date 
WHERE 
 m.value_as_number IS NOT NULL
AND 
 m.unit_concept_id IS NOT NULL
AND 
 m.range_low IS NOT NULL
AND 
 m.range_high IS NOT NULL;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpderawData_1818
 ZORDER BY person_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1818
USING DELTA
AS
SELECT
1818 AS analysis_id,
 CAST(measurement_concept_id AS STRING) AS stratum_1,
 CAST(unit_concept_id AS STRING) AS stratum_2,
 CAST(stratum_3 AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(person_id) AS count_value
FROM
etl_synthea_1k_ach_res.ujk3kpderawData_1818
GROUP BY 
 measurement_concept_id,
 unit_concept_id,
 stratum_3;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1818
 ZORDER BY stratum_1;
TRUNCATE TABLE etl_synthea_1k_ach_res.ujk3kpderawData_1818;
DROP TABLE etl_synthea_1k_ach_res.ujk3kpderawData_1818;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1819
USING DELTA
AS
SELECT
1819 AS analysis_id,
 CAST(m.measurement_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(m.person_id) AS count_value
FROM
etl_synthea_1k.measurement m
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 m.person_id = op.person_id
AND 
 m.measurement_date >= op.observation_period_start_date
AND 
 m.measurement_date <= op.observation_period_end_date 
WHERE 
 m.value_as_number IS NOT NULL
OR 
 m.value_as_concept_id != 0
GROUP BY 
 m.measurement_concept_id;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1820
USING DELTA
AS
WITH rawData  AS (
SELECT 
 YEAR(m.measurement_date) * 100 + MONTH(m.measurement_date) AS stratum_1,
 COUNT(m.person_id) AS count_value
FROM 
 etl_synthea_1k.measurement m
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 m.person_id = op.person_id
AND 
 m.measurement_date >= op.observation_period_start_date
AND 
 m.measurement_date <= op.observation_period_end_date 
GROUP BY 
 YEAR(m.measurement_date) * 100 + MONTH(m.measurement_date)
)
 SELECT
1820 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1820
 ZORDER BY stratum_1;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1821
USING DELTA
AS
SELECT
1821 as analysis_id, 
 cast(null as STRING) as stratum_1, cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(m.PERSON_ID) as count_value
FROM
etl_synthea_1k.measurement m
where m.value_as_number is null;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1822
USING DELTA
AS
SELECT
1822 AS analysis_id,
 CAST(m.measurement_concept_id AS STRING) AS stratum_1,
 CAST(m.value_as_concept_id AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.measurement m
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 m.person_id = op.person_id
AND 
 m.measurement_date >= op.observation_period_start_date
AND 
 m.measurement_date <= op.observation_period_end_date 
GROUP BY 
 m.measurement_concept_id,
 m.value_as_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1822
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1823
USING DELTA
AS
SELECT
1823 AS analysis_id,
 CAST(m.measurement_concept_id AS STRING) AS stratum_1,
 CAST(m.operator_concept_id AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.measurement m
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 m.person_id = op.person_id
AND 
 m.measurement_date >= op.observation_period_start_date
AND 
 m.measurement_date <= op.observation_period_end_date 
GROUP BY 
 m.measurement_concept_id,
 m.operator_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1823
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1825
USING DELTA
AS
SELECT
1825 AS analysis_id,
 CAST(m.measurement_source_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.measurement m
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 m.person_id = op.person_id
AND 
 m.measurement_date >= op.observation_period_start_date
AND 
 m.measurement_date <= op.observation_period_end_date 
GROUP BY 
 m.measurement_source_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1825
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1826
USING DELTA
AS
SELECT
1826 AS analysis_id,
 CAST(m.value_as_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.measurement m
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 m.person_id = op.person_id
AND 
 m.measurement_date >= op.observation_period_start_date
AND 
 m.measurement_date <= op.observation_period_end_date 
GROUP BY 
 m.value_as_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1826
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1827
USING DELTA
AS
SELECT
1827 AS analysis_id,
 CAST(m.unit_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.measurement m
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 m.person_id = op.person_id
AND 
 m.measurement_date >= op.observation_period_start_date
AND 
 m.measurement_date <= op.observation_period_end_date 
GROUP BY 
 m.unit_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1827
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1891
USING DELTA
AS
SELECT
1891 AS analysis_id,
 CAST(m.measurement_concept_id AS STRING) AS stratum_1,
 CAST(m.meas_cnt AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 SUM(COUNT(m.person_id)) OVER (PARTITION BY m.measurement_concept_id ORDER BY m.meas_cnt DESC) AS count_value
FROM
(
 SELECT 
 m.measurement_concept_id,
 COUNT(m.measurement_id) AS meas_cnt,
 m.person_id
 FROM 
 etl_synthea_1k.measurement m
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 m.person_id = op.person_id
 AND 
 m.measurement_date >= op.observation_period_start_date
 AND 
 m.measurement_date <= op.observation_period_end_date 
 GROUP BY 
 m.person_id,
 m.measurement_concept_id
 ) m
GROUP BY 
 m.measurement_concept_id,
 m.meas_cnt;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1891
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1900
USING DELTA
AS
SELECT
1900 as analysis_id, 
 cast(table_name as STRING) as stratum_1, 
 cast(column_name as STRING) as stratum_2, 
 source_value as stratum_3, 
 cast(null as STRING) as stratum_4, 
 cast(null as STRING) as stratum_5,
cnt as count_value
FROM
(
 select 'measurement' as table_name, 'measurement_source_value' as column_name, measurement_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.measurement where measurement_concept_id = 0 group by measurement_source_value 
 union
 select 'measurement' as table_name, 'unit_source_value' as column_name, unit_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.measurement where unit_concept_id = 0 group by unit_source_value 
 union
 select 'procedure_occurrence' as table_name,'procedure_source_value' as column_name, procedure_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.procedure_occurrence where procedure_concept_id = 0 group by procedure_source_value 
 union
 select 'procedure_occurrence' as table_name,'modifier_source_value' as column_name, modifier_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.procedure_occurrence where modifier_concept_id = 0 group by modifier_source_value 
 union
 select 'drug_exposure' as table_name, 'drug_source_value' as column_name, drug_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.drug_exposure where drug_concept_id = 0 group by drug_source_value 
 union
 select 'drug_exposure' as table_name, 'route_source_value' as column_name, route_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.drug_exposure where route_concept_id = 0 group by route_source_value 
 union
 select 'condition_occurrence' as table_name, 'condition_source_value' as column_name, condition_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.condition_occurrence where condition_concept_id = 0 group by condition_source_value 
 union
 select 'condition_occurrence' as table_name, 'condition_status_source_value' as column_name, condition_status_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.condition_occurrence where condition_status_concept_id = 0 group by condition_status_source_value 
 union
 select 'observation' as table_name, 'observation_source_value' as column_name, observation_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.observation where observation_concept_id = 0 group by observation_source_value 
 union
 select 'observation' as table_name, 'unit_source_value' as column_name, unit_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.observation where unit_concept_id = 0 group by unit_source_value 
 union
 select 'observation' as table_name, 'qualifier_source_value' as column_name, qualifier_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.observation where qualifier_concept_id = 0 group by qualifier_source_value
 union
 select 'payer_plan_period' as table_name, 'payer_source_value' as column_name, payer_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.payer_plan_period where payer_concept_id = 0 group by payer_source_value 
 union
 select 'payer_plan_period' as table_name, 'plan_source_value' as column_name, plan_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.payer_plan_period where plan_concept_id = 0 group by plan_source_value 
 union
 select 'payer_plan_period' as table_name, 'sponsor_source_value' as column_name, sponsor_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.payer_plan_period where sponsor_concept_id = 0 group by sponsor_source_value 
 union
 select 'payer_plan_period' as table_name, 'stop_reason_source_value' as column_name, stop_reason_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.payer_plan_period where stop_reason_concept_id = 0 group by stop_reason_source_value 
 union
 select 'provider' as table_name, 'specialty_source_value' as column_name, specialty_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.provider where specialty_concept_id = 0 group by specialty_source_value
 union 
 select 'provider' as table_name, 'gender_source_value' as column_name, gender_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.provider where gender_concept_id = 0 group by gender_source_value
 union 
 select 'person' as table_name, 'gender_source_value' as column_name, gender_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.person where gender_concept_id = 0 group by gender_source_value 
 union
 select 'person' as table_name, 'race_source_value' as column_name, race_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.person where race_concept_id = 0 group by race_source_value 
 union
 select 'person' as table_name, 'ethnicity_source_value' as column_name, ethnicity_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.person where ethnicity_concept_id = 0 group by ethnicity_source_value 
 union
 select 'specimen' as table_name, 'specimen_source_value' as column_name, specimen_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.specimen where specimen_concept_id = 0 group by specimen_source_value 
 union
 select 'specimen' as table_name, 'unit_source_value' as column_name, unit_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.specimen where unit_concept_id = 0 group by unit_source_value 
 union
 select 'specimen' as table_name, 'anatomic_site_source_value' as column_name, anatomic_site_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.specimen where anatomic_site_concept_id = 0 group by anatomic_site_source_value 
 union
 select 'specimen' as table_name, 'disease_status_source_value' as column_name, disease_status_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.specimen where disease_status_concept_id = 0 group by disease_status_source_value 
 union
 select 'visit_detail' as table_name, 'visit_detail_source_value' as column_name, visit_detail_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.visit_detail where visit_detail_concept_id = 0 group by visit_detail_source_value
 union
 select 'visit_detail' as table_name, 'admitting_source_value' as column_name, admitting_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.visit_detail where admitting_source_concept_id = 0 group by admitting_source_value
 union
 select 'visit_detail' as table_name, 'discharge_to_source_value' as column_name, discharge_to_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.visit_detail where discharge_to_concept_id = 0 group by discharge_to_source_value
 union
 select 'visit_occurrence' as table_name, 'visit_source_value' as column_name, visit_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.visit_occurrence where visit_concept_id = 0 group by visit_source_value
 union
 select 'visit_occurrence' as table_name, 'admitting_source_value' as column_name, admitting_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.visit_occurrence where admitting_source_concept_id = 0 group by admitting_source_value
 union
 select 'visit_occurrence' as table_name, 'discharge_to_source_value' as column_name, discharge_to_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.visit_occurrence where discharge_to_concept_id = 0 group by discharge_to_source_value
 union
 select 'device_exposure' as table_name, 'device_source_value' as column_name, device_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.device_exposure where device_concept_id = 0 group by device_source_value
 union
 select 'death' as table_name, 'cause_source_value' as column_name, cause_source_value as source_value, COUNT(*) as cnt from etl_synthea_1k.death where cause_concept_id = 0 group by cause_source_value
) a
where cnt >= 1;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1900
  ZORDER BY stratum_1;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2000
USING DELTA
AS
SELECT
2000 AS analysis_id,
 CAST(NULL AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 CAST(d.cnt AS BIGINT) AS count_value
FROM
(
SELECT COUNT(*) cnt
FROM (
 SELECT DISTINCT person_id
 FROM (
 SELECT
 co.person_id
 FROM
 etl_synthea_1k.condition_occurrence co
 JOIN
 etl_synthea_1k.observation_period op
 ON
 co.person_id = op.person_id
 AND
 co.condition_start_date >= op.observation_period_start_date
 AND
 co.condition_start_date <= op.observation_period_end_date
 ) a
 INTERSECT
 SELECT DISTINCT person_id
 FROM (
 SELECT
 de.person_id
 FROM
 etl_synthea_1k.drug_exposure de
 JOIN
 etl_synthea_1k.observation_period op
 ON
 de.person_id = op.person_id
 AND
 de.drug_exposure_start_date >= op.observation_period_start_date
 AND
 de.drug_exposure_start_date <= op.observation_period_end_date
 ) b
 ) c
) d;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2001
USING DELTA
AS
SELECT
2001 AS analysis_id,
 CAST(NULL AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 CAST(d.cnt AS BIGINT) AS count_value
FROM
(
SELECT COUNT(*) cnt
FROM (
 SELECT DISTINCT person_id
 FROM (
 SELECT
 co.person_id
 FROM
 etl_synthea_1k.condition_occurrence co
 JOIN
 etl_synthea_1k.observation_period op
 ON
 co.person_id = op.person_id
 AND
 co.condition_start_date >= op.observation_period_start_date
 AND
 co.condition_start_date <= op.observation_period_end_date
 ) a
 INTERSECT
 SELECT DISTINCT person_id
 FROM (
 SELECT
 po.person_id
 FROM
 etl_synthea_1k.procedure_occurrence po
 JOIN
 etl_synthea_1k.observation_period op
 ON
 po.person_id = op.person_id
 AND
 po.procedure_date >= op.observation_period_start_date
 AND
 po.procedure_date <= op.observation_period_end_date
 ) b
 ) c
) d;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2002
USING DELTA
AS
SELECT
2002 AS analysis_id,
 CAST(NULL AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 CAST(e.cnt AS BIGINT) AS count_value
FROM
(
SELECT COUNT(*) cnt
FROM (
 SELECT DISTINCT person_id
 FROM (
 SELECT
 m.person_id
 FROM
 etl_synthea_1k.measurement m
 JOIN
 etl_synthea_1k.observation_period op
 ON
 m.person_id = op.person_id
 AND
 m.measurement_date >= op.observation_period_start_date
 AND
 m.measurement_date <= op.observation_period_end_date
 ) a
 INTERSECT
 SELECT DISTINCT person_id
 FROM (
 SELECT
 co.person_id
 FROM
 etl_synthea_1k.condition_occurrence co
 JOIN
 etl_synthea_1k.observation_period op
 ON
 co.person_id = op.person_id
 AND
 co.condition_start_date >= op.observation_period_start_date
 AND
 co.condition_start_date <= op.observation_period_end_date
 ) b
 INTERSECT
 SELECT DISTINCT person_id
 FROM (
 SELECT
 de.person_id
 FROM
 etl_synthea_1k.drug_exposure de
 JOIN
 etl_synthea_1k.observation_period op
 ON
 de.person_id = op.person_id
 AND
 de.drug_exposure_start_date >= op.observation_period_start_date
 AND
 de.drug_exposure_start_date <= op.observation_period_end_date
 ) c
 ) d
) e;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2003
USING DELTA
AS
SELECT
2003 AS analysis_id,
 CAST(NULL AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(DISTINCT vo.person_id) AS count_value
FROM
etl_synthea_1k.visit_occurrence vo
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 vo.person_id = op.person_id
AND 
 vo.visit_start_date >= op.observation_period_start_date
AND 
 vo.visit_start_date <= op.observation_period_end_date;

CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdeconoc 
USING DELTA
AS
SELECT
distinct person_id 
FROM
etl_synthea_1k.condition_occurrence;
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdedrexp 
USING DELTA
AS
SELECT
distinct person_id 
FROM
etl_synthea_1k.drug_exposure;
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdedvexp 
USING DELTA
AS
SELECT
distinct person_id 
FROM
etl_synthea_1k.device_exposure;
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdemsmt 
USING DELTA
AS
SELECT
distinct person_id 
FROM
etl_synthea_1k.measurement;
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdedeath 
USING DELTA
AS
SELECT
distinct person_id 
FROM
etl_synthea_1k.death;
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdeprococ 
USING DELTA
AS
SELECT
distinct person_id 
FROM
etl_synthea_1k.procedure_occurrence;
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdeobs 
USING DELTA
AS
SELECT
distinct person_id 
FROM
etl_synthea_1k.observation;
DROP VIEW IF EXISTS rawData ; CREATE TEMPORARY VIEW rawData  AS (select 2004 as analysis_id,
 CAST('0000001' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0000010' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0000011' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0000100' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0000101' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0000110' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0000111' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0001000' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0001001' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0001010' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0001011' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0001100' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0001101' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0001110' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0001111' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0010000' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0010001' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0010010' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0010011' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0010100' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0010101' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0010110' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0010111' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0011000' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0011001' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0011010' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0011011' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0011100' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0011101' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0011110' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0011111' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0100000' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0100001' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0100010' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0100011' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0100100' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0100101' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0100110' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0100111' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0101000' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0101001' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0101010' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0101011' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0101100' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0101101' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0101110' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0101111' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0110000' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0110001' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0110010' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0110011' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0110100' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0110101' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0110110' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0110111' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0111000' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0111001' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0111010' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0111011' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0111100' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0111101' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0111110' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('0111111' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1000000' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1000001' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1000010' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1000011' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1000100' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1000101' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1000110' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1000111' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1001000' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1001001' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1001010' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1001011' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1001100' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1001101' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1001110' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1001111' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1010000' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1010001' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1010010' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1010011' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1010100' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1010101' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1010110' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1010111' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1011000' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1011001' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1011010' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1011011' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1011100' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1011101' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1011110' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1011111' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1100000' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1100001' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1100010' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1100011' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1100100' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1100101' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1100110' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1100111' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1101000' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1101001' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1101010' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1101011' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1101100' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1101101' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1101110' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1101111' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1110000' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1110001' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1110010' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1110011' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1110100' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1110101' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1110110' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1110111' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1111000' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1111001' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1111010' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1111011' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1111100' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1111101' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1111110' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) totalPersonsDb UNION ALL
select 2004 as analysis_id,
 CAST('1111111' AS STRING) as stratum_1,
 cast((1.0 * personIntersection.count_value / totalPersonsDb.totalPersons) as STRING) as stratum_2,
 CAST(NULL AS STRING) as stratum_3,
 CAST(NULL AS STRING) as stratum_4,
 CAST(NULL AS STRING) as stratum_5,
 personIntersection.count_value
 from
 (select count(*) as count_value from(select person_id from etl_synthea_1k_ach_res.ujk3kpdeconoc intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedrexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedvexp intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdemsmt intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdedeath intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeprococ intersect select person_id from etl_synthea_1k_ach_res.ujk3kpdeobs) subquery) personIntersection,
 (select count(distinct(person_id)) as totalPersons from etl_synthea_1k.person) as totalPersonsDb);
 CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2004 
USING DELTA
AS
(SELECT
* 
FROM
rawData);
drop table etl_synthea_1k_ach_res.ujk3kpdeconoc;
drop table etl_synthea_1k_ach_res.ujk3kpdedrexp;
drop table etl_synthea_1k_ach_res.ujk3kpdedvexp;
drop table etl_synthea_1k_ach_res.ujk3kpdemsmt;
drop table etl_synthea_1k_ach_res.ujk3kpdedeath;
drop table etl_synthea_1k_ach_res.ujk3kpdeprococ;
drop table etl_synthea_1k_ach_res.ujk3kpdeobs;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2100
USING DELTA
AS
SELECT
2100 AS analysis_id,
 CAST(de.device_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(DISTINCT de.person_id) AS count_value
FROM
etl_synthea_1k.device_exposure de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.device_exposure_start_date >= op.observation_period_start_date
AND 
 de.device_exposure_start_date <= op.observation_period_end_date 
GROUP BY 
 de.device_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2100
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2101
USING DELTA
AS
SELECT
2101 AS analysis_id,
 CAST(de.device_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(de.person_id) AS count_value
FROM
etl_synthea_1k.device_exposure de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.device_exposure_start_date >= op.observation_period_start_date
AND 
 de.device_exposure_start_date <= op.observation_period_end_date 
GROUP BY 
 de.device_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2101
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2102
USING DELTA
AS
WITH rawData  AS (
SELECT 
 de.device_concept_id AS stratum_1,
 YEAR(de.device_exposure_start_date) * 100 + MONTH(de.device_exposure_start_date) AS stratum_2,
 COUNT(DISTINCT de.person_id) AS count_value
FROM 
 etl_synthea_1k.device_exposure de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.device_exposure_start_date >= op.observation_period_start_date
AND 
 de.device_exposure_start_date <= op.observation_period_end_date 
GROUP BY 
 de.device_concept_id,
 YEAR(de.device_exposure_start_date) * 100 + MONTH(de.device_exposure_start_date)
)
 SELECT
2102 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2102
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2104
USING DELTA
AS
WITH rawData  AS (
SELECT 
 de.device_concept_id AS stratum_1,
 YEAR(de.device_exposure_start_date) AS stratum_2,
 p.gender_concept_id AS stratum_3,
 FLOOR((YEAR(de.device_exposure_start_date) - p.year_of_birth) / 10) AS stratum_4,
 COUNT(DISTINCT p.person_id) AS count_value
FROM 
 etl_synthea_1k.person p
JOIN 
 etl_synthea_1k.device_exposure de 
ON 
 p.person_id = de.person_id
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.device_exposure_start_date >= op.observation_period_start_date
AND 
 de.device_exposure_start_date <= op.observation_period_end_date 
GROUP BY 
 de.device_concept_id,
 YEAR(de.device_exposure_start_date),
 p.gender_concept_id,
 FLOOR((YEAR(de.device_exposure_start_date) - p.year_of_birth) / 10)
)
 SELECT
2104 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(stratum_2 AS STRING) AS stratum_2,
 CAST(stratum_3 AS STRING) AS stratum_3,
 CAST(stratum_4 AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2104
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2105
USING DELTA
AS
SELECT
2105 AS analysis_id,
 CAST(de.device_concept_id AS STRING) AS stratum_1,
 CAST(de.device_type_concept_id AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(de.person_id) AS count_value
FROM
etl_synthea_1k.device_exposure de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.device_exposure_start_date >= op.observation_period_start_date
AND 
 de.device_exposure_start_date <= op.observation_period_end_date 
GROUP BY 
 de.device_concept_id,
 de.device_type_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2105
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(subject_id) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpderawData_2106
USING DELTA
AS
SELECT
o.device_concept_id AS subject_id,
 p.gender_concept_id,
 o.device_exposure_start_year - p.year_of_birth AS count_value
FROM
etl_synthea_1k.person p
JOIN (
 SELECT 
 d.person_id,
 d.device_concept_id,
 MIN(YEAR(d.device_exposure_start_date)) AS device_exposure_start_year
 FROM 
 etl_synthea_1k.device_exposure d
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 d.person_id = op.person_id
 AND 
 d.device_exposure_start_date >= op.observation_period_start_date
 AND 
 d.device_exposure_start_date <= op.observation_period_end_date 
 GROUP BY 
 d.person_id,
 d.device_concept_id
 ) o
ON 
 p.person_id = o.person_id
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpderawData_2106
 ZORDER BY subject_id;
--HINT DISTRIBUTE_ON_KEY(stratum1_id)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdetempResults_2106
USING DELTA
AS
WITH overallStats (stratum1_id, stratum2_id, avg_value, stdev_value, min_value, max_value, total)  AS (
 select subject_id as stratum1_id,
 gender_concept_id as stratum2_id,
 CAST(avg(1.0 * count_value) AS FLOAT) as avg_value,
 CAST(STDDEV(count_value) AS FLOAT) as stdev_value,
 min(count_value) as min_value,
 max(count_value) as max_value,
 COUNT(*) as total
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_2106
 group by subject_id, gender_concept_id
),
statsView (stratum1_id, stratum2_id, count_value, total, rn) as
(
 select subject_id as stratum1_id, gender_concept_id as stratum2_id, count_value, COUNT(*) as total, row_number() over (partition by subject_id, gender_concept_id order by count_value) as rn
 FROM etl_synthea_1k_ach_res.ujk3kpderawData_2106
 group by subject_id, gender_concept_id, count_value
),
priorStats (stratum1_id, stratum2_id, count_value, total, accumulated) as
(
 select s.stratum1_id, s.stratum2_id, s.count_value, s.total, sum(p.total) as accumulated
 from statsView s
 join statsView p on s.stratum1_id = p.stratum1_id and s.stratum2_id = p.stratum2_id and p.rn <= s.rn
 group by s.stratum1_id, s.stratum2_id, s.count_value, s.total, s.rn
)
 SELECT
2106 as analysis_id,
 CAST(o.stratum1_id AS STRING) AS stratum1_id,
 CAST(o.stratum2_id AS STRING) AS stratum2_id,
 o.total as count_value,
 o.min_value,
 o.max_value,
 o.avg_value,
 o.stdev_value,
 MIN(case when p.accumulated >= .50 * o.total then count_value else o.max_value end) as median_value,
 MIN(case when p.accumulated >= .10 * o.total then count_value else o.max_value end) as p10_value,
 MIN(case when p.accumulated >= .25 * o.total then count_value else o.max_value end) as p25_value,
 MIN(case when p.accumulated >= .75 * o.total then count_value else o.max_value end) as p75_value,
 MIN(case when p.accumulated >= .90 * o.total then count_value else o.max_value end) as p90_value
FROM
priorStats p
join overallStats o on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id 
GROUP BY o.stratum1_id, o.stratum2_id, o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdetempResults_2106
 ZORDER BY stratum1_id;
--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_2106
USING DELTA
AS
SELECT
analysis_id, stratum1_id as stratum_1, stratum2_id as stratum_2, 
cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
etl_synthea_1k_ach_res.ujk3kpdetempResults_2106
;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_2106
 ZORDER BY stratum_1;
truncate table etl_synthea_1k_ach_res.ujk3kpderawData_2106;
drop table etl_synthea_1k_ach_res.ujk3kpderawData_2106;
truncate table etl_synthea_1k_ach_res.ujk3kpdetempResults_2106;
drop table etl_synthea_1k_ach_res.ujk3kpdetempResults_2106;

--HINT DISTRIBUTE_ON_KEY(stratum_1)
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2120
USING DELTA
AS
WITH rawData  AS (
SELECT 
 YEAR(de.device_exposure_start_date) * 100 + MONTH(de.device_exposure_start_date) AS stratum_1,
 COUNT(de.person_id) AS count_value
FROM 
 etl_synthea_1k.device_exposure de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.device_exposure_start_date >= op.observation_period_start_date
AND 
 de.device_exposure_start_date <= op.observation_period_end_date 
GROUP BY 
 YEAR(de.device_exposure_start_date)*100 + MONTH(de.device_exposure_start_date)
)
 SELECT
2120 AS analysis_id,
 CAST(stratum_1 AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 count_value
FROM
rawData;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2120
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2125
USING DELTA
AS
SELECT
2125 AS analysis_id,
 CAST(de.device_source_concept_id AS STRING) AS stratum_1,
 CAST(NULL AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 COUNT(*) AS count_value
FROM
etl_synthea_1k.device_exposure de
JOIN 
 etl_synthea_1k.observation_period op 
ON 
 de.person_id = op.person_id
AND 
 de.device_exposure_start_date >= op.observation_period_start_date
AND 
 de.device_exposure_start_date <= op.observation_period_end_date 
GROUP BY 
 de.device_source_concept_id;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2125
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2191
USING DELTA
AS
SELECT
2191 AS analysis_id,
 CAST(d.device_concept_id AS STRING) AS stratum_1,
 CAST(d.device_count AS STRING) AS stratum_2,
 CAST(NULL AS STRING) AS stratum_3,
 CAST(NULL AS STRING) AS stratum_4,
 CAST(NULL AS STRING) AS stratum_5,
 SUM(COUNT(d.person_id)) OVER (PARTITION BY d.device_concept_id ORDER BY d.device_count DESC) AS count_value
FROM
(
 SELECT 
 d.device_concept_id,
 COUNT(d.device_exposure_id) AS device_count,
 d.person_id
 FROM 
 etl_synthea_1k.device_exposure d
 JOIN 
 etl_synthea_1k.observation_period op 
 ON 
 d.person_id = op.person_id
 AND 
 d.device_exposure_start_date >= op.observation_period_start_date
 AND 
 d.device_exposure_start_date <= op.observation_period_end_date 
 GROUP BY 
 d.person_id,
 d.device_concept_id
 ) d
GROUP BY 
 d.device_concept_id,
 d.device_count;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2191
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2200
USING DELTA
AS
SELECT
2200 as analysis_id, 
 CAST(m.note_type_CONCEPT_ID AS STRING) as stratum_1,
 cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(distinct m.PERSON_ID) as count_value
FROM
etl_synthea_1k.note m
group by m.note_type_CONCEPT_ID;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2200
 ZORDER BY stratum_1;

--HINT DISTRIBUTE_ON_KEY(stratum_1) 
CREATE TABLE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2201
USING DELTA
AS
SELECT
2201 as analysis_id, 
 CAST(m.note_type_CONCEPT_ID AS STRING) as stratum_1,
 cast(null as STRING) as stratum_2, cast(null as STRING) as stratum_3, cast(null as STRING) as stratum_4, cast(null as STRING) as stratum_5,
 COUNT(m.PERSON_ID) as count_value
FROM
etl_synthea_1k.note m
group by m.note_type_CONCEPT_ID;
OPTIMIZE etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2201
 ZORDER BY stratum_1;

DROP TABLE IF EXISTS etl_synthea_1k_ach_res.achilles_results;
--HINT DISTRIBUTE_ON_KEY(analysis_id) 
CREATE TABLE etl_synthea_1k_ach_res.achilles_results
USING DELTA
AS
SELECT
analysis_id, stratum_1, stratum_2, stratum_3, stratum_4, stratum_5, count_value
FROM
(
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_0 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_3 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_4 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_5 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_10 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_11 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_12 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_101 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_102 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_108 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_109 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_110 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_111 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_112 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_113 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_116 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_117 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_119 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_200 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_201 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_202 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_204 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_207 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_209 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_210 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_212 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_220 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_221 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_225 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_226 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_300 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_301 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_303 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_325 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_400 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_401 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_402 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_404 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_405 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_414 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_415 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_416 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_420 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_425 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_500 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_501 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_502 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_504 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_505 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_525 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_600 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_601 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_602 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_604 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_605 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_620 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_625 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_630 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_691 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_700 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_701 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_702 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_704 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_705 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_720 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_725 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_791 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_800 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_801 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_802 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_804 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_805 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_807 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_814 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_820 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_822 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_823 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_825 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_826 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_827 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_891 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_900 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_901 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_902 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_904 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_920 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1000 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1001 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1002 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1004 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1020 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1100 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1101 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1102 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1103 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1200 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1201 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1202 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1203 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1300 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1301 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1302 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1304 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1312 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1320 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1321 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1325 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1326 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1408 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1409 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1410 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1411 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1412 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1413 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1425 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1800 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1801 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1802 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1804 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1805 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1807 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1811 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1814 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1818 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1819 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1820 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1821 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1822 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1823 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1825 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1826 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1827 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1891 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_1900 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2000 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2001 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2002 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2003 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2004 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2100 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2101 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2102 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2104 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2105 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2120 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2125 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2191 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2200 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_2201
) Q
 where count_value > 5;
OPTIMIZE etl_synthea_1k_ach_res.achilles_results
 ZORDER BY analysis_id;

DROP TABLE IF EXISTS etl_synthea_1k_ach_res.achilles_results_dist;
--HINT DISTRIBUTE_ON_KEY(analysis_id) 
CREATE TABLE etl_synthea_1k_ach_res.achilles_results_dist
USING DELTA
AS
SELECT
analysis_id, stratum_1, stratum_2, stratum_3, stratum_4, stratum_5, count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value
FROM
(
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_0 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_103 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_104 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_105 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_106 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_107 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_203 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_206 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_213 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_403 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_406 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_506 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_511 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_512 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_513 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_514 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_515 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_603 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_606 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_703 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_706 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_715 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_716 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_717 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_803 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_806 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_815 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_903 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_906 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_907 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1003 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1006 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1007 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1303 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1306 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1313 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1406 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1407 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1803 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1806 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1815 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1816 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_1817 
union all
 select cast(analysis_id as int) as analysis_id, cast(stratum_1 as STRING) as stratum_1, cast(stratum_2 as STRING) as stratum_2, cast(stratum_3 as STRING) as stratum_3, cast(stratum_4 as STRING) as stratum_4, cast(stratum_5 as STRING) as stratum_5, cast(count_value as bigint) as count_value, cast(min_value as float) as min_value, cast(max_value as float) as max_value, cast(avg_value as float) as avg_value, cast(stdev_value as float) as stdev_value, cast(median_value as float) as median_value, cast(p10_value as float) as p10_value, cast(p25_value as float) as p25_value, cast(p75_value as float) as p75_value, cast(p90_value as float) as p90_value from
 etl_synthea_1k_ach_res.ujk3kpdes_tmpach_dist_2106
) Q
 where count_value > 5;
OPTIMIZE etl_synthea_1k_ach_res.achilles_results_dist
 ZORDER BY analysis_id;

/* INDEX CREATION SKIPPED, INDICES NOT SUPPORTED IN SPARK */