SELECT user_id, COUNT(*)
FROM Bookings
GROUP BY user_id;

SELECT property_id, booking_id,
       RANK () OVER(ORDER BY booking_count DESC) AS Ranking
       ROW_NUMBER () OVER(ORDER BY booking_count DESC) AS Row_count
FROM 
(SELECT property_id, COUNT (*) AS booking_count
FROM Bookings
GROUP BY property_id);



