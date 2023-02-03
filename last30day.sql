select s.subscriberkey,j.emailname,o.eventdate 
from _Open as o
inner join _Job as j
    on j.jobid=o.jobid
inner join _Sent as s
    on s.subscriberkey=o.subscriberkey
    and s.jobid=o.jobid
    and s.listid=o.listid
    and s.batchid=o.batchid
    and o.isunique=1
where datediff(day,o.eventdate,getdate()) between 0 and 30