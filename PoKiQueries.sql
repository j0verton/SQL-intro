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

--#8 -- Which poem has the fewest characters?
SELECT WordCount, Title
FROM Poem
WHERE WordCount = (
	SELECT MIN(WordCount) as ShortestWord
	FROM POEM);

	--#8 from Adam solution seems wrong ___________________________________________________
	SELECT TOP 1 Title, CharCount 
	FROM Poem
ORDER BY CharCount

--#9
SELECT COUNT (a.Name) as ThirdGradeAuthors
FROM Author a
INNER JOIN Grade g ON g.id = a.GradeId
WHERE g.Name = '3rd Grade'

--#9 from tyler
SELECT COUNT (a.Name), g.Name
FROM Author a
INNER JOIN Grade g ON g.id = a.GradeId
WHERE g.Name = '3rd Grade'
GROUP BY G.Name

--#10 How many authors are in the first, second or third grades?
--mine groups them into a single number which was not as intended
SELECT COUNT (a.Name) as FirstSecondThirdGradeAuthors
FROM Author a
INNER JOIN Grade g ON g.id = a.GradeId
WHERE g.Name = '3rd Grade' OR g.Name = '2nd Grade' OR g.Name = '1st Grade'

--#10 from tyler
SELECT COUNT (a.Name) as FirstSecondThirdGradeAuthors, G.Name
FROM Author a
INNER JOIN Grade g ON g.id = a.GradeId
WHERE g.Name = '3rd Grade' OR g.Name = '2nd Grade' OR g.Name = '1st Grade'
GROUP BY G.Name

--#11 What is the total number of poems written by fourth graders?
SELECT COUNT (p.Id) as FourthGradePoems
FROM Author a
INNER JOIN Poem p ON a.Id = p.AuthorId
INNER JOIN Grade g ON g.id = a.GradeId
WHERE g.Name = '4th Grade'

--#12 How many poems are there per grade?
SELECT COUNT (p.Id) AS GradePoems, g.Name
FROM Author a
INNER JOIN Poem p ON a.Id = p.AuthorId
INNER JOIN Grade g ON g.id = a.GradeId
GROUP BY g.Name
ORDER BY g.Name

--#13 How many authors are in each grade? (Order your results by grade starting with 1st Grade)
SELECT COUNT (a.Id) GradeAuthors,  g.Name
FROM Author a
INNER JOIN Grade g ON g.id = a.GradeId
GROUP BY g.Name
ORDER BY g.Name

--#14 What is the title of the poem that has the most words_______________________________________
SELECT WordCount, Title
FROM Poem
WHERE WordCount = (
	SELECT MAX(WordCount)
	FROM POEM);

	--#14 alt from adam, appears wrong
SELECT TOP 1 Title, WordCount
FROM Poem
ORDER BY WordCount DESC

--#15xx
--which author has the most poems

--broke 
SELECT au.*, MAX(a.Num)
FROM (SELECT AuthorId, COUNT(Id) AS Num
	FROM Poem
	group by AuthorId
) a
INNER JOIN Author au ON a.AuthorId = au.Id

-- cant access author name
SELECT  MAX(Author.Num)
FROM (SELECT COUNT(Id) AS Num
	FROM Poem
	group by Authorid
) Author;

--gives the wrong result (combined same names)
SELECT TOP 1 COUNT (p.Id) AS PoemCount, au.Name
FROM Poem p
JOIN Author au ON p.AuthorId = au.Id
GROUP BY au.Name
ORDER BY PoemCount DESC

-- from adam
SELECT a.Name, Count(p.Id) as PoemCount
FROM Author a
JOIN Poem p ON p.AuthorId = a.Id
GROUP BY a.Id, a.Name
ORDER BY COUNT(p.Id) DESC



--#16
SELECT COUNT (p.Id) AS SadPoemCount
FROM Poem p
INNER JOIN PoemEmotion pe ON pe.PoemId = p.Id
INNER JOIN Emotion e ON e.Id = pe.EmotionId
WHERE e.Name = 'Sadness'

--#17xx
--how many poems have no emotion
--broke!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT pe.PoemId, p.Title
FROM Poem p
LEFT JOIN PoemEmotion pe ON pe.PoemId = p.Id
--INNER JOIN Emotion e ON e.Id = pe.EmotionId
WHERE pe.PoemId = (
	SELECT COUNT (pe.PoemId) AS EmotionCount)
GROUP BY p.Title 

SELECT Poem.num
FROM (SELECT COUNT )

SELECT * 
FROM PoemEmotion
ORDER BY PoemId


--FROM ADAM
SELECT COUNT(*)  AS EmotionlessPoems
FROM Poem p
LEFT JOIN PoemEmotion pe ON pe.PoemId = p.Id
WHERE pe.Id IS NULL

--#18
--find emotion with fewest poems
--working!
SELECT COUNT(e.Id), e.Name
FROM Poem p
INNER JOIN PoemEmotion pe ON pe.PoemId = p.Id
JOIN Emotion e ON pe.EmotionId = e.Id
GROUP BY e.Name
ORDER BY COUNT(e.Id)
--FROM ADAM
SELECT TOP 1 e.Name
FROM Poem p
JOIN PoemEmotion pe ON pe.PoemId = p.Id
JOIN Emotion e ON pe.EmotionId = e.Id
GROUP BY e.Name
ORDER BY COUNT(e.Id)

--#19xx

--#20xx
