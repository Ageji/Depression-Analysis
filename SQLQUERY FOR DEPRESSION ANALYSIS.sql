--Depression Risk by Smoking and Alcohol Consumption
SELECT Smoking_Status, Alcohol_Consumption, 
       COUNT(*) AS Number_of_Individuals,
       AVG(CASE WHEN History_of_Mental_Illness = 'Yes' THEN 1 ELSE 0 END) AS Depression_Risk
FROM depression
GROUP BY Smoking_Status, Alcohol_Consumption;

--Alcohol Consumption: Impact on Chronic Conditions and Depression Risk
SELECT Alcohol_Consumption, Chronic_Medical_Conditions,
       COUNT(*) AS Number_of_Individuals,
       AVG(CASE WHEN History_of_Mental_Illness = 'Yes' THEN 1 ELSE 0 END) AS Depression_Risk
FROM depression
GROUP BY Alcohol_Consumption, Chronic_Medical_Conditions;


--Comprehensive Analysis of Depression Risk by Demographics and Lifestyle Factors
SELECT CASE 
         WHEN Age BETWEEN 18 AND 25 THEN '18-25'
         WHEN Age BETWEEN 26 AND 35 THEN '26-35'
         WHEN Age BETWEEN 36 AND 45 THEN '36-45'
         WHEN Age BETWEEN 46 AND 55 THEN '46-55'
         WHEN Age > 55 THEN '56+'
       END AS Age_Group,
       Smoking_Status,
       Alcohol_Consumption,
       Physical_Activity_Level,
       Dietary_Habits,
       COUNT(*) AS Number_of_Individuals,
       AVG(CASE WHEN History_of_Mental_Illness = 'Yes' THEN 1 ELSE 0 END) AS Depression_Risk
FROM depression
GROUP BY Age_Group, Smoking_Status, Alcohol_Consumption, Physical_Activity_Level, Dietary_Habits
ORDER BY Age_Group ASC, Smoking_Status ASC, Alcohol_Consumption ASC, Physical_Activity_Level ASC, Dietary_Habits ASC;


--Employment_Status and Marital Status
SELECT Employment_Status,
       Marital_Status,
       COUNT(*) AS Number_of_Individuals,
       AVG(CASE WHEN History_of_Mental_Illness = 'Yes' THEN 1 ELSE 0 END) AS Depression_Risk
FROM depression
GROUP BY Employment_Status, Marital_Status;

--Impact of Dietary Habits on Depression
SELECT Dietary_Habits,
       COUNT(*) AS Number_of_Individuals,
       AVG(CASE WHEN History_of_Mental_Illness = 'Yes' THEN 1 ELSE 0 END) AS Depression_Risk
FROM depression
GROUP BY Dietary_Habits;
