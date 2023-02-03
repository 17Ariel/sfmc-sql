/*select subscriberkey,emailname,count(subscriberkey) as Total
from(
    select o.subscriberkey,j.emailname,count(o.subscriberkey) as counts,
    RANK() OVER (PARTITION BY o.subscriberkey ORDER BY COUNT(o.subscriberkey) DESC) AS ranks
    from _Open as o
    Left Join _Job as j 
        on j.jobid=o.jobid
    Left Join _Sent as s
    on  s.jobid = o.jobid
        AND s.listid = o.listid
        AND s.batchid = o.batchid
        AND s.subscriberid = o.subscriberid
        AND o.isunique = 1
    Group by o.subscriberkey,j.EmailName,count(subscriberkey)
) temp
where ranks=1*/

select subscriberkey,emailname,tab.total
from(
    select o.subscriberkey,j.emailname,count(o.subscriberkey) as total,
    RANK() OVER (PARTITION BY o.subscriberkey ORDER BY count(o.subscriberkey) DESC) AS ranks
    from _Open as o
    Left Join _Job as j 
        on j.jobid=o.jobid
    Left Join _Sent as s
    on  s.jobid = o.jobid
        AND s.listid = o.listid
        AND s.batchid = o.batchid
        AND s.subscriberid = o.subscriberid
        AND o.isunique = 1
    Group by o.subscriberkey,j.EmailName
) tab
where ranks=1


