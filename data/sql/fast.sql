select * from transaction where timestampdiff(SECOND, start_time,end_time) < 2
