-- my sol
with NewTable as (
select visit_id , customer_id 
from Visits
WHERE visit_id NOT IN (SELECT visit_id FROM Transactions )
) select customer_id , count(visit_id ) as count_no_trans from NewTable group by customer_id 


-- leetcode sol 
SELECT 
  customer_id, 
  COUNT(*) AS count_no_trans 
FROM 
  Visits AS v 
  LEFT JOIN Transactions AS t ON v.visit_id = t.visit_id 
WHERE 
  t.visit_id IS NULL 
GROUP BY 
  customer_id
