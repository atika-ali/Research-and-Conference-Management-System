
-- 1. List research projects with total student hours/week > 20
SELECT ProjectID, SUM(HoursPerWeek) AS TotalHours
FROM StudentProject
GROUP BY ProjectID
HAVING SUM(HoursPerWeek) > 20;

-- 2. Top 3 most published faculty in the last 5 years
SELECT FacultyID, COUNT(*) AS PublicationCount
FROM FacultyPublication
WHERE Year >= YEAR(CURDATE()) - 5
GROUP BY FacultyID
ORDER BY PublicationCount DESC
LIMIT 3;

-- 3. Students who have published and attended conferences
SELECT DISTINCT p.StudentID
FROM PublicationStudent p
JOIN StudentConference c ON p.StudentID = c.StudentID;

-- 4. Total funding handled by each faculty
SELECT FacultyID, SUM(FundingAmount) AS TotalFunding
FROM Project
GROUP BY FacultyID;

-- 5. Conferences where no CS department member attended
SELECT c.ConferenceID, c.Name
FROM Conference c
WHERE c.ConferenceID NOT IN (
    SELECT ConferenceID
    FROM FacultyConference
    WHERE FacultyID IN (
        SELECT FacultyID
        FROM Faculty
        WHERE Department = 'CS'
    )
);

-- 6. List students who are involved in exactly 2 projects
SELECT StudentID
FROM StudentProject
GROUP BY StudentID
HAVING COUNT(ProjectID) = 2;

-- 7. Publications that have authors from more than one department
SELECT PublicationID
FROM (
    SELECT ps.PublicationID, COUNT(DISTINCT s.Department) AS DeptCount
    FROM PublicationStudent ps
    JOIN Student s ON ps.StudentID = s.StudentID
    GROUP BY ps.PublicationID
) AS DeptCheck
WHERE DeptCount > 1;

-- 8. Conferences where students presented and their supervisor also attended
SELECT DISTINCT sc.ConferenceID
FROM StudentConference sc
JOIN Supervision su ON sc.StudentID = su.StudentID
JOIN FacultyConference fc ON su.FacultyID = fc.FacultyID
WHERE sc.ConferenceID = fc.ConferenceID;

-- 9. List faculty who have supervised students but have not authored any publication
SELECT DISTINCT s.FacultyID
FROM Supervision s
WHERE s.FacultyID NOT IN (
    SELECT FacultyID
    FROM FacultyPublication
);

-- 10. Find the total number of conferences each department participated in during the last 3 years
SELECT f.Department, COUNT(DISTINCT fc.ConferenceID) AS ConferenceCount
FROM FacultyConference fc
JOIN Faculty f ON fc.FacultyID = f.FacultyID
JOIN Conference c ON fc.ConferenceID = c.ConferenceID
WHERE c.Year >= YEAR(CURDATE()) - 3
GROUP BY f.Department;
