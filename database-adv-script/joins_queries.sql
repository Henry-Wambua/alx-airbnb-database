SELECT booking_id, user_id
FROM Bookings
INNER JOIN Users
ON Bookings.user_id = Users.user_id;

SELECT property_id, review_id
FROM Property
LEFT JOIN Reviews
ON Reviews.property_id = Property.property_id
ORDER BY property_id [ASC];

SELECT user_id, booking_id
FROM Users
FULL OUTER JOIN Bookings
ON Bookings.user_id = Users.user_id;
