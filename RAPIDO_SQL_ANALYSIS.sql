CREATE DATABASE rapido_project2;
USE rapido_project2;

CREATE TABLE rapido_data (
    services VARCHAR(20),
    date DATE,
    ride_time TIME,
    ride_status VARCHAR(20),
    source VARCHAR(100),
    destination VARCHAR(100),
    duration INT,
    ride_id VARCHAR(30),
    distance FLOAT,
    ride_charge FLOAT,
    misc_charge FLOAT,
    total_fare FLOAT,
    payment_method VARCHAR(30),
    duration_seconds FLOAT
);
select count(ride_id)
from rapido_data;
SELECT COUNT(*) AS total_rides FROM rapido_data;

select date, count(ride_status) as rides
from rapido_data
group by date
order by date;

select round(sum(total_fare), 2) AS total_revenue
from rapido_data;

select round(avg(total_fare), 2) as avg_fare 
FROM rapido_data;

select payment_method , count(*) as usage_count
from rapido_data
group by payment_method
order by usage_count;

select source , count(*) as ride_count 
from rapido_data
group by source
order by ride_count desc
limit 5;

SELECT distance, total_fare FROM rapido_data;

select round(avg(duration_seconds)/60, 2) as avg_duration
from rapido_data;

select services , round(sum(total_fare),2) as total_revenue
from rapido_data
group by services
order by total_revenue desc;

select source , destination , count(*) as trip_count
from rapido_data
group by source, destination
having trip_count>1
order by trip_count desc;

SELECT DAYNAME(date) AS weekday, round(SUM(total_fare),2) AS total_revenue
FROM rapido_data
GROUP BY weekday
ORDER BY FIELD(weekday, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');


select * from rapido_data;
