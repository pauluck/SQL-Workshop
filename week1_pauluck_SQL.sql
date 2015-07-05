/*
## Puneet Auluck - SQL Assigment Week 1 - 7/5/15
*/

--#1. Show total number of flights.
select count(*) from flights;

--#2. Show the total number of flights by airline (carrier)
select Carrier as "Airline", count(flight) as "Total Flights" from flights group by carrier;

--#3. Show all of the airlines, ordered by number of flights in descending order
select Carrier as "Airline", count(flight) as "Total Flights" from flights group by carrier order by "Total Flights" desc;

--#4. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
select Carrier as "Airline", count(flight) as "Total Flights" from flights group by carrier order by "Total Flights" desc LIMIT 5;

--#5.  Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in decending order.
select Carrier as "Airline", count(flight) as "Total Flights" from flights WHERE distance >= 1000 group by carrier order by "Total Flights" desc LIMIT 5;

--#6.  Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and write down both the question,
-- and the query that anseres the question
-- Question: Show which airline traveled the longest(in miles) from one destination to another.
select carrier as "Airline", max(distance) as "Miles Traveled", origin as "From", dest as "To" from flights group by carrier, origin, dest order by max(distance) desc LIMIT 1;

