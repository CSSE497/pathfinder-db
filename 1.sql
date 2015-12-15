
# --- !Ups


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

CREATE TABLE cluster (
    id bigint NOT NULL,
    parent_id bigint,
    authentication_token bytea
);


ALTER TABLE cluster OWNER TO pathfinderwebserver;


CREATE SEQUENCE cluster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cluster_id_seq OWNER TO pathfinderwebserver;


ALTER SEQUENCE cluster_id_seq OWNED BY cluster.id;


CREATE TABLE commodity (
    id bigint NOT NULL,
    startlatitude double precision NOT NULL,
    startlongitude double precision NOT NULL,
    endlatitude double precision NOT NULL,
    endlongitude double precision NOT NULL,
    status integer NOT NULL,
    metadata json,
    cluster_id bigint,
    CONSTRAINT ck_commodity_status CHECK ((status = ANY (ARRAY[3, 0, 1, 4, 2])))
);


ALTER TABLE commodity OWNER TO pathfinderwebserver;

CREATE SEQUENCE commodity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE commodity_id_seq OWNER TO pathfinderwebserver;

ALTER SEQUENCE commodity_id_seq OWNED BY commodity.id;


CREATE TABLE pathfinder_application (
    id uuid NOT NULL,
    name character varying(255),
    token bytea,
    cluster_id bigint
);


ALTER TABLE pathfinder_application OWNER TO pathfinderwebserver;

CREATE TABLE pathfinder_user (
    username character varying(255) NOT NULL,
    password character varrying(255) NOT NULL,
    user_token bytea NOT NULL
);


ALTER TABLE pathfinder_user OWNER TO pathfinderwebserver;

CREATE SEQUENCE pathfinder_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE commodity_id_seq OWNER TO pathfinderwebserver;

ALTER SEQUENCE commodity_id_seq OWNED BY pathfinder_user.id;


CREATE TABLE vehicle (
    id bigint NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    cluster_id bigint,
    status integer NOT NULL,
    metadata json,
    CONSTRAINT ck_vehicle_status CHECK ((status = ANY (ARRAY[0, 1])))
);


ALTER TABLE vehicle OWNER TO pathfinderwebserver;

CREATE SEQUENCE vehicle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehicle_id_seq OWNER TO pathfinderwebserver;

ALTER SEQUENCE vehicle_id_seq OWNED BY vehicle.id;


ALTER TABLE ONLY cluster ALTER COLUMN id SET DEFAULT nextval('cluster_id_seq'::regclass);


ALTER TABLE ONLY commodity ALTER COLUMN id SET DEFAULT nextval('commodity_id_seq'::regclass);


ALTER TABLE ONLY pathfinder_user ALTER COLUMN id set DEFAULT nextval('pathfinder_user_id_seq'::regclass);


ALTER TABLE ONLY vehicle ALTER COLUMN id SET DEFAULT nextval('vehicle_id_seq'::regclass);


SELECT pg_catalog.setval('cluster_id_seq', 1, false);

SELECT pg_catalog.setval('commodity_id_seq', 1, false);

SELECT pg_catalog.setval('pathfinder_user_id_seq', 1, false);

SELECT pg_catalog.setval('vehicle_id_seq', 1, false);


ALTER TABLE ONLY cluster
    ADD CONSTRAINT pk_cluster PRIMARY KEY (id);


ALTER TABLE ONLY commodity
    ADD CONSTRAINT pk_commodity PRIMARY KEY (id);


ALTER TABLE ONLY pathfinder_application
    ADD CONSTRAINT pk_pathfinder_application PRIMARY KEY (id);

ALTER TABLE ONLY pathfinder_user
    ADD CONSTRAINT pk_pathfinder_user PRIMARY KEY (id);

ALTER TABLE ONLY vehicle
    ADD CONSTRAINT pk_vehicle PRIMARY KEY (id);


CREATE INDEX ix_cluster_parent_id ON cluster USING btree (parent_id);


CREATE INDEX ix_commodity_cluster_id ON commodity USING btree (cluster_id);


CREATE INDEX ix_pathfinder_application_cluster_id ON pathfinder_application USING btree (cluster_id);


CREATE INDEX ix_vehicle_cluster_id ON vehicle USING btree (cluster_id);



ALTER TABLE ONLY cluster
    ADD CONSTRAINT fk_cluster_parent_id FOREIGN KEY (parent_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


ALTER TABLE ONLY commodity
    ADD CONSTRAINT fk_commodity_cluster_id FOREIGN KEY (cluster_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


ALTER TABLE ONLY pathfinder_application
    ADD CONSTRAINT fk_pathfinder_application_cluster_id FOREIGN KEY (cluster_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


ALTER TABLE ONLY vehicle
    ADD CONSTRAINT fk_vehicle_cluster_id FOREIGN KEY (cluster_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


# --- !Downs

alter table cluster drop constraint if exists fk_cluster_parent_id;
drop index if exists ix_cluster_parent_id;

alter table commodity drop constraint if exists fk_commodity_cluster_id;
drop index if exists ix_commodity_cluster_id;

alter table pathfinder_application drop constraint if exists fk_pathfinder_application_cluster_id;
drop index if exists ix_pathfinder_application_cluster_id;

alter table vehicle drop constraint if exists fk_vehicle_cluster_id;
drop index if exists ix_vehicle_cluster_id;

drop table if exists cluster;

drop table if exists commodity;

drop table if exists pathfinder_application;

drop table if exists pathfinder_user;

drop table if exists vehicle;

