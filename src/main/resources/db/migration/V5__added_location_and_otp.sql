
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


ALTER TABLE name_location
    ADD CONSTRAINT FK_NAMELOCATION_ON_EXACTLOCATION FOREIGN KEY (exact_location_id) REFERENCES exact_location (id);
