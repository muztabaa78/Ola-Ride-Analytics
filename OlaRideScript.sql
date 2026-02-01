SELECT * FROM ola.bookings;

1.Retrieve all successful bookings.
Create view successful_Booking As
select * From ola.bookings
Where Booking_Status = 'Success';
Select * From successful_Booking

2. Find the average ride distance for each vehicle type
CREATE OR REPLACE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM ola.bookings
GROUP BY Vehicle_Type;
Select * From ride_distance_for_each_vehicle;

3. Get the total number of cancelled rides by customers
Create view cancelled_rides_by_customers
SELECT COUNT(*)
FROM ola.bookings
WHERE booking_status = 'Canceled by Customer';
Select * From cancelled_rides_by_customers

4. List the top 5 customers who booked the highest number of rides
Create view top_5_customers As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides 
FROM bookings GROUP BY Customer_ID 
ORDER BY total_rides DESC LIMIT 5;
Select * From top_5_customers;

5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create view rides_cancelled_by_drivers As
SELECT COUNT(*)
FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
Select * From rides_cancelled_by_drivers

6.Find the maximum and minimum driver ratings for Prime Sedan bookings
Create view maximum_and_minimum_driver_ratings As
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating 
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';
Select * From maximum_and_minimum_driver_ratings

7.Retrieve all rides where payment was made using UPI:
Create view rides_where_payment_made_using_UPI As
SELECT * FROM bookings 
WHERE Payment_Method = 'UPI';
Select * From rides_where_payment_made_using_UPI

8.Find the average customer rating per vehicle type: 
Create view average_customer_rating_per_vehicle_type As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating 
FROM bookings GROUP BY Vehicle_Type;
Select * From average_customer_rating_per_vehicle_type

9.Calculate the total booking value of rides completed successfully:
Create view total_booking_value_of_rides_completed As
SELECT SUM(Booking_Value) as total_successful_value
FROM bookings 
WHERE Booking_Status = 'Success';
Select * From total_booking_value_of_rides_completed

10.List all incomplete rides along with the reason: 
Create view incomplete_rides As
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookings WHERE Incomplete_Rides = 'Yes';
Select* From incomplete_rides
