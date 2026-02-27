

CREATE TABLE car
(
    id           BIGINT                      NOT NULL,
    created_at   TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    updated_at   TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    plate_number VARCHAR(255),
    brand        VARCHAR(255),
    model        VARCHAR(255),
    cartype      anyenum('XL','SUV','COMPACT'),
    driver_id    BIGINT,
    colour_id    BIGINT,
    CONSTRAINT pk_car PRIMARY KEY (id)
);

CREATE TABLE colour
(
    id         BIGINT                      NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    name       VARCHAR(255)                NOT NULL,
    CONSTRAINT pk_colour PRIMARY KEY (id)
);


ALTER TABLE colour
    ADD CONSTRAINT uc_colour_name UNIQUE (name);

ALTER TABLE car
    ADD CONSTRAINT FK_CAR_ON_COLOUR FOREIGN KEY (colour_id) REFERENCES colour (id);

ALTER TABLE car
    ADD CONSTRAINT FK_CAR_ON_DRIVER FOREIGN KEY (driver_id) REFERENCES driver (id);
