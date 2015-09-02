
-- =====	Student: Puneet Auluck	=====
-- =====	Class: 607				=====
-- =====	Assignment Week: 1 		=====

/* ----- Question #1  -----*/
-- How many airplanes have listed speeds? 
SELECT count(*) FROM planes WHERE speed IS NOT NULL;

-- What is the minimum listed speed and the maximum listed speed?
SELECT MIN(speed) as min_speed, MAX(speed) as max_speed FROM planes WHERE speed IS NOT NULL;

/* ----- Question #2  -----*/
-- What is the total distance flown by all of the planes in January 2013? 
SELECT SUM(distance) as total_distance FROM flights WHERE month=1 and year=2013;

-- What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
SELECT SUM(distance) as total_distance FROM flights WHERE month=1 AND year=2013 AND tailnum IS NULL;

/* ----- Question #3  -----*/
-- What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? 
-- INNER JOIN
SELECT p.manufacturer, sum(f.distance) as total_distance 
 FROM flights f INNER JOIN planes p 
 ON f.tailnum = p.tailnum
 WHERE f.month=7 AND f.day=5 AND f.year = 2013 
 GROUP BY p.manufacturer;

-- LEFT JOIN Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN. 
SELECT p.manufacturer, sum(f.distance) as total_distance 
 FROM flights f LEFT JOIN planes p 
 ON f.tailnum = p.tailnum
 WHERE f.month=7 AND f.day=5 AND f.year = 2013 
 GROUP BY p.manufacturer;

-- How do your results compare?
-- ANSWER: With INNER JOIN, only the results where the tailnum exists in both tables will be displayed.  
-- With LEFT JOIN, the results will display all tailnum in flights table whether they exist in planes table or not.

/* ----- Question #4  -----*/
-- Write and answer at least one question of your own choosing that joins information from at least three of the tables in the flights database.

-- What airline departed first from Newark on Jan 1, 2013 and what was the weather that day?

SELECT a.name, min(f.dep_time), w.temp
 FROM flights f 
 INNER JOIN airlines a ON f.carrier = a.carrier
 INNER JOIN weather w ON f.origin = w.origin AND f.year=w.year AND f.month=w.month AND f.day=w.day
 WHERE f.origin = 'EWR' AND f.year=2013 AND f.month=1 AND f.day=1;
 
 -- ----------------------------------------------------------------------------------