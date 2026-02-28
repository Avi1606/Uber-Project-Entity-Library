ALTER TABLE booking
    DROP CONSTRAINT fkei2mjigb4hb2sm4htt6jhwn6;

CREATE TABLE dbconsole
(
    id         BIGINT                      NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    name       VARCHAR(255)                NOT NULL,
    value      VARCHAR(255),
    CONSTRAINT pk_dbconsole PRIMARY KEY (id)
);

CREATE TABLE exact_location
(
    id         BIGINT                      NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    latitude   DOUBLE PRECISION            NOT NULL,
    longitude  DOUBLE PRECISION            NOT NULL,
    CONSTRAINT pk_exactlocation PRIMARY KEY (id)
);

CREATE TABLE name_location
(
    id                BIGINT                      NOT NULL,
    created_at        TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    updated_at        TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    exact_location_id BIGINT,
    name              VARCHAR(255),
    zipcode           VARCHAR(255),
    city              VARCHAR(255),
    country           VARCHAR(255),
    state             VARCHAR(255),
    CONSTRAINT pk_namelocation PRIMARY KEY (id)
);

CREATE TABLE otp
(
    id          BIGINT                      NOT NULL,
    created_at  TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    updated_at  TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    code        VARCHAR(255),
    sent_number VARCHAR(255),
    CONSTRAINT pk_otp PRIMARY KEY (id)
);

ALTER TABLE driver
    ADD active_city VARCHAR(255);

ALTER TABLE driver
    ADD driver_approval_status VARCHAR(255);

ALTER TABLE driver
    ADD home_id BIGINT;

ALTER TABLE driver
    ADD last_known_location_id BIGINT;

ALTER TABLE driver
    ADD rating DOUBLE PRECISION;

ALTER TABLE passanger_review
    ADD passenger_name VARCHAR(255);

ALTER TABLE driver
    ALTER COLUMN rating SET NOT NULL;

ALTER TABLE dbconsole
    ADD CONSTRAINT uc_dbconsole_name UNIQUE (name);

ALTER TABLE driver
    ADD CONSTRAINT FK_DRIVER_ON_HOME FOREIGN KEY (home_id) REFERENCES exact_location (id);

ALTER TABLE driver
    ADD CONSTRAINT FK_DRIVER_ON_LASTKNOWNLOCATION FOREIGN KEY (last_known_location_id) REFERENCES exact_location (id);

ALTER TABLE name_location
    ADD CONSTRAINT FK_NAMELOCATION_ON_EXACTLOCATION FOREIGN KEY (exact_location_id) REFERENCES exact_location (id);

DROP TABLE hibernate_sequences CASCADE;

ALTER TABLE passanger_review
    DROP COLUMN passanger_name;

ALTER TABLE booking
    DROP COLUMN review_id;