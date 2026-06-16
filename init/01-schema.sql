CREATE TABLE IF NOT EXISTS stations (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  code VARCHAR(5) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS tickets (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  train_number VARCHAR(20),
  train_type VARCHAR(20),
  source_station_id INT NOT NULL REFERENCES stations(id),
  destination_station_id INT NOT NULL REFERENCES stations(id),
  departure_date DATE NOT NULL,
  departure_time TIME NOT NULL,
  customer_first_name VARCHAR(100) NOT NULL,
  customer_last_name VARCHAR(100) NOT NULL,
  customer_email VARCHAR(255) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
