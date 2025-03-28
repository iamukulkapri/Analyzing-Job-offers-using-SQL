# Analyzing-Job-offers-using-SQL

 Job Offers Analysis – Analyzed 5,000+ job postings using SQL, identifying key employment trends in France.

# Dataset:

[Job_Id]:
A unique identifier for each job posting. This is typically an integer or bigint that uniquely distinguishes each job.

[Experience]:
The experience required for the job, often represented in terms like "3 to 5 years" or "5+ years."

[Qualifications]:
The educational or professional qualifications required for the job, such as a degree or certifications.

[Salary_Range]:
The salary offered for the job, usually given as a range (e.g., "$50,000 - $70,000" or "$60K-$80K").

[Location]:
The physical location of the job, which could be a city or specific area.

[Country]:
The country where the job is located (e.g., "USA," "France," "Germany").

[latitude]:
The latitude coordinate of the job location (usually used for geospatial analysis).

[longitude]:
The longitude coordinate of the job location, used in conjunction with latitude for geospatial data.

[Work_Type]:
The type of work arrangement offered, such as full-time, part-time, freelance, or remote.

[Company_Size]:
The size of the company posting the job (e.g., small, medium, large), typically categorized by the number of employees.

[Job_Posting_Date]:
The date when the job was posted, important for understanding the recency of the job offer.

[Preference]:
Any preferences or specific requirements for the job, such as desired skills, personality traits, or language proficiency.

[Contact_Person]:
The person to contact regarding the job posting (e.g., HR representative or recruiter).

[Contact]:
Contact information for the person listed in the previous column, such as an email or phone number.

[Job_Title]:
The title or designation of the job, such as "Software Engineer," "Project Manager," or "Data Analyst."

[Role]:
The role or responsibility associated with the job title, such as "Developer," "Manager," or "Analyst."

[Job_Portal]:
The platform or job portal where the job was posted (e.g., LinkedIn, Indeed, company website).

[Job_Description]:
A detailed description of the job responsibilities, tasks, and requirements.

[Benefits]:
The benefits associated with the job, such as health insurance, retirement plans, bonuses, or other perks.

[Skills]:
The skills required for the job, like programming languages, software tools, or interpersonal skills.

[Responsibilities]:
A breakdown of the main duties and tasks associated with the job.

[Company]:
The name of the company posting the job.

[Company_Profile]:
A description or profile of the company, outlining its values, work culture, and other company-specific information.

# Analysis of the Code and Insights

This project aimed at analyzing a dataset of job postings by cleaning the data, exploring key trends, and deriving meaningful insights based on the data. The dataset contains information on job positions, such as job titles, experience requirements, salary ranges, locations, and company details. Below is a detailed explanation of the steps taken and the insights derived from the analysis.

# 1. Data Cleaning and Preprocessing

The project began with data cleaning, which involved the following steps:

# Dropping unnecessary columns:

Columns like latitude, longitude, Contact_Person, Contact, and Company_Profile were dropped from the dataset. These columns were deemed unnecessary for the analysis since they did not provide meaningful insights.

# Changing the Job ID column type: 

The Job_Id column was changed from INT to BIGINT to ensure that it could hold large numbers, accommodating a larger dataset.

# Splitting the Experience column: 

The experience data was in a range format (e.g., "2 to 5 years"). To make it more useful, two new columns (Experience_Lower and Experience_Upper) were created, splitting the range into lower and upper bounds. The Experience column was then removed. Subsequently, the average experience for each job was calculated and stored in a new column (Average_Experience), and the Experience_Lower and Experience_Upper columns were dropped.

# Salary Range Extraction: 

The Salary_Range column, which was in a string format (e.g., "$50K-$60K"), was split into Salary_Lower and Salary_Upper columns. These values were cleaned by removing dollar signs and the "K" character. The average salary was calculated and stored in a new column (Average_Salary), and the original Salary_Range column was dropped.

# Null Value Check: 

I checked for NULL values in key columns such as Job_Id, Experience, Salary_Range, Location, and others. The analysis revealed some columns with missing values, which I handled appropriately to avoid inaccuracies in the analysis.

# 2. Exploratory Data Analysis (EDA)

Once the data was cleaned, I performed Exploratory Data Analysis (EDA) to extract meaningful insights:

# Experience Analysis: 

The average experience in the dataset was found to be around 6 years. The experience ranged from 4 years to 10 years, highlighting that most job postings required mid-level professionals.

# Salary Analysis: 

The average salary in the dataset was found to be $82,250. Salaries ranged from $67,000 to $97,000, with roles like Purchasing Agents, Investment Bankers, and Business Analysts having higher salaries compared to other job titles.

# Job Title Frequency: 

A frequency analysis revealed that UI/UX Designers, Software Engineers, and Digital Marketing Specialists were the most commonly posted job titles in the dataset, showing high demand in technology and marketing sectors.

# Location and Country Analysis: 

The most frequent job postings were in cities like Apia, Seoul, and Kigali, while Minsk had the fewest job postings. The majority of job postings were located in American Samoa, with France being one of the top countries for job postings.

# Job Posting Trends: 

By analyzing the job posting dates, I observed that job postings peaked in January (likely due to new fiscal years) and in May-June (mid-year hiring cycles). August-September showed low posting activity, likely due to the summer slowdown.

# Experience vs. Salary: 

A relationship between experience and salary was analyzed, showing that salaries generally increase with higher experience levels. A subquery was used to calculate the average salary for jobs requiring more than 5 years of experience, which was $82,205.

# Company and Salary: 

I analyzed the average salary by company, revealing that companies like Ball, Public Service Enterprise Group, and Tata Consultancy Services offered the highest salaries.

# Conclusion 

The analysis of the Jobs Dataset provided valuable insights into job market trends, salary distributions, and experience requirements, with a focus on different job titles, locations, and countries. The data revealed that roles requiring 6 years of experience were most common, with salaries averaging $82,250. High-paying jobs were found in fields like investment banking and business analysis. In France, the job market showed significant growth from 2021 to 2022, with Litigation Attorneys and Civil Engineers being among the highest-paid roles. However, job postings saw a minor decline in 2023, with higher activity during spring and winter months.

The analysis of France revealed key trends and insights. The job market in France saw growth between 2021 and 2022, with a slight decline in 2023. The peak in job postings occurred in April 2023, while 2022 had more consistent posting activity, particularly in spring and winter months. High-paying roles in France include Litigation Attorneys, Civil Engineers, and Project Managers, with Litigation Attorneys having the highest average salary at $97,000. The data also showed that employees with around 10 years of experience earned the highest average salary of $74,333. The top 5 highest-paying job titles in France were Litigation Attorney, Civil Engineer, Project Manager, Front-End Developer, and Legal Assistant.











