# Table Locations
select * from locations;

#Table make_details
select * from make_details;

#Table stolen_vehicles
select * from stolen_vehicles;

#What day of the week are vehicles most often and least often stolen?
select day_stolen,
count(day_stolen) as oftenstolen_day
from stolen_vehicles 
group by day_stolen 
order by oftenstolen_day;

#What types of vehicles are most often and least often stolen? Does this vary by region?
select s.vehicle_desc,
s.color,
s.vehicle_type,
s.location_id,
l.region,
count(s.vehicle_type) as oftenstolen_vehicle
from stolen_vehicles s
inner join locations l on
s.location_id = l.﻿location_id
group by vehicle_desc,color,vehicle_type,location_id,region
order by oftenstolen_vehicle desc ;

#What is the average age of the vehicles that are stolen? Does this vary based on the vehicle type? 
select vehicle_type,
vehicle_desc,
color,
round(avg(vehicle_age)) as age
from stolen_vehicles 
group by vehicle_desc,vehicle_type,color
order by age ;

#Which regions have the most and least number of stolen vehicles? What are the characteristics of the regions? 
select s.vehicle_type,
s.vehicle_desc,
s.color,
count(vehicle_type) as No_stolenvechicle,
s.location_id,
l.region,
l.country,
l.population,
l.density
from stolen_vehicles  s join locations l on
s.location_id = l.﻿location_id
group by vehicle_type,vehicle_desc,s.color,s.location_id,l.region,l.country,l.population,l.density
order by  No_stolenvechicle desc;











 
