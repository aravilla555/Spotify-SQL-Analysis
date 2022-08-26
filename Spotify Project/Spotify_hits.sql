#Number of songs each year, 2012 had the most hits
SELECT year,
COUNT(song) as song_count
FROM accountability.songs_normalize1
GROUP BY year
ORDER BY year;

#Averages of each column
SELECT AVG(duration_ms), 
AVG(popularity), 
AVG(danceability),
AVG(energy),
AVG(tempo)
FROM accountability.songs_normalize1;

#Most popular song from each year 
SELECT year, MAX(popularity)
FROM accountability.songs_normalize1
GROUP BY year;

#Contextualize as the recipe to produce a top hit on spotify that people love

SELECT artist,
COUNT(song) as song_count
FROM accountability.songs_normalize1
GROUP BY artist
ORDER BY 2 DESC
LIMIT 10;
#Rihanna and Drake are the most popular artists
SELECT genre,
COUNT(song) as song_count
FROM accountability.songs_normalize1
GROUP BY genre
ORDER BY 2 DESC
LIMIT 20;
#most are pop songs 

#How many songs about love?
SELECT genre, 
COUNT(song) as song_count
FROM accountability.songs_normalize1
WHERE song LIKE '%love%'
GROUP BY genre
ORDER BY 2 DESC; 
#most are once again pop songs, almost all

#Who sings about love the most
SELECT artist, 
COUNT(song) as song_count
FROM accountability.songs_normalize1
WHERE song LIKE '%love%'
GROUP BY artist
ORDER BY 2 DESC; #Justin Timberlake

SELECT 
COUNT(song) as song_count
FROM accountability.songs_normalize1
WHERE song LIKE '%love%';


#Group by songs for less than 2 mins, 2-3 mins, 3-4 mins, 4mins+
SELECT CASE WHEN duration_ms < 120000 THEN 'less than 2 mins'
WHEN duration_ms >= 120000 AND duration_ms < 180000 THEN 'between 2-3 mins'
WHEN duration_ms >= 180000 AND duration_ms < 240000 THEN 'between 3-4 mins'
WHEN duration_ms >= 240000 THEN 'over 4 mins'
ELSE 'no_data' END AS count,
count(song) as song_categories
FROM accountability.songs_normalize1
GROUP BY 1;
#mainly 3-4 min songs

#Look at distribution of how positive songs are 
SELECT CASE WHEN valence < 0.25 THEN 'bottom 1/4 of scale'
WHEN duration_ms >= 0.25 AND duration_ms <= 0.50 THEN '1/4 to 1/2'
WHEN duration_ms >= 0.50 AND duration_ms < 0.75 THEN '1/2 to 3/4'
WHEN duration_ms >= 0.75 THEN 'over 3/4'
ELSE 'no_data' END AS count,
count(song) as song_categories
FROM accountability.songs_normalize1
GROUP BY 1;

#Look at distribution of tempo
SELECT CASE WHEN tempo < 60 THEN 'less than 60'
WHEN tempo >= 60 AND tempo <= 100 THEN '60-100'
WHEN tempo >= 100 AND tempo < 140 THEN '100 - 140'
WHEN tempo >= 140 AND tempo < 180 THEN '140-180'
WHEN tempo >= 180 THEN 'greater than 180'
ELSE 'no_data' END AS tempo_categories,
count(song) as tempo_count
FROM accountability.songs_normalize1
GROUP BY 1;
#more than half of all songs are between 100-140, not too fast not too slow
#avg tempo is indeed 120, right in between this bracket

#songs in major key versus minor key
SELECT CASE WHEN mode = 1 THEN 'major'
WHEN mode = 0 THEN 'minor'
ELSE 'no_data' END AS key_type,
count(song) as key_type_count
FROM accountability.songs_normalize1
GROUP BY key_type
ORDER BY key_type;
#most common song type is major key

SELECT CASE WHEN explicit = FALSE THEN 'non-explicit'
WHEN explicit = TRUE THEN 'explicit'
ELSE 'no_data' END AS is_explicit,
count(song) as song_count
FROM accountability.songs_normalize1
GROUP BY is_explicit
ORDER BY is_explicit;

SELECT *
FROM accountability.songs_normalize1
WHERE artist LIKE '%Rihanna%';













 






