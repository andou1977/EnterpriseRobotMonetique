SELECT id, start_time, end_time,
TIMESTAMPDIFF(SECOND, start_time, end_time) AS duration
FROM TRANSACTION
WHERE TIMESTAMPDIFF(SECOND, start_time, end_time) > 2;