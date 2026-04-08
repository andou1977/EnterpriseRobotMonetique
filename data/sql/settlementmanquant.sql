SELECT p.card_number,p.amount,p.status,s.payment_id,s.amount
from payment p
left join  settlement s on p.id=s.payment_id
where s.id is null