SELECT property_id, rating
FROM Reviews
WHERE rating >(
  SELECT AVG(rating)
  FROM Reviews
) 
AND (
  SELECT AVG(rating)
  FROM Reviews
) > 4.0;

SELECT user_id, booking_id
FROM Bookings
WHERE user_id IN (
  SELECT user_id
  FROM Bookings
  GROUP BY user_id
  HAVING COUNT(*) > 3
);
