with NewTable as (
select visit_id , customer_id 
from Visits
WHERE visit_id NOT IN (SELECT visit_id FROM Transactions )
) select customer_id , count(visit_id ) as count_no_trans from NewTable group by customer_id 
