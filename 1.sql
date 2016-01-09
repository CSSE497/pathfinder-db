
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


ALTER TABLE commodity_id_seq OWNER TO pathfinderwebserver;


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


ALTER TABLE ONLY vehicle ALTER COLUMN id SET DEFAULT nextval('vehicle_id_seq'::regclass);

SELECT pg_catalog.setval('cluster_id_seq', 1, false);

SELECT pg_catalog.setval('commodity_id_seq', 1, false);

SELECT pg_catalog.setval('vehicle_id_seq', 1, false);


ALTER TABLE ONLY cluster
    ADD CONSTRAINT pk_cluster PRIMARY KEY (id);


ALTER TABLE ONLY commodity
    ADD CONSTRAINT pk_commodity PRIMARY KEY (id);


ALTER TABLE ONLY vehicle
    ADD CONSTRAINT pk_vehicle PRIMARY KEY (id);


CREATE INDEX ix_cluster_parent_id ON cluster USING btree (parent_id);


CREATE INDEX ix_commodity_cluster_id ON commodity USING btree (cluster_id);


CREATE INDEX ix_vehicle_cluster_id ON vehicle USING btree (cluster_id);


ALTER TABLE ONLY cluster
    ADD CONSTRAINT fk_cluster_parent_id FOREIGN KEY (parent_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


ALTER TABLE ONLY commodity
    ADD CONSTRAINT fk_commodity_cluster_id FOREIGN KEY (cluster_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


ALTER TABLE ONLY vehicle
    ADD CONSTRAINT fk_vehicle_cluster_id FOREIGN KEY (cluster_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


create table application (
  id                        varchar(255) not null,
  name                      varchar(255) not null,
  customer_email            varchar(255),
  cluster_id                bigint not null,
  objective_function_id     varchar(255) not null,
  constraint pk_application primary key (id))
;

create table capacity_parameter (
  id                        bigserial not null,
  application_id            varchar(255) not null,
  parameter                 varchar(255) not null,
  constraint pk_capacity_parameter primary key (id))
;

create table customer (
  email                     varchar(255) not null,
  password                  varchar(255) not null,
  constraint pk_customer primary key (email))
;

create table objective_function (
  id                        varchar(255) not null,
  function                  varchar(255),
  constraint pk_objective_function primary key (id))
;

create table objective_parameter (
  id                        bigserial not null,
  application_id            varchar(255) not null,
  parameter                 varchar(255) not null,
  constraint pk_objective_parameter primary key (id))
;

alter table application add constraint fk_application_customer_1 foreign key (customer_email) references customer (email);
create index ix_application_customer_1 on application (customer_email);
alter table application add constraint fk_application_objectiveFuncti_2 foreign key (objective_function_id) references objective_function (id);
create index ix_application_objectiveFuncti_2 on application (objective_function_id);
alter table capacity_parameter add constraint fk_capacity_parameter_applicat_3 foreign key (application_id) references application (id);
create index ix_capacity_parameter_applicat_3 on capacity_parameter (application_id);
alter table objective_parameter add constraint fk_objective_parameter_applica_4 foreign key (application_id) references application (id);
create index ix_objective_parameter_applica_4 on objective_parameter (application_id);



# --- !Downs

alter table cluster drop constraint if exists fk_cluster_parent_id;
drop index if exists ix_cluster_parent_id;

alter table commodity drop constraint if exists fk_commodity_cluster_id;
drop index if exists ix_commodity_cluster_id;

alter table vehicle drop constraint if exists fk_vehicle_cluster_id;
drop index if exists ix_vehicle_cluster_id;

drop table if exists cluster;

drop table if exists commodity;

drop table if exists vehicle;

drop table if exists application cascade;

drop table if exists capacity_parameter cascade;

drop table if exists customer cascade;

drop table if exists objective_function cascade;

drop table if exists objective_parameter cascade;
