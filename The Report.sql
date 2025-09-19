SET NOCOUNT ON;
with withMarks as ( 
select name , marks ,  
 case  
  WHEN marks BETWEEN 90 AND 100 THEN 10
      WHEN marks BETWEEN 80 AND 89 THEN 9
      WHEN marks BETWEEN 70 AND 79 THEN 8
      WHEN marks BETWEEN 60 AND 69 THEN 7
      WHEN marks BETWEEN 50 AND 59 THEN 6
      WHEN marks BETWEEN 40 AND 49 THEN 5
      WHEN marks BETWEEN 30 AND 39 THEN 4
      WHEN marks BETWEEN 20 AND 29 THEN 3
      WHEN marks BETWEEN 10 AND 19 THEN 2
      WHEN marks BETWEEN 0 AND 9 THEN 1 
 end as grades 
 from Students  
) 
select   
CASE WHEN grades < 8 THEN NULL ELSE name END AS name, 
grades , marks from withMarks  
order by  
case when grades >= 8 THEN 1 ELSE 2 END, 
  CASE WHEN grades >= 8 THEN grades END DESC,
  CASE WHEN grades >= 8 THEN name END ASC,
  CASE WHEN grades < 8 THEN grades END DESC,
  CASE WHEN grades < 8 THEN marks END ASC



go
