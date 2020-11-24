--#1
SELECT id, name
FROM GRADE

--#2
SELECT id, name
FROM Emotion

--#3
SELECT COUNT(Id) AS NumberOfPoems
FROM Poem

--#4
SELECT Id, Name
FROM Author
WHERE Id < 77
--WHERE Id BETWEEN 0 AND 76
ORDER BY Name

--#5
SELECT a.Name, g.Name
FROM Author a
INNER JOIN Grade g ON g.id = a.GradeId
WHERE a.Id < 77
ORDER BY a.Name


--#6
SELECT a.Name, g.Name, ge.Name
FROM Author a
INNER JOIN Grade g ON g.id = a.GradeId
INNER JOIN Gender ge ON ge.id = a.GenderId
WHERE a.Id < 77
ORDER BY a.Name

--#7
SELECT SUM(WordCount) AS TotalWords
FROM Poem

--#8
SELECT WordCount, Title
FROM Poem
WHERE WordCount = (
	SELECT MIN(WordCount) as ShortestWord
	FROM POEM);

--#9
SELECT COUNT (a.Name) as ThirdGradeAuthors
FROM Author a
INNER JOIN Grade g ON g.id = a.GradeId
WHERE g.Name = '3rd Grade'

--#10
SELECT COUNT (a.Name) as ThirdGradeAuthors
FROM Author a
INNER JOIN Grade g ON g.id = a.GradeId
WHERE g.Name = '3rd Grade' OR g.Name = '2nd Grade' OR g.Name = '1st Grade'