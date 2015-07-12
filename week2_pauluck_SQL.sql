/*
## Puneet Auluck - SQL Assigment Week 2 - 7/12/15
*/

/* 1. What weather conditions are associated with New York City departure delays? 

 I have generated a query to get the all the weather conditions in Greater New York City when planes leave for their destination.  
The dates and time hour from flights are also inner joined with weather table to get the exact match.  
The query refines to JFK, LGA and EWR airports because the assignment asks only for NYC.  Records with weather columns values as null
are removed because all weather factors are important to derive any conclusions.

Conclusion: In 2013, airplanes departing from NYC were delayed mostly during fall and winter months.  The biggest delay was caused in January,
and that (with my little knowledge of weather terms) could have been caused by a blizzard.
*/

SELECT f.origin AS "Departing Airport", 
  concat(f.month,'/',f.day,'/',f.year) AS "Departure Date", 
  concat(f.hour,':',lpad(f.minute::text,2,'0')) AS "Departure Time", 
  f.dep_delay AS "Delay in Minutes", 
  f.dest AS "Destination",
  w.temp AS "Temperature",
  w.dewp AS "Dew Point",
  w.humid AS "Humidity", 
  w.wind_dir AS "Wind Direction", 
  w.wind_speed AS "Wind Speed", 
  w.wind_gust AS "Wind Gust", 
  w.precip AS "Percipitation", 
  w.pressure AS "Pressure", 
  w.visib AS "Visibility" 
FROM flights f INNER JOIN weather w
  ON f.origin = w.origin
  AND f.year = w.year
  AND f.month = w.month
  AND f.day = w.day
  AND f.hour = w.hour
WHERE 
  w.origin in ('JFK','EWR','LGA')
  AND f.dep_delay > 0 
  AND wind_dir is not null
  AND pressure is not null
ORDER BY f.dep_delay desc;

/* 2. Are older planes more likely to be delayed? 

 I have queried total planes for each manufactured year listed and number of times they have been delayed. Then their average number of delays in the fourth column.

 Conclusion: No association could be found on whether older planes are more likely to be delayed or not.  The top five planes with most delays were manufactured in 1983, 
2008 and 2007, 1976 and 2002.  As you can see the plane manufactured years vary and not close to each other.
*/
SELECT p.year "Manufactured Year", 
  (select count(*) from planes p2 where p.year=p2.year) AS "Total Planes",
  count(f.dep_delay) "Total Delays", 
  count(f.dep_delay)/(select count(*) from planes p2 where p.year=p2.year) as "AVG Delays" 
FROM planes p LEFT JOIN flights f 
  ON p.tailnum=f.tailnum
WHERE p.year IS NOT NULL 
  AND f.dep_delay >0 
GROUP BY p.year order by "AVG Delays" desc;


/* 3. Ask (and if possible answer) a third question that also requires joining information from two or more tables in
the flights database, and/or assumes that additional information can be collected in advance of answering
your question. 

Question: Do smaller planes (ie: with less seats) travel faster? 

Conclusion: I have grouped the query by plane seats a plane has and its aveage distance traveled per hour.  According to the data collected, it seems planes with less than 100 seats
fly faster than the rest.
*/
SELECT p.seats, 
  SUM(f.distance), 
  SUM(f.hour), 
  SUM(f.distance)/SUM(f.hour) as "AVG Dist/Hour" 
FROM planes p LEFT JOIN flights f 
  ON p.tailnum=f.tailnum 
GROUP BY p.seats 
ORDER BY "AVG Dist/Hour";