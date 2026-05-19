SELECT * FROM ride_data
LIMIT 10;

--1. Retrieve all successful bookings:
SELECT * FROM ride_data
WHERE booking_status = 'Success';

--2. Find the average ride distance for each vehicle type:
SELECT vehicle_type, ROUND(AVG(ride_distance)::numeric, 2) AS avg_distance
FROM ride_data
GROUP BY vehicle_type;

--3. Get the total number of cancelled rides by customers:
SELECT COUNT(*) AS cancelled_by_customer FROM ride_data
WHERE booking_status = 'Cancelled by Customer';

--4. List the top 5 customers who booked the highest number of rides:
SELECT customer_id, COUNT(booking_id) as total_rides
FROM ride_data
GROUP BY customer_id
ORDER BY total_rides DESC LIMIT 5;

--5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT COUNT(*) AS cancelled_rides_by_driver
FROM ride_data
WHERE cancelled_rides_by_driver = 'Yes'
AND reason_for_cancelling_by_driver = 'Personal & Car related issues';

--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MAX(driver_ratings) as max_rating,
MIN(driver_ratings) as min_rating
FROM ride_data WHERE vehicle_type = 'Prime Sedan';

--7. Retrieve all rides where payment was made using UPI:
SELECT * FROM ride_data
WHERE payment_method = 'UPI';

--8. Find the average customer rating per vehicle type:
SELECT vehicle_type, ROUND(AVG(customer_rating)::numeric, 2) as avg_customer_rating
FROM ride_data
GROUP BY vehicle_type;

--9. Calculate the total booking value of rides completed successfully:
SELECT ROUND(SUM(booking_value)::numeric, 2) as total_successful_ride_value
FROM ride_data
WHERE booking_status = 'Success';

--10. List all incomplete rides along with the reason:
SELECT booking_id, incomplete_rides_reason
FROM ride_data
WHERE incomplete_rides = 'Yes';