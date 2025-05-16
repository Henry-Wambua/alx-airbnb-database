CREATE INDEX idx_User_user_id ON User(user_id)
CREATE INDEX idx_User_email ON User(email)
  
CREATE INDEX idx_Booking_user_id ON Booking(user_id)
CREATE INDEX idx_Booking_booking_id ON Booking(booking_id)
CREATE INDEX idx_Booking_property_id ON Booking(property_id)

CREATE INDEX idx_Property_property_id ON Property(property_id)
CREATE INDEX idx_Property_booking_id ON Property(booking_id)
CREATE INDEX idx_Property_user_id ON Property(user_id)

EXPLAIN ANALYZE 
SELECT booking_id, user_id 
FROM Booking 
INNER JOIN Users ON Booking.user_id = Users.user_id
