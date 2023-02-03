SELECT DISTINCT s.subscriberkey,
                s.jobid,
                s.batchid,
                s.eventdate AS SendDate
FROM   _SENT AS s
       LEFT JOIN _Open o
              ON s.jobid = o.jobid
                 AND s.listid = o.listid
                 AND s.batchid = o.batchid
                 AND s.subscriberid = o.subscriberid
                 AND o.isunique = 1
        LEFT JOIN _Click c
              ON s.jobid = c.jobid
                 AND s.listid = c.listid
                 AND s.batchid = c.batchid
                 AND s.subscriberid = c.subscriberid
                 AND c.isunique = 1         
WHERE  o.subscriberid IS NULL or c.subscriberid IS NULL
