# Analyzing-Job-offers-using-SQL

 Job Offers Analysis – Analyzed 5,000+ job postings using SQL, identifying key employment trends in France.

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

# 3. France-Specific Analysis

In the second part of the analysis, I focused on France to identify trends specific to this country:

# Job Market Growth: 

The job market in France grew significantly from 2021 to 2022, but showed a slight decline in 2023, which may be due to various economic factors. This growth and decline pattern is typical for job markets experiencing external pressures, such as a post-pandemic economic recovery followed by a slowdown.

# Trends in Job Postings Over Time: 

Job postings in France showed seasonal peaks, with the highest job postings in April 2023. The job market was most active during spring and winter months, while summer months like August-September showed lower posting activity.

# Salary Trends: 

Salaries for most roles, including Investment Bankers, UI Developers, Civil Engineers, and Litigation Attorneys, showed growth from 2022 to 2023. This indicates a demand for these high-skill roles in the French market. Network Security Specialists, however, had relatively lower salaries compared to other specialized roles.

# Top Paying Roles: 

In France, the highest-paying roles were:

Litigation Attorney: $97,000

Civil Engineer: $94,000

Project Manager: $94,000

Front-End Developer: $90,000

Legal Assistant: $85,000

# Experience vs. Salary in France: 

Professionals with 10+ years of experience in France had the highest average salary of $74,333, emphasizing the importance of experience in the job market.

# Job Postings by Location in France: 

The most job postings in France were from cities like Paris, Lyon, and Marseille, with Paris being the hub for job opportunities.

# Analysis and Insights from France

In summary, the analysis revealed several important trends and insights:

# Job Market Growth: 

The French job market showed strong recovery from 2021 to 2022, but experienced a slight decline in 2023, which could indicate a slowdown in hiring.

# Salary Trends: 

There is a growing demand for high-paying roles in law, engineering, and technology, with Litigation Attorneys and Civil Engineers being some of the highest earners. Specialized roles like UI Developers also saw salary growth.

# Seasonal Trends in Job Postings: 

April 2023 saw the highest number of job postings, and the job market was generally more active during the spring and winter months, while summer showed slower hiring activity.

# Experience and Salary: 

Professionals with 10 years of experience had the highest salary on average in France, earning approximately $74,333. Experience plays a key role in salary determination.

# Top Paying Job Titles: 

The highest-paying roles in France include Litigation Attorney, Civil Engineer, and Project Manager, underscoring the strong demand and high compensation for professionals in these fields.

# Geographical Insights: 

Most job postings were concentrated in Paris, with other cities like Lyon and Marseille also showing considerable job activity.

# Conclusion 

The analysis of the Jobs Dataset provided valuable insights into job market trends, salary distributions, and experience requirements, with a focus on different job titles, locations, and countries. The data revealed that roles requiring 6 years of experience were most common, with salaries averaging $82,250. High-paying jobs were found in fields like investment banking and business analysis. In France, the job market showed significant growth from 2021 to 2022, with Litigation Attorneys and Civil Engineers being among the highest-paid roles. However, job postings saw a minor decline in 2023, with higher activity during spring and winter months.

The analysis of France revealed key trends and insights. The job market in France saw growth between 2021 and 2022, with a slight decline in 2023. The peak in job postings occurred in April 2023, while 2022 had more consistent posting activity, particularly in spring and winter months. High-paying roles in France include Litigation Attorneys, Civil Engineers, and Project Managers, with Litigation Attorneys having the highest average salary at $97,000. The data also showed that employees with around 10 years of experience earned the highest average salary of $74,333. The top 5 highest-paying job titles in France were Litigation Attorney, Civil Engineer, Project Manager, Front-End Developer, and Legal Assistant.











