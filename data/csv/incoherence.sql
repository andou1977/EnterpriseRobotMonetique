select p.status,s.amount
from payment p
join settlement s on p.id=s.payment_id
where s.amount=0 and p.status='SUCCESS'