select p.id,p.status,p.amount,s.amount, t.amount, t.status
from payment p
join settlement s on p.id=s.payment_id
join transaction t on p.id=t.payment_id
where t.status='SUCCESS' and  s.amount>0
and p.amount <> s.amount or p.amount <> t.amount