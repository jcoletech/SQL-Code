CREATE DATABASE cc_database;

USE cc_database;

-- Total numbers of calls that came in for october
SELECT count(*)
FROM cc;

-- What is the average csat_score for callers?
SELECT avg(csat_score)
FROM cc
WHERE csat_score >= 1;

-- What is the average call duration in minutes for callers?
SELECT avg('call duration in minutes')
FROM cc
WHERE 'call duration in minutes' > 5;

-- What is the call channel breakdown 
SELECT channel, count(*) AS count
FROM cc
GROUP BY channel
ORDER BY count DESC; 

-- What is the reason for calling breakdown 
SELECT reason, count(*) AS count
FROM cc
GROUP BY reason
ORDER BY count DESC; 

-- Breakdown of number of calls that came in for each days in october 
SELECT call_timestamp, count(*) AS count
FROM cc
GROUP BY call_timestamp
ORDER BY call_timestamp ASC;

-- What is the distribution of callers across city and state?
SELECT state, count(*) AS count
FROM cc
GROUP BY state
ORDER BY state ASC;

-- What is the distribution of callers across city and state?
SELECT response_time, count(*) AS count
FROM cc
GROUP BY response_time
ORDER BY count ASC;

-- What is the reason for calling breakdown 
SELECT call_center, count(*) AS count
FROM cc
GROUP BY call_center
ORDER BY call_center ASC; 