DROP TABLE IF EXISTS Travel;
DROP TABLE IF EXISTS Routes;

CREATE TABLE Routes (
	RouteId 	INTEGER PRIMARY KEY NOT NULL,
	Method		VARCHAR(20),
	TravelTime	INTEGER NOT NULL,
	TravelCost	NUMERIC NOT NULL
);

CREATE TABLE Travel (
	TravelDate 	DATE NOT NULL,
	TravelType	VARCHAR(20),
	RouteId		INTEGER NOT NULL,
	WaitTime 	INTEGER,
	TrafficTime 	INTEGER
);


INSERT INTO Routes (RouteId, Method, TravelTime, TravelCost) VALUES (111, 'Bus-Trains', 95, 6.75);
INSERT INTO Routes (RouteId, Method, TravelTime, TravelCost) VALUES (112, 'Train-Ferry-Train', 125, 2.75);
INSERT INTO Routes (RouteId, Method, TravelTime, TravelCost) VALUES (113, 'Car', 80, 20.00);

INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/6/2015','Leaving', 111, 10, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/6/2015','Arriving', 111, 15, 15);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/7/2015','Leaving', 113, 0, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/7/2015','Arriving', 113, 0, 30);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/8/2015','Leaving', 111, 0, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/8/2015','Arriving', 111, 20, 20);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/9/2015','Leaving', 113, 0, 10);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/9/2015','Arriving', 113, 0, 20);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/9/2015','Leaving', 112, 5, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/9/2015','Arriving', 111, 5, 15);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/10/2015','Leaving', 111, 5, 0);
INSERT INTO Travel (TravelDate, TravelType, RouteId, WaitTime, TrafficTime) VALUES ('7/10/2015','Arriving', 112, 20, 0);

select * from travel left join routes on travel.routeid=routes.routeid;