/* Puneet Auluck - SQL Assignment #3 */

/*Videos table.  
Create one table to keep track of the videos.  
This table should include a unique ID, the title of the video, the length in minutes, and the URL.  
Populate the table with at least three related videos from YouTube or other publicly available resources. */

CREATE TABLE IF NOT EXISTS videos (
  video_id	integer PRIMARY KEY NOT NULL,
  title		varchar(100) NOT NULL,
  url		varchar(150) NOT NULL,
  length  	numeric
);


/* Populate the VIDEOS table with at least three related videos from YouTube or other publicly available resources. */
INSERT INTO videos (video_id, title, url, length)
	SELECT 101,'HAND DRAWING ENTITY RELATIONSHIP DIAGRAMS', 'https://www.youtube.com/watch?v=wUhZ-F1aH3Y',117
	WHERE NOT EXISTS ( SELECT * FROM videos WHERE video_id=101);
;
INSERT INTO videos (video_id, title, url, length)
	SELECT 102,'COMBINING MULTIPLE TABLES', 'https://youtu.be/WrPnAByl7d0',258
	WHERE NOT EXISTS ( SELECT * FROM videos WHERE video_id=102);
;
INSERT INTO videos (video_id, title, url, length)
	SELECT 103,'COUNTING - ORDER & REPLACEMENT', 'https://www.youtube.com/watch?v=E-B6NRZIq1Q',620
	WHERE NOT EXISTS ( SELECT * FROM videos WHERE video_id=103);
;


/*Reviewers table.  
Create a second table that provides at least two user reviews for each of at least two of the videos.  
These should be imaginary reviews that include columns for the user’s name (“Mohan”, “Joy”, etc.), 
the rating (which could be NULL, or a number between 0 and 5), and a short text review (“Loved it!”).  
There should be a column that links back to the ID column in the table of videos.*/
CREATE TABLE IF NOT EXISTS reviewers (
reviewer_id	integer PRIMARY KEY NOT NULL,
video_id	integer NOT NULL REFERENCES videos(video_id),
username	varchar(40) NOT NULL,
rating		numeric CHECK (rating between 0 and 5),
review		varchar(100)
);

INSERT INTO reviewers (reviewer_id, video_id, username, rating, review)
	SELECT 501,101,'PAULUCK',NULL,'AWESOME!'
	WHERE NOT EXISTS (SELECT * FROM reviewers WHERE reviewer_id=501);

INSERT INTO reviewers (reviewer_id, video_id, username, rating, review)
	SELECT 502,102,'MRAKHRA',1,'Not Good.'
	WHERE NOT EXISTS (SELECT * FROM reviewers WHERE reviewer_id=502);

INSERT INTO reviewers (reviewer_id, video_id, username, rating, review)
	SELECT 503,101,'SAMJAI',4,'Loved it!'
	WHERE NOT EXISTS (SELECT * FROM reviewers WHERE reviewer_id=503);

INSERT INTO reviewers (reviewer_id, video_id, username, rating, review)
	SELECT 504,103,'PAULUCK',5,'Very informative.'
	WHERE NOT EXISTS (SELECT * FROM reviewers WHERE reviewer_id=504);

INSERT INTO reviewers (reviewer_id, video_id, username, rating, review)
	SELECT 505,102,'NINAJ',2,'Horrible!'
	WHERE NOT EXISTS (SELECT * FROM reviewers WHERE reviewer_id=505);
	
/* Populate the REVIEWS table */

/*Report on Video Reviews.  Write a JOIN statement that shows information from both tables.*/
SELECT * FROM Videos LEFT JOIN Reviewers 
	ON videos.video_id = reviewers.video_id
	ORDER BY videos.video_id;

