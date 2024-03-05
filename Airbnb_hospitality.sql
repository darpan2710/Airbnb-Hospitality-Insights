show databases;
use airbnb_hospitality;
show tables;
select* from booking_details;
select * from listings;

#Q1 Write a query to fetch total listing_id from the booking_details table
select count(listing_id) from booking_details;

#Q2 Write a query to show id , availability_365 and all availability_365 values greater than 300
select listing_id,availability_365 from booking_details where availability_365>300;

#Q3 Write a query to show host name and price 
select listings.host_name, booking_details.price from listings inner join booking_details
on listings.id = booking_details.listing_id;

#Q4Write a query to show neighbourhood_group & minimum_nights spend
select l.neighbourhood_group, b.minimum_nights from listings l inner join booking_details b
on l.id =b.listing_id;

#Q5 Write a query to show maximum price by neighbourhood_group
select l.neighbourhood_group, max(b.price)max_price from listings l inner join booking_details b
on l.id = b.listing_id group by neighbourhood_group;

 #Q6 Write a query to show average price by room type but average price is less than 100
select l.room_type, avg(b.price)avg_price from listings l
inner join booking_details b on l.id = b.listing_id
group by l.room_type having avg_price <100; 

#Q7 Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group
select l.id,l.host_name,l.neighbourhood_group, b.price from
listings l inner join booking_details b on l.id=b.listing_id
where l.neighbourhood_group= "manhattan";

/*Q8 Write a query to find max price, average availability_365 for each
 room type and order in ascending by maximum price*/
 select l.room_type, max(b.price)max_price , avg(b.availability_365) avg_availability_365
 from listings l inner join booking_details b on l.id=b.listing_id
 group by l.room_type order by max_price asc;
 
 
 