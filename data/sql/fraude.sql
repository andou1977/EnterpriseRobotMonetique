select card_number, count(*) as nb
from payment
group by card_number
having count(*) > 1
