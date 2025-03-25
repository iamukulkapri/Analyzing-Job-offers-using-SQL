

-- Dropping unnecessary columns: latitude, longitude, Contact_Person, Contact
ALTER TABLE [dbo].[Jobs_dataset_01]
DROP COLUMN [latitude], [longitude], [Contact_Person], [Contact], [Company_Profile];


SELECT TOP (1000) * FROM dbo.Jobs_dataset_01;

-- Changing Job ID as BIGINT instead of INT so that it could hold large numbers
ALTER TABLE dbo.Jobs_dataset_01
ALTER COLUMN Job_Id BIGINT;

SELECT TOP (1000) * FROM dbo.Jobs_dataset_01;

-- Creating New Columns for Lower and Upper Bound of Experience and deleting column "Experience"
ALTER TABLE dbo.Jobs_dataset_01
ADD Experience_Lower INT,
    Experience_Upper INT;

UPDATE dbo.Jobs_dataset_01
SET 
    Experience_Lower = 
        CAST(SUBSTRING(Experience, 1, CHARINDEX(' to ', Experience) - 1) AS INT),
    Experience_Upper = 
        CAST(SUBSTRING(Experience, CHARINDEX('to ', Experience) + 3, 
                       CHARINDEX(' Years', Experience) - (CHARINDEX('to ', Experience) + 3)) AS INT)
WHERE Experience LIKE '% to %';

ALTER TABLE dbo.Jobs_dataset_01
DROP COLUMN Experience;

SELECT TOP (1000) * FROM dbo.Jobs_dataset_01;

-- Calculating average experience

ALTER TABLE dbo.Jobs_dataset_01
ADD Average_Experience INT;

UPDATE dbo.Jobs_dataset_01
SET Average_Experience = (Experience_Lower + Experience_Upper) / 2;

ALTER TABLE dbo.Jobs_dataset_01
DROP COLUMN Experience_Lower, Experience_Upper;

SELECT TOP (1000) * FROM dbo.Jobs_dataset_01;

-- Checking for Null Values
SELECT 
    COUNT(CASE WHEN Job_Id IS NULL THEN 1 END) AS NULL_Job_Id,
    COUNT(CASE WHEN Average_Experience IS NULL THEN 1 END) AS NULL_Average_Experience,
    COUNT(CASE WHEN Qualifications IS NULL THEN 1 END) AS NULL_Qualifications,
    COUNT(CASE WHEN Salary_Range IS NULL THEN 1 END) AS NULL_Salary_Range,
    COUNT(CASE WHEN Location IS NULL THEN 1 END) AS NULL_Location,
    COUNT(CASE WHEN Country IS NULL THEN 1 END) AS NULL_Country,
    COUNT(CASE WHEN Job_Posting_Date IS NULL THEN 1 END) AS NULL_Job_Posting_Date,
    COUNT(CASE WHEN Preference IS NULL THEN 1 END) AS NULL_Preference,
    COUNT(CASE WHEN Job_Title IS NULL THEN 1 END) AS NULL_Job_Title,
    COUNT(CASE WHEN Role IS NULL THEN 1 END) AS NULL_Role,
    COUNT(CASE WHEN Job_Portal IS NULL THEN 1 END) AS NULL_Job_Portal,
    COUNT(CASE WHEN Job_Description IS NULL THEN 1 END) AS NULL_Job_Description,
    COUNT(CASE WHEN Benefits IS NULL THEN 1 END) AS NULL_Benefits,
    COUNT(CASE WHEN Skills IS NULL THEN 1 END) AS NULL_Skills,
    COUNT(CASE WHEN Responsibilities IS NULL THEN 1 END) AS NULL_Responsibilities,
    COUNT(CASE WHEN Company IS NULL THEN 1 END) AS NULL_Company
FROM dbo.Jobs_dataset_01;

-- First, create a new column for storing the average salary
ALTER TABLE dbo.Jobs_dataset_01
ADD Salary_Lower INT,
    Salary_Upper INT;
    Average_Salary DECIMAL(10,2);

UPDATE dbo.Jobs_dataset_01
SET 
    Salary_Lower = CAST(
        REPLACE(REPLACE(SUBSTRING(Salary_Range, 2, CHARINDEX('-', Salary_Range) - 2), '$', ''), 'K', '') 
        AS INT
    ),

    Salary_Upper = CAST(
        REPLACE(REPLACE(SUBSTRING(Salary_Range, CHARINDEX('-', Salary_Range) + 1, LEN(Salary_Range)), '$', ''), 'K', '') 
        AS INT
    ),

UPDATE dbo.Jobs_dataset_01
SET Average_Salary = (Salary_Lower + Salary_Upper) / 2;

ALTER TABLE dbo.Jobs_dataset_01 
DROP COLUMN Salary_Range, Salary_Lower, Salary_Upper;

UPDATE dbo.Jobs_dataset_01
SET Average_Salary = Average_Salary * 1000;

SELECT TOP (1000) * FROM dbo.Jobs_dataset_01;

 -- Exploratory Data Analysis (EDA)
 -- 1- Analyzing the distribution of job experience:
SELECT 
    AVG(Average_Experience) AS Avg_Experience, 
    MIN(Average_Experience) AS Min_Experience, 
    MAX(Average_Experience) AS Max_Experience,
    COUNT(DISTINCT Average_Experience) AS Distinct_Experience_Count
FROM dbo.Jobs_dataset_01;
-- The average experince is 6 years while the average experince ranges from 4 years to 10 years.

-- 2-  Analyzing Salary distributions
SELECT 
    AVG(Average_Salary) AS Avg_Salary, 
    MIN(Average_Salary) AS Min_Salary, 
    MAX(Average_Salary) AS Max_Salary,
    COUNT(DISTINCT Average_Salary) AS Distinct_Salary_Count
FROM dbo.Jobs_dataset_01;
-- Average salary is $82250 and the minimum and maximum average salary range from $67000 to $97000.

--  3- Analysing the frequency of job titles
SELECT 
    Job_Title, 
    COUNT(*) AS Frequency
FROM dbo.Jobs_dataset_01
GROUP BY Job_Title
ORDER BY Frequency DESC;
-- IT jobs are more present like ui/ux Designer, Software engineer followed by Digital Marketing specialist

-- 4- Analyzing Location or Country Data
--1- Frequency of Job Postings by Location:
SELECT 
    Location, 
    COUNT(*) AS Frequency
FROM dbo.Jobs_dataset_01
GROUP BY Location
ORDER BY Frequency DESC;

-- Most of the jobs are posted in Apia (79 jobs), Seoul (45 jobs) and Kigali (41 jobs), while least jobs are posted in Minsk (13 jobs).

--2-  Frequency of Job Postings by Country:
SELECT 
    Country, 
    COUNT(*) AS Frequency
FROM dbo.Jobs_dataset_01
GROUP BY Country
ORDER BY Frequency DESC;

-- Most of the jobs are posted in American Samoa (46 jobs) while least jobs were posted in Belarus (13 jobs).

-- Analyzing the Relationship Between Experience and Salary
SELECT 
    AVG(Average_Salary) AS Avg_Salary, 
    AVG(Average_Experience) AS Avg_Experience
FROM dbo.Jobs_dataset_01;

--Analyzing Job Posting Dates:

SELECT 
    YEAR(Job_Posting_Date) AS Posting_Year, 
    MONTH(Job_Posting_Date) AS Posting_Month, 
    COUNT(*) AS Frequency
FROM dbo.Jobs_dataset_01
GROUP BY YEAR(Job_Posting_Date), MONTH(Job_Posting_Date)
ORDER BY Posting_Year, Posting_Month;

-- The frequency of job postings varies from months to months among different years. High Posting Periods:
--January (likely due to new fiscal years and post-holiday hiring push), May-June (mid-year hiring cycles or project ramp-ups).
--November-December (end-of-year pushes and year-end staffing plans).
--Low Posting Periods: August-September (summer slowdowns and pre-holiday periods).


--Calculating running total of salaries and ranking jobs based on salary
SELECT 
    Job_Title,
    Average_Salary,
    SUM(Average_Salary) OVER (ORDER BY Average_Salary) AS Running_Total_Salary,
    RANK() OVER (ORDER BY Average_Salary DESC) AS Salary_Rank
FROM dbo.Jobs_dataset_01;

-- The salary Rank is highest for Purchasing Agent, followed by Investment Banker and Business Analyst.

-- Using subqueries to filter and calculate the average salary for jobs with more than 5 years of experience
SELECT 
    Job_Title,
    (SELECT AVG(Average_Salary) 
     FROM dbo.Jobs_dataset_01 AS subquery 
     WHERE subquery.Average_Experience > 5) AS Avg_Salary_Over_5_Years_Experience
FROM dbo.Jobs_dataset_01;

-- For jobs with more than 5 years of work experience is 82205, irrespective of the job role.

-- Comparing job postings with similar experience levels (Self Join)

SELECT 
    j1.Job_Title AS Job_Title_1,
    j1.Average_Experience AS Experience_1,
    j2.Job_Title AS Job_Title_2,
    j2.Average_Experience AS Experience_2
FROM dbo.Jobs_dataset_01 AS j1
INNER JOIN dbo.Jobs_dataset_01 AS j2
    ON j1.Average_Experience = j2.Average_Experience
    AND j1.Job_Id <> j2.Job_Id
ORDER BY j1.Average_Experience;

-- Average salary as per the job roles

SELECT Job_Title, AVG(Average_Salary) AS Avg_Salary
FROM dbo.Jobs_dataset_01
GROUP BY Job_Title
ORDER BY Avg_Salary DESC;

--The results shows that high-paying roles such as Electrical Designer and Architect earn around $85K–$86K, 
--while many tech roles like Software Developer and Data Engineer also have competitive salaries near $82K–$83K. 
--Conversely, roles like Product Designer and Accountant have relatively lower salaries, 
--around $77K–$79K, indicating a salary disparity across industries and job types.

-- Top Companies with High Salaries

SELECT Company, AVG(Average_Salary) AS Avg_Salary
FROM dbo.Jobs_dataset_01
GROUP BY Company
ORDER BY Avg_Salary DESC;

-- Ball, Public Service Enterprise Group & Tata Consultancy Services are the comapnies where average pay is highest.

-- Average Salary for Jobs in France
SELECT 
    Job_Title, 
    AVG(Average_Salary) AS Avg_Salary
FROM dbo.Jobs_dataset_01
WHERE Country = 'France'
GROUP BY Job_Title
ORDER BY Avg_Salary DESC;

-- In France, average salary is highest for Litigation Attorney ($97000), followed by Civil Engineer$(94000) 
--and Project Manager($94000).

--Trends in Job Postings Over Time in France
SELECT 
    YEAR(Job_Posting_Date) AS Year,
    MONTH(Job_Posting_Date) AS Month,
    COUNT(*) AS Job_Count
FROM dbo.Jobs_dataset_01
WHERE Country = 'France'
GROUP BY YEAR(Job_Posting_Date), MONTH(Job_Posting_Date)
ORDER BY Year DESC, Month DESC;

--2023 has fewer postings overall, with a peak in April.
--2022 had more consistent postings, especially in the spring and winter months.
--2021 had the least activity, with sporadic postings.

--Average Salary for Job Titles Over Time in France
SELECT 
    Job_Title,
    YEAR(Job_Posting_Date) AS Year,
    AVG(Average_Salary) AS Avg_Salary
FROM dbo.Jobs_dataset_01
WHERE Country = 'France'
GROUP BY Job_Title, YEAR(Job_Posting_Date)
ORDER BY Job_Title, Year DESC;

--The data shows that salaries for most job titles, like Investment Banker and UI Developer, have increased from 2022 to 2023, 
--indicating growth in demand. High-paying roles such as Civil Engineer and Litigation Attorney maintain stable salaries, 
--while more specialized roles like Network Security Specialist have lower average salaries.

SELECT 
    Average_Experience,
    AVG(Average_Salary) AS Avg_Salary
FROM dbo.Jobs_dataset_01
WHERE Country = 'France'
GROUP BY Average_Experience
ORDER BY Average_Experience;

-- It could be observed that for people with average 10 years of experience, earns highest with an average salary of $74333.

--Top 5 Highest Paying Job Titles in France

SELECT 
    TOP 5 
    Job_Title, 
    AVG(Average_Salary) AS Avg_Salary
FROM dbo.Jobs_dataset_01
WHERE Country = 'France'
GROUP BY Job_Title
ORDER BY Avg_Salary DESC;

--Top 5 highest paying jobs in France are: Litigation Attorney, Civil Engineer, Project Manager, Front-End Developer, Legal Assistant

