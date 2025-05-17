CREATE TABLE Users(
  user_id  INT UNIQUE PRIMARY KEY
  first_name VAR CHAR (100) NOT NULL
  last_name VAR CHAR (100)  NOT NULL
  email VAR CHAR(100) UNIQUE NOT NULL 
  password_hash VAR CHAR(100) NOT NULL 
  phone_number INT 
  role ENUM('host', 'guest', 'admin') DEFAULT 'guest' 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE Property(
  property_id INT UNIQUE PRIMARY KEY 
  host_id INT UNIQUE NOT NULL
  name VAR CHAR(100) NOT NULL
  description TEXT NOT NULL
  location VAR CHAR(255) NOT NULL
  price_per_night DECIMAL(10, 2) NOT NULL
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  FOREIGN KEY (host_id) REFERENCES Users(user_id)
);
CREATE Booking(
  booking_id INT UNIQUE PRIMARY KEY
  property_id INT UNIQUE NOT NULL
  user_id INT UNIQUE NOT NULL
  start_date DATE NOT NULL
  end_date DATE NOT NULL
  status ENUM('pending', 'confirmed', 'cancelled') NOT NULL
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  FOREIGN KEY (property_id) REFERENCES Property(property_id)
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE Payment(
  payment_id INT UNIQUE PRIMARY KEY
  booking_id INT UNIQUE NOT NULL
  amount DECIMAL(10, 2) NOT NULL
  payment_date TIMESTAMP DEFAULT CURRENT TIMESTAMP
  payment_method ENUM('credit/Debit'. 'online payment', 'digital wallets','mobile money') NOT NULL
  FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
  );
CREATE Review(
  review_id INT UNIQUE PRIMARY KEY
  property_id INT UNIQUE NOT NULL
  user_id INT UNIQUE NOT NULL
  rating INT NOT NULL CHECK (rating =>1 AND rating=<10)
  comment TEXT NOT NULL
  created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP
  FOREIGN KEY (property_id) REFERENCES Property(property_id)
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE property(
  message_id INT UNIQUE PRIMARY KEY
  sender_id INT UNIQUE NOT NULL
  recipient_id INT UNIQUE NOT NULL
  message_body TEXT NOT NULL
  sent_at TIMESTAMP DEFAULT CURRENT TIMESTAMP
  FOREIGN KEY (sender_id) REFERENCES Users(user_id)
  FOREIGN KEY (recipient_id) REFERENCES Users(user_id)
);
  
