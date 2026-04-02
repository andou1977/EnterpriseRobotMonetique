SELECT p.card_number,p.amount,p.status,t.payment_id,t.amount,t.status
from payment p
join transaction t on p.id=t.payment_id
where p.amount <> t.amount