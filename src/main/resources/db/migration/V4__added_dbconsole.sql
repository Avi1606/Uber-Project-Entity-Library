
CREATE TABLE dbconsole
(
    id         BIGINT                      NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    name       VARCHAR(255)                NOT NULL,
    value      VARCHAR(255),
    CONSTRAINT pk_dbconsole PRIMARY KEY (id)
);

ALTER TABLE dbconsole
    ADD CONSTRAINT uc_dbconsole_name UNIQUE (name);
