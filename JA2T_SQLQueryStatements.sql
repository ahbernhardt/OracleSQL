------------------------
--- Exhibit B Part C ---
------------------------
/* The following SQL query generates the Project Information shown in Part C of Exhibit B */
SELECT ProjectNumber,
      (ProjectStreetAddress || ',' || ProjectCity || ',' || ProjectState || ' ' || ProjectZipCode) AS ProjectLocation,
      ProjectDescription
FROM PROJECT
WHERE ProjectNumber like 'IL-HYT-554-009';

------------------------
--- Exhibit B Part D ---
------------------------
/* The following a series of SQL query generates the Detail Hours in specific project */
/* Using ProjectNumber = 'IL-HYT-554-009' as an example */

-- This statement create a view table show EEO hours from employee who worked on the project
-- show by skillcode, Minority/Nonminority, Gender, SUM of each skillcode job total hours
CREATE VIEW EEO_DETAIL_HOURS AS
SELECT  ej.SkillCode,
        CASE WHEN e.EmployeeRace = 5 AND e.EmployeeGender = 'M' THEN 'NonMinority-Male'
             WHEN e.EmployeeRace = 5 AND e.EmployeeGender = 'F' THEN 'NonMinority-Female'
             WHEN e.EmployeeRace != 5 AND e.EmployeeGender = 'M' THEN 'Minority-Male'
             ELSE 'Minority-Female' END as Race_Gender,
        ej.JobHOURS AS RACE_GENDER_HOURS,
        SUM(ej.JobHours) OVER (PARTITION BY ej.SkillCode) AS JOBHOURS_BySKILLCODE
FROM EMPLOYEE_JOB ej JOIN EMPLOYEE_INFO e
    ON ej.EmployeeNumber = e.EmployeeSocialSecurityNumber
WHERE ej.ProjectNumber LIKE 'IL-HYT-554-009'
GROUP BY ej.SkillCode, e.EmployeeRace, e.EmployeeGender, ej.jobhours;


-- This Statement show hours of minority/non-minority and each gender from row of table above into columns
-- Simplified the Skillcode and job_hours columns
CREATE VIEW SKILLCODE_RACE_GENDERS_JOBHOURS_COLUMNS AS
SELECT *
FROM (SELECT SkillCode, Race_Gender, RACE_GENDER_HOURS, JOBHOURS_BySKILLCODE AS JOB_HOURS
         FROM EEO_DETAIL_HOURS)
            PIVOT( 
                SUM(RACE_GENDER_HOURS) as hours 
                FOR Race_Gender IN (
                'NonMinority-Male' as NonMinor_Male,
                'NonMinority-Female' as NonMinor_Female,
                'Minority-Male' as Minor_Male,
                'Minority-Female' as Minor_Female)
                );  

-- Statement show % of Job Hours Worked By Minority and Female Columns
CREATE VIEW PERCENT_JOBHOURS_WORKED_BY AS
SELECT SkillCode, 
       ((NVL(Minor_Male_hours,0) + NVL(Minor_Female_hours,0))/JOB_HOURS) *100 AS Minority_percent_eachskill,
        ((NVL(Minor_Female_hours,0) + NVL(NonMinor_Female_hours,0))/JOB_HOURS)*100 AS Female_percent_eachskill
FROM SKILLCODE_RACE_GENDERS_JOBHOURS_COLUMNS;

-- Statement show Total Hours Row Of All Columns in Exhibit B Part D
CREATE VIEW TOTAL_HOURS_ROW AS
SELECT SUM(NonMinor_Male_hours) AS NonMinor_M_TotalHours, 
       SUM(NonMinor_Female_hours) AS NonMinor_F_TotalHours, 
       SUM(Minor_Male_hours) AS Minor_M_TotalHours,
       SUM(Minor_Female_hours) AS Minor_F_TotalHours,
       SUM(JOB_HOURS) AS JOB_HOURS,
       ROUND((((SUM(Minor_Male_hours) + SUM(Minor_Female_hours))/SUM(JOB_HOURS))*100),2) AS Minority_Total_Percent,
       ROUND((((SUM(Minor_Female_hours) + SUM(NonMinor_Female_hours))/SUM(JOB_HOURS))*100),2) AS Female_Total_Percent
FROM SKILLCODE_RACE_GENDERS_JOBHOURS_COLUMNS;


------------------------
--- Exhibit C Part C ---
------------------------
-- The following SQL query generates the Detailed Pay Scale shown */
SELECT SkillCode AS Code,
      SkillClassification AS JobClassification,
      TO_CHAR(Skillpaymentrate, '99990.99') AS BasicHourlyRate,
      TO_CHAR(FringeBenefitPayment, '99990.99') AS FringeBenefitsPayments,
      TO_CHAR((SkillPaymentRate + FringeBenefitPayment), '99990.99') AS TotalCompensation
FROM SKILL;

------------------------
--- Exhibit D Part D ---
------------------------  
-- Regular hours worked and gross pay  by an employee by skill code 
SELECT ej.EmployeeNumber, s.SkillCode, SkillPaymentRate, FringeBenefitPayment, JobHours, (skillpaymentrate + fringebenefitpayment) AS TotalPayment, (Jobhours*(skillpaymentrate + fringebenefitpayment)) AS Gross
FROM SKILL s JOIN EMPLOYEE_JOB ej ON s.skillcode = ej.skillcode JOIN PAYROLL p ON
ej.employeenumber = p.employeenumber
-- WHERE function optional if looking for specific skill
WHERE s.SkillCode = 'LAB' or s.SkillCode = 'MAS';

------------------------
--- Exhibit D Part E ---
------------------------ 
-- Overtime hours worked by an employee and the gross pay
SELECT ej.employeenumber, s.SkillCode, SkillPaymentRate, FringeBenefitPayment, JobHours, (overtimeskillpaymentrate + fringebenefitpayment) AS TotalPayment, OvertimeHoursWorked, ((overtimeskillpaymentrate + fringebenefitpayment) * overtimehoursworked) AS TotalOTGross
FROM SKILL s JOIN EMPLOYEE_JOB ej ON s.skillcode = ej.skillcode JOIN PAYROLL p 
on ej.employeenumber = p.employeenumber
-- WHERE function optional if looking for specific project
WHERE OvertimeHoursWorked <> 0 and s.skillcode = 'EQP';

------------------------
--- Exhibit D Part F ---
------------------------
-- Query - Total hours worked per skill classification
SELECT distinct skillcode, SUM(JobHours) AS Regular, SUM(OvertimeHoursWorked) AS Overtime,
SUM(JobHours+OvertimeHoursWorked) AS Total
FROM EMPLOYEE_JOB
GROUP BY skillcode;

------------------------
---    Exhibit E     ---
------------------------ 
-- Query: Employee Information
SELECT *
FROM EMPLOYEE_INFO;
-- WHERE Clause is optional if searching for specific employee's info 

------------------------
---    Exhibit F     ---
------------------------ 
-- Query: Regular Pay
SELECT p.ProjectSupervisor, s.SkillClassification, s.SkillPaymentRate, s.FringeBenefitPayment, 
(s.SkillPaymentRate + s.FringeBenefitPayment) AS Total, ej.JobHours AS Hours, ((s.SkillPaymentRate + s.FringeBenefitPayment)*ej.JobHours) AS Gross
FROM SKILL s JOIN EMPLOYEE_JOB ej ON s.SkillCode = ej.SkillCode
JOIN PROJECT p ON ej.ProjectNumber = p.ProjectNumber
WHERE employeenumber = '098-76-5432';
-- Update Employee Number as needed 
SELECT SUM(jobhours) as TotalRegularPayHours
FROM EMPLOYEE_JOB
WHERE employeenumber = '098-76-5432';
-- Update Employee Number as needed
SELECT SUM((s.SkillPaymentRate + s.FringeBenefitPayment)*ej.JobHours) AS TotalRegularPay
FROM SKILL s JOIN EMPLOYEE_JOB ej ON s.SkillCode = ej.SkillCode
WHERE employeenumber = '098-76-5432';
-- Update Employee Number as needed

------------------------
---    Exhibit E     ---
------------------------ 
-- Query: Overtime Pay
SELECT p.ProjectSupervisor, s.SkillClassification, s.OvertimeSkillPaymentRate, s.FringeBenefitPayment, 
(s.OvertimeSkillPaymentRate + s.FringeBenefitPayment) AS Total, ej.OvertimeHoursWorked AS Hours, ((s.OvertimeSkillPaymentRate + s.FringeBenefitPayment)*ej.OvertimeHoursWorked) AS Gross
FROM SKILL s JOIN EMPLOYEE_JOB ej ON s.SkillCode = ej.SkillCode
JOIN PROJECT p ON ej.ProjectNumber = p.ProjectNumber
Where employeenumber = '098-76-5432' AND ej.OvertimeHoursWorked <> 0;
-- Update employeenumber as needed
SELECT SUM(overtimehoursworked) as TotalOvertimePayHours
FROM EMPLOYEE_JOB
WHERE employeenumber = '098-76-5432';
-- Update employeenumber as needed
SELECT (((s.OvertimeSkillPaymentRate + s.FringeBenefitPayment)*ej.OvertimeHoursWorked)) AS TotalOverTimePay
FROM SKILL s JOIN EMPLOYEE_JOB ej ON s.SkillCode = ej.SkillCode
WHERE employeenumber = '098-76-5432' and ((s.OvertimeSkillPaymentRate + s.FringeBenefitPayment)*ej.OvertimeHoursWorked) <> 0;