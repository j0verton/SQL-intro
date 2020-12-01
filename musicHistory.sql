
--#1
SELECT 
Id, Label 
FROM Genre;


--#2
SELECT Id, ArtistName, YearEstablished 
FROM Artist
ORDER BY ArtistName;

--#3
SELECT s.Id, Title, a.ArtistName
FROM Song s
INNER JOIN Artist a on s.ArtistId = a.Id;


-- #4
--this returns too many results, an instance of the artist for each album
SELECT a.Id, a.ArtistName, g.Label
FROM Album al
INNER JOIN Genre g on g.Id = al.GenreId
INNER JOIN Artist a on a.Id = al.ArtistId
WHERE g.Label = 'Pop';

--#5
--still multiples like #4
SELECT a.Id, a.ArtistName, g.Label
FROM Artist a
INNER JOIN Album al on a.Id = al.ArtistId
INNER JOIN Genre g on g.Id = al.GenreId
WHERE g.Label = 'Jazz' OR g.Label ='Rock';

--#6 
SELECT a.Title
FROM Album a
LEFT JOIN Song s ON a.Id = s.AlbumId
WHERE s.Title IS NULL;

--#7
--INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('The Drive-by Truckers', 1984)

--#8
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('The Dirty South', '08/24/2004', 7034, 'New West Records', 28, 2 )

--#9
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Danko/Manuel', 547,'08/24/2004', 2, 28, 23 ), ('Never Gonna Change', 524,'08/24/2004', 2, 28, 23 ), ('Tornadoes', 415,'08/24/2004', 2, 28, 23 ) 

--#10
SELECT a.Title, s.Title, ar.ArtistName
FROM Album a
LEFT JOIN Artist ar ON a.ArtistId = ar.Id
LEFT JOIN Song s ON s.AlbumId = a.Id 
WHERE ar.ArtistName ='The Drive-by Truckers'

--SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;
--SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;


--#11
SELECT COUNT(s.Id), a.Title
FROM Album a
INNER JOIN Song s ON s.AlbumId = a.Id
GROUP BY a.Title

--#12
SELECT COUNT(s.Id), a.ArtistName
FROM Artist a
INNER JOIN Song s ON s.ArtistId = a.Id
GROUP BY a.ArtistName

--#13
SELECT COUNT(s.Id), g.Label
FROM Genre g
INNER JOIN Song s ON s.GenreId = g.Id
GROUP BY g.Label

--#14
SELECT COUNT(DISTINCT al.Label) AS NumberofLabels, a.ArtistName 
FROM Artist a
INNER JOIN Album al on a.Id = al.ArtistId
GROUP BY a.ArtistName 
HAVING COUNT(DISTINCT al.Label)> 1


--#15
SELECT Title, AlbumLength
FROM Album
WHERE AlbumLength = (
	SELECT MAX(AlbumLength)
	FROM Album);
--GROUP BY Title

--#16 & #17
SELECT s.Title, s.SongLength, al.Title
FROM Song s
INNER JOIN Album al on s.AlbumId = al.Id
WHERE SongLength = (
	SELECT MAX(SongLength)
	FROM Song);


	--SELECT TOP 1 SongLength, Title
	--FROM Song
	--ORDER BY SongLength DESC