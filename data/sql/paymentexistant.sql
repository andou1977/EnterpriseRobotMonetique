select p.id, p.amount,p.status,t.amount,t.status
from payment p
left join transaction t on t.payment_id = p.id
where t.id is null
