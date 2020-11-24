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

--#11
SELECT COUNT (p.Id) as FourthGradePoems
FROM Author a
INNER JOIN Poem p ON a.Id = p.AuthorId
INNER JOIN Grade g ON g.id = a.GradeId
WHERE g.Name = '4th Grade'

--#12
SELECT COUNT (p.Id) AS GradePoems, g.Name
FROM Author a
INNER JOIN Poem p ON a.Id = p.AuthorId
INNER JOIN Grade g ON g.id = a.GradeId
GROUP BY g.Name
ORDER BY g.Name

--#13
SELECT COUNT (a.Id) GradeAuthors,  g.Name
FROM Author a
INNER JOIN Grade g ON g.id = a.GradeId
GROUP BY g.Name
ORDER BY g.Name

--#14
SELECT WordCount, Title
FROM Poem
WHERE WordCount = (
	SELECT MAX(WordCount) as ShortestWord
	FROM POEM);

--#15
--broke!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT p.Id, a.Name
FROM Poem p
INNER JOIN Author a ON a.Id = p.AuthorId
WHERE p.Id = (
	SELECT COUNT(p.Id) as NumberOfPoems
	FROM POEM)
GROUP BY p.AuthorId
ORDER BY p.Id

--#16
SELECT COUNT (p.Id) AS SadPoemCount
FROM Poem p
INNER JOIN PoemEmotion pe ON pe.PoemId = p.Id
INNER JOIN Emotion e ON e.Id = pe.EmotionId
WHERE e.Name = 'Sadness'

--#17


SELECT pe.PoemId, p.Title
FROM Poem p
LEFT JOIN PoemEmotion pe ON pe.PoemId = p.Id
--INNER JOIN Emotion e ON e.Id = pe.EmotionId
WHERE pe.PoemId = (
SELECT COUNT (pe.PoemId) AS EmotionCount
  = 0
)
GROUP BY p.Title 


SELECT * 
FROM PoemEmotion
ORDER BY PoemId
--#18
--#19
--#20
