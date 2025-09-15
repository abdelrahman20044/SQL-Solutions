;WITH joined AS ( 
    SELECT 
        s.user_id, 
        c.time_stamp, 
        c.action  
    FROM Signups s 
    LEFT JOIN Confirmations c  
        ON s.user_id = c.user_id              
), 
Counts AS ( 
    SELECT  
        user_id, 
        COUNT(CASE WHEN action = 'timeout' THEN 1 END) AS timeoutt, 
        COUNT(CASE WHEN action = 'confirmed' THEN 1 END) AS confirmed 
    FROM joined 
    GROUP BY user_id 
), 
ratecte AS ( 
    SELECT  
        user_id,  
COALESCE(round(confirmed * 1.0 / NULLIF(timeoutt + confirmed, 0),2), 0) AS confirmation_rate 
    FROM Counts 
)
SELECT 
    user_id,  
    confirmation_rate 
FROM ratecte;

