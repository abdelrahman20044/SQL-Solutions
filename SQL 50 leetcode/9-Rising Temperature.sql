
select distinct x.id as Id from Weather x , Weather y 
where x.temperature > y.temperature and x.recordDate = DATEADD(DAY, 1, y.recordDate)

select id as Id  from
(select lag(temperature ) over(order by recordDate ) as prev , * from Weather ) as newtable 
where  temperature   > prev   
