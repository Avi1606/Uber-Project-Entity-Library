-- Drop old review_id column from booking if exists
ALTER TABLE booking
    DROP COLUMN IF EXISTS review_id;

-- Add start and end location FK columns to booking
ALTER TABLE booking
    ADD COLUMN IF NOT EXISTS start_location_id BIGINT;

ALTER TABLE booking
    ADD COLUMN IF NOT EXISTS end_location_id BIGINT;

ALTER TABLE booking
    DROP CONSTRAINT IF EXISTS FK_BOOKING_ON_STARTLOCATION;

ALTER TABLE booking
    ADD CONSTRAINT FK_BOOKING_ON_STARTLOCATION FOREIGN KEY (start_location_id) REFERENCES exact_location (id);

ALTER TABLE booking
    DROP CONSTRAINT IF EXISTS FK_BOOKING_ON_ENDLOCATION;

ALTER TABLE booking
    ADD CONSTRAINT FK_BOOKING_ON_ENDLOCATION FOREIGN KEY (end_location_id) REFERENCES exact_location (id);

-- Create Review parent table (JOINED inheritance base)
CREATE TABLE IF NOT EXISTS bookingreview
(
    id         BIGINT                      NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    content    VARCHAR(255),
    rating     DOUBLE PRECISION,
    CONSTRAINT pk_bookingreview PRIMARY KEY (id)
);

-- Create PassangerReview child table (JOINED inheritance child)
CREATE TABLE IF NOT EXISTS passanger_review
(
    id             BIGINT NOT NULL,
    passenger_name VARCHAR(255),
    CONSTRAINT pk_passangerreview PRIMARY KEY (id),
    CONSTRAINT FK_PASSANGERREVIEW_ON_BOOKINGREVIEW FOREIGN KEY (id) REFERENCES bookingreview (id)
);

-- Add new columns to Driver
ALTER TABLE driver
    ADD COLUMN IF NOT EXISTS active_city VARCHAR(255);

ALTER TABLE driver
    ADD COLUMN IF NOT EXISTS driver_approval_status VARCHAR(255);

ALTER TABLE driver
    ADD COLUMN IF NOT EXISTS home_id BIGINT;

ALTER TABLE driver
    ADD COLUMN IF NOT EXISTS last_known_location_id BIGINT;

ALTER TABLE driver
    ADD COLUMN IF NOT EXISTS rating DOUBLE PRECISION NOT NULL DEFAULT 0.0;

-- Add Driver FK constraints
ALTER TABLE driver
    DROP CONSTRAINT IF EXISTS FK_DRIVER_ON_HOME;

ALTER TABLE driver
    ADD CONSTRAINT FK_DRIVER_ON_HOME FOREIGN KEY (home_id) REFERENCES exact_location (id);

ALTER TABLE driver
    DROP CONSTRAINT IF EXISTS FK_DRIVER_ON_LASTKNOWNLOCATION;

ALTER TABLE driver
    ADD CONSTRAINT FK_DRIVER_ON_LASTKNOWNLOCATION FOREIGN KEY (last_known_location_id) REFERENCES exact_location (id);

-- Drop hibernate_sequences (no longer needed)
DROP TABLE IF EXISTS hibernate_sequences CASCADE;
