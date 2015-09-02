/* Puneet Auluck - Final SQL Assignment*/

/*Work Travel Time  
My commute consists of roughly 2 hours to work and 2 hours back.  I can take three different routes going to work.  Each week consists of one route covering over three weeks.
I would like to analyze the data to see which route is best for me. (in my opinion it's none - I rather work from home!)
Method1: Bus-Train with wait and traffic time
Method2: Train-Ferry with wait but no traffic time
Method3: Car with no wait but traffic time

Times are in minutes
 */

DROP TABLE IF EXISTS Travel;
DROP TABLE IF EXISTS Routes;

CREATE TABLE Routes (
	RouteId 	CHAR(2) PRIMARY KEY NOT NULL,
	Method		VARCHAR(20),
	TravelTime	INTEGER NOT NULL,
	TravelCost	NUMERIC NOT NULL
);

CREATE TABLE Travel (
	TravelDate 	DATE NOT NULL,
	TravelType	VARCHAR(20),
	RouteId		CHAR(2) NOT NULL,
	WaitTime 	INTEGER,
	TrafficTime 	INTEGER
);


INSERT INTO Routes (RouteId, Method, TravelTime, TravelCost) VALUES ('R1', 'Bus-Trains', 95, 6.75);
INSERT INTO Routes (RouteId, Method, TravelTime, TravelCost) VALUES ('R2', 'Train-Ferry-Train', 125, 2.75);
INSERT INTO Routes (RouteId, Method, TravelTime, TravelCost) VALUES ('R3', 'Car', 80, 10.00);

INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('6/29/2015','Leaving', 'R1', 10, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('6/29/2015','Arriving', 'R1', 15, 15);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('6/30/2015','Leaving', 'R1', 10, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('6/30/2015','Arriving', 'R1', 20, 15);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/1/2015','Leaving', 'R1', 5, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/1/2015','Arriving', 'R1', 0, 10);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/2/2015','Leaving', 'R1', 8, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/2/2015','Arriving', 'R1', 15, 10);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/3/2015','Leaving', 'R1', 5, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/3/2015','Arriving', 'R1', 5, 15);

INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/6/2015','Leaving', 'R2', 10, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/6/2015','Arriving', 'R2', 15, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/7/2015','Leaving', 'R2', 5, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/7/2015','Arriving', 'R2', 20, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/8/2015','Leaving', 'R2', 7, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/8/2015','Arriving', 'R2', 5, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/9/2015','Leaving', 'R2', 5, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/9/2015','Arriving', 'R2', 25, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/10/2015','Leaving', 'R2', 7, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/10/2015','Arriving', 'R2', 5, 0);

INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/13/2015','Leaving', 'R3', 0, 8);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/13/2015','Arriving', 'R3', 0, 15);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/14/2015','Leaving', 'R3', 0, 10);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/14/2015','Arriving', 'R3', 0, 30);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/15/2015','Leaving', 'R3', 0, 11);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/15/2015','Arriving', 'R3', 0, 20);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/16/2015','Leaving', 'R3', 0, 12);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/16/2015','Arriving', 'R3', 0, 20);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/17/2015','Leaving', 'R3', 0, 5);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/17/2015','Arriving', 'R3', 0, 15);


-- Select everything from both tables
SELECT travel.*, routes.* FROM travel LEFT JOIN routes ON travel.routeid=routes.routeid;

-- Find the grand total wait time
SELECT sum(waittime) from travel;

-- What is the total cost traveling by car?
SELECT sum(r.TravelCost) from travel t LEFT JOIN routes r ON t.routeid=r.routeid WHERE t.routeId='R3';

-- What is the travel cost for each route?
SELECT t.routeID, sum(r.TravelCost) from travel t LEFT JOIN routes r ON t.routeid=r.routeid GROUP BY t.routeId;

-- Select columns to export for further analysis in R
SELECT t.*, r.Method, r.TravelTime, r.TravelCost FROM travel t LEFT JOIN routes r ON t.routeid=r.routeid;