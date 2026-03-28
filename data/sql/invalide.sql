SELECT t.status,t.amount,p.amount,p.status
from transaction t
join payment p on t.payment_id=p.id
where t.status='FAILED' and P.status='SUCCESS'