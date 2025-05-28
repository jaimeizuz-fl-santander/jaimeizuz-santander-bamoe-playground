CREATE ROLE "paas-user" WITH
    LOGIN
    SUPERUSER
    INHERIT
    CREATEDB
    CREATEROLE
    NOREPLICATION
    PASSWORD 'paas-pass';

CREATE DATABASE processpaas
    WITH
    OWNER = "paas-user"
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default;

GRANT ALL PRIVILEGES ON DATABASE postgres TO "paas-user";
GRANT ALL PRIVILEGES ON DATABASE processpaas TO "paas-user";
GRANT ALL PRIVILEGES ON DATABASE processpaas TO postgres;

CREATE TABLE pr_paas_access_point (
    id_access_point integer NOT NULL,
    pr_end_dt timestamp(6) without time zone,
    pr_modification_ts timestamp(6) without time zone,
    pr_start_ts timestamp(6) without time zone,
    pr_ap_app character varying(50),
    pr_ap_description character varying(256),
    pr_ap_device character varying(50),
    pr_ap_os character varying(50),
    pr_ap_type_user character varying(50),
    pr_creation_user character varying(256),
    pr_modification_user character varying(256),
    id_appian integer NOT NULL
);