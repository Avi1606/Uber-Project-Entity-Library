-- Hibernate sequence table (used by GenerationType.TABLE in BaseModel)
CREATE TABLE IF NOT EXISTS hibernate_sequences (
    sequence_name VARCHAR(255) NOT NULL PRIMARY KEY,
    next_val BIGINT
);

INSERT INTO hibernate_sequences (sequence_name, next_val) VALUES ('default', 1);

-- Passenger Table
CREATE TABLE IF NOT EXISTS passenger (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phonenumber VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

-- Driver Table
CREATE TABLE IF NOT EXISTS driver (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255),
    license_number VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

-- Booking Table
CREATE TABLE IF NOT EXISTS booking (
    id BIGINT PRIMARY KEY,
    booking_status VARCHAR(50),
    pickup_time TIMESTAMP,
    drop_off_time TIMESTAMP,
    total_distance INTEGER,
    driver_id BIGINT REFERENCES driver(id),
    passenger_id BIGINT REFERENCES passenger(id),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);
