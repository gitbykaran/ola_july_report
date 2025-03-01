-- Retrieve all successful bookings

CREATE VIEW Successful_Bookings AS 
SELECT * FROM ola_july 
WHERE Booking_Status = 'Success';

-- Find the average ride distance for each vehicle type:

CREATE VIEW AvgRideDist_Per_Vehichle AS 
SELECT
Vehicle_Type,
AVG(Ride_Distance) AS avg_dist
FROM ola_july
GROUP BY Vehicle_Type;

-- Get the total number of cancelled rides by customers: 

CREATE VIEW Total_Cancelled_Rides_By_Customers AS 
SELECT 
COUNT(Canceled_Rides_by_Customer) cnt
FROM 
ola_july;


-- List the top 5 customers who booked the highest number of rides:

CREATE VIEW Top5_Customers_Rides_Booked AS 
SELECT 
Customer_ID,
COUNT(Booking_ID)
FROM ola_july
GROUP BY Customer_ID
ORDER BY COUNT(Booking_ID) DESC
LIMIT 5 ;

--  Get the number of rides cancelled by drivers due to personal and car-related issues:

CREATE VIEW Rides_Cancelled_By_Drivers  AS 
SELECT 
COUNT(*) AS cnt
FROM ola_july
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- Find the maximum and minimum driver ratings for Prime Sedan bookings:

CREATE VIEW Prime_Sedan_Ratings AS 
SELECT 
MAX(Driver_Ratings) AS max,
MIN(Driver_Ratings) AS min
FROM ola_july
WHERE Vehicle_Type = 'Prime Sedan';


-- Retrieve all rides where payment was made using UPI:

CREATE VIEW Payment_UPI AS 
SELECT *
FROM ola_july
WHERE Payment_Method = 'UPI' ;


-- Find the average customer rating per vehicle type:

CREATE VIEW Rating_Vehicle_Type AS
SELECT 
Vehicle_Type,
ROUND(AVG(Customer_Rating),2) AS avg_rating
FROM ola_july
GROUP BY Vehicle_Type;


-- Calculate the total booking value of rides completed successfully:

CREATE VIEW Total_Booking_Value_Successful AS 
SELECT 
SUM(Booking_Value) AS total_booking_val
FROM ola_july 
WHERE Booking_Status = 'Success';


-- List all incomplete rides along with the reason: 

CREATE VIEW Incomplete_Rides_Reason AS 
SELECT 
Customer_ID,
Booking_ID,
Incomplete_Rides_Reason
FROM ola_july
WHERE Incomplete_Rides = 'Yes';


