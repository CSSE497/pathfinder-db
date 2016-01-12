drop schema public cascade;
create schema public;
--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: application; Type: TABLE; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE TABLE application (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    customer_email character varying(255),
    cluster_id bigint NOT NULL,
    objective_function_id character varying(255) NOT NULL
);


ALTER TABLE application OWNER TO pathfinderwebserver;

--
-- Name: capacity_parameter; Type: TABLE; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE TABLE capacity_parameter (
    id bigint NOT NULL,
    application_id character varying(255) NOT NULL,
    parameter character varying(255) NOT NULL
);


ALTER TABLE capacity_parameter OWNER TO pathfinderwebserver;

--
-- Name: capacity_parameter_id_seq; Type: SEQUENCE; Schema: public; Owner: pathfinderwebserver
--

CREATE SEQUENCE capacity_parameter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE capacity_parameter_id_seq OWNER TO pathfinderwebserver;

--
-- Name: capacity_parameter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pathfinderwebserver
--

ALTER SEQUENCE capacity_parameter_id_seq OWNED BY capacity_parameter.id;


--
-- Name: cluster; Type: TABLE; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE TABLE cluster (
    id bigint NOT NULL,
    parent_id bigint,
    authentication_token bytea
);


ALTER TABLE cluster OWNER TO pathfinderwebserver;

--
-- Name: cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: pathfinderwebserver
--

CREATE SEQUENCE cluster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cluster_id_seq OWNER TO pathfinderwebserver;

--
-- Name: cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pathfinderwebserver
--

ALTER SEQUENCE cluster_id_seq OWNED BY cluster.id;


--
-- Name: commodity; Type: TABLE; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

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

--
-- Name: commodity_id_seq; Type: SEQUENCE; Schema: public; Owner: pathfinderwebserver
--

CREATE SEQUENCE commodity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE commodity_id_seq OWNER TO pathfinderwebserver;

--
-- Name: commodity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pathfinderwebserver
--

ALTER SEQUENCE commodity_id_seq OWNED BY commodity.id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE TABLE customer (
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE customer OWNER TO pathfinderwebserver;

--
-- Name: objective_function; Type: TABLE; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE TABLE objective_function (
    id character varying(255) NOT NULL,
    function character varying(255)
);


ALTER TABLE objective_function OWNER TO pathfinderwebserver;

--
-- Name: objective_parameter; Type: TABLE; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE TABLE objective_parameter (
    id bigint NOT NULL,
    application_id character varying(255) NOT NULL,
    parameter character varying(255) NOT NULL
);


ALTER TABLE objective_parameter OWNER TO pathfinderwebserver;

--
-- Name: objective_parameter_id_seq; Type: SEQUENCE; Schema: public; Owner: pathfinderwebserver
--

CREATE SEQUENCE objective_parameter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE objective_parameter_id_seq OWNER TO pathfinderwebserver;

--
-- Name: objective_parameter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pathfinderwebserver
--

ALTER SEQUENCE objective_parameter_id_seq OWNED BY objective_parameter.id;


--
-- Name: play_evolutions; Type: TABLE; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE TABLE play_evolutions (
    id integer NOT NULL,
    hash character varying(255) NOT NULL,
    applied_at timestamp without time zone NOT NULL,
    apply_script text,
    revert_script text,
    state character varying(255),
    last_problem text
);


ALTER TABLE play_evolutions OWNER TO pathfinderwebserver;

--
-- Name: vehicle; Type: TABLE; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

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

--
-- Name: vehicle_id_seq; Type: SEQUENCE; Schema: public; Owner: pathfinderwebserver
--

CREATE SEQUENCE vehicle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehicle_id_seq OWNER TO pathfinderwebserver;

--
-- Name: vehicle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pathfinderwebserver
--

ALTER SEQUENCE vehicle_id_seq OWNED BY vehicle.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY capacity_parameter ALTER COLUMN id SET DEFAULT nextval('capacity_parameter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY cluster ALTER COLUMN id SET DEFAULT nextval('cluster_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY commodity ALTER COLUMN id SET DEFAULT nextval('commodity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY objective_parameter ALTER COLUMN id SET DEFAULT nextval('objective_parameter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY vehicle ALTER COLUMN id SET DEFAULT nextval('vehicle_id_seq'::regclass);


--
-- Data for Name: application; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY application (id, name, customer_email, cluster_id, objective_function_id) FROM stdin;
9869bd06-12ec-451f-8207-2c5f217eb4d0	Chimney Swap	adam@ajmichael.net	999	MIN_DIST
\.


--
-- Data for Name: capacity_parameter; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY capacity_parameter (id, application_id, parameter) FROM stdin;
\.


--
-- Name: capacity_parameter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('capacity_parameter_id_seq', 2, true);


--
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY cluster (id, parent_id, authentication_token) FROM stdin;
999	\N	\\x746f7020736563726574
\.


--
-- Name: cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('cluster_id_seq', 5, true);


--
-- Data for Name: commodity; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY commodity (id, startlatitude, startlongitude, endlatitude, endlongitude, status, metadata, cluster_id) FROM stdin;
1	39.3875000000000028	-87.1106000000000051	39.7160000000000011	-86.2964000000000055	0	{"capacity":1}	999
2	39.8019999999999996	-86.2789999999999964	41.5827999999999989	-87.3462999999999994	0	{"capacity":1}	999
4	42.5844000000000023	-88.4770000000000039	41.8534000000000006	-87.6518999999999977	0	{"capacity":1}	999
\.


--
-- Name: commodity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('commodity_id_seq', 1, false);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY customer (email, password) FROM stdin;
adam@ajmichael.net	password
\.


--
-- Data for Name: objective_function; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY objective_function (id, function) FROM stdin;
MIN_DIST	sum{distances[k1,k2]*x[k1,k2,i],k1=RA,k2=RA,i=VA}
MIN_TIME	sum{durations[k1,k2]*x[k1,k2,i],k1=RA,k2=RA,i=VA}
\.


--
-- Data for Name: objective_parameter; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY objective_parameter (id, application_id, parameter) FROM stdin;
\.


--
-- Name: objective_parameter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('objective_parameter_id_seq', 3, true);


--
-- Data for Name: play_evolutions; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY play_evolutions (id, hash, applied_at, apply_script, revert_script, state, last_problem) FROM stdin;
1	d32c4d0a542c9372608b715c0294c38aee975d9d	2016-01-09 00:00:00	SET search_path = public, pg_catalog;\n\nSET default_tablespace = '';\n\nSET default_with_oids = false;\n\nCREATE TABLE cluster (\nid bigint NOT NULL,\nparent_id bigint,\nauthentication_token bytea\n);\n\n\nALTER TABLE cluster OWNER TO pathfinderwebserver;\n\n\nCREATE SEQUENCE cluster_id_seq\nSTART WITH 1\nINCREMENT BY 1\nNO MINVALUE\nNO MAXVALUE\nCACHE 1;\n\n\nALTER TABLE cluster_id_seq OWNER TO pathfinderwebserver;\n\n\nALTER SEQUENCE cluster_id_seq OWNED BY cluster.id;\n\n\nCREATE TABLE commodity (\nid bigint NOT NULL,\nstartlatitude double precision NOT NULL,\nstartlongitude double precision NOT NULL,\nendlatitude double precision NOT NULL,\nendlongitude double precision NOT NULL,\nstatus integer NOT NULL,\nmetadata json,\ncluster_id bigint,\nCONSTRAINT ck_commodity_status CHECK ((status = ANY (ARRAY[3, 0, 1, 4, 2])))\n);\n\n\nALTER TABLE commodity OWNER TO pathfinderwebserver;\n\nCREATE SEQUENCE commodity_id_seq\nSTART WITH 1\nINCREMENT BY 1\nNO MINVALUE\nNO MAXVALUE\nCACHE 1;\n\n\nALTER TABLE commodity_id_seq OWNER TO pathfinderwebserver;\n\nALTER SEQUENCE commodity_id_seq OWNED BY commodity.id;\n\n\nALTER TABLE commodity_id_seq OWNER TO pathfinderwebserver;\n\n\nCREATE TABLE vehicle (\nid bigint NOT NULL,\nlatitude double precision NOT NULL,\nlongitude double precision NOT NULL,\ncluster_id bigint,\nstatus integer NOT NULL,\nmetadata json,\nCONSTRAINT ck_vehicle_status CHECK ((status = ANY (ARRAY[0, 1])))\n);\n\n\nALTER TABLE vehicle OWNER TO pathfinderwebserver;\n\nCREATE SEQUENCE vehicle_id_seq\nSTART WITH 1\nINCREMENT BY 1\nNO MINVALUE\nNO MAXVALUE\nCACHE 1;\n\n\nALTER TABLE vehicle_id_seq OWNER TO pathfinderwebserver;\n\nALTER SEQUENCE vehicle_id_seq OWNED BY vehicle.id;\n\n\nALTER TABLE ONLY cluster ALTER COLUMN id SET DEFAULT nextval('cluster_id_seq'::regclass);\n\n\nALTER TABLE ONLY commodity ALTER COLUMN id SET DEFAULT nextval('commodity_id_seq'::regclass);\n\n\nALTER TABLE ONLY vehicle ALTER COLUMN id SET DEFAULT nextval('vehicle_id_seq'::regclass);\n\nSELECT pg_catalog.setval('cluster_id_seq', 1, false);\n\nSELECT pg_catalog.setval('commodity_id_seq', 1, false);\n\nSELECT pg_catalog.setval('vehicle_id_seq', 1, false);\n\n\nALTER TABLE ONLY cluster\nADD CONSTRAINT pk_cluster PRIMARY KEY (id);\n\n\nALTER TABLE ONLY commodity\nADD CONSTRAINT pk_commodity PRIMARY KEY (id);\n\n\nALTER TABLE ONLY vehicle\nADD CONSTRAINT pk_vehicle PRIMARY KEY (id);\n\n\nCREATE INDEX ix_cluster_parent_id ON cluster USING btree (parent_id);\n\n\nCREATE INDEX ix_commodity_cluster_id ON commodity USING btree (cluster_id);\n\n\nCREATE INDEX ix_vehicle_cluster_id ON vehicle USING btree (cluster_id);\n\n\nALTER TABLE ONLY cluster\nADD CONSTRAINT fk_cluster_parent_id FOREIGN KEY (parent_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;\n\n\nALTER TABLE ONLY commodity\nADD CONSTRAINT fk_commodity_cluster_id FOREIGN KEY (cluster_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;\n\n\nALTER TABLE ONLY vehicle\nADD CONSTRAINT fk_vehicle_cluster_id FOREIGN KEY (cluster_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;\n\n\ncreate table application (\nid                        varchar(255) not null,\nname                      varchar(255) not null,\ncustomer_email            varchar(255),\ncluster_id                bigint not null,\nobjective_function_id     varchar(255) not null,\nconstraint pk_application primary key (id))\n;\n\ncreate table capacity_parameter (\nid                        bigserial not null,\napplication_id            varchar(255) not null,\nparameter                 varchar(255) not null,\nconstraint pk_capacity_parameter primary key (id))\n;\n\ncreate table customer (\nemail                     varchar(255) not null,\npassword                  varchar(255) not null,\nconstraint pk_customer primary key (email))\n;\n\ncreate table objective_function (\nid                        varchar(255) not null,\nfunction                  varchar(255),\nconstraint pk_objective_function primary key (id))\n;\n\ncreate table objective_parameter (\nid                        bigserial not null,\napplication_id            varchar(255) not null,\nparameter                 varchar(255) not null,\nconstraint pk_objective_parameter primary key (id))\n;\n\nalter table application add constraint fk_application_customer_1 foreign key (customer_email) references customer (email);\ncreate index ix_application_customer_1 on application (customer_email);\nalter table application add constraint fk_application_objectiveFuncti_2 foreign key (objective_function_id) references objective_function (id);\ncreate index ix_application_objectiveFuncti_2 on application (objective_function_id);\nalter table capacity_parameter add constraint fk_capacity_parameter_applicat_3 foreign key (application_id) references application (id);\ncreate index ix_capacity_parameter_applicat_3 on capacity_parameter (application_id);\nalter table objective_parameter add constraint fk_objective_parameter_applica_4 foreign key (application_id) references application (id);\ncreate index ix_objective_parameter_applica_4 on objective_parameter (application_id);	alter table cluster drop constraint if exists fk_cluster_parent_id;\ndrop index if exists ix_cluster_parent_id;\n\nalter table commodity drop constraint if exists fk_commodity_cluster_id;\ndrop index if exists ix_commodity_cluster_id;\n\nalter table vehicle drop constraint if exists fk_vehicle_cluster_id;\ndrop index if exists ix_vehicle_cluster_id;\n\ndrop table if exists cluster;\n\ndrop table if exists commodity;\n\ndrop table if exists vehicle;\n\ndrop table if exists application cascade;\n\ndrop table if exists capacity_parameter cascade;\n\ndrop table if exists customer cascade;\n\ndrop table if exists objective_function cascade;\n\ndrop table if exists objective_parameter cascade;	applied	
\.


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY vehicle (id, latitude, longitude, cluster_id, status, metadata) FROM stdin;
14	39.4437130820373483	-87.3394701071896975	999	1	{"capacity":1}
15	42.1863000000000028	-88.1088000000000022	999	1	{"capacity":1}
\.


--
-- Name: vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('vehicle_id_seq', 1, false);


--
-- Name: pk_application; Type: CONSTRAINT; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

ALTER TABLE ONLY application
    ADD CONSTRAINT pk_application PRIMARY KEY (id);


--
-- Name: pk_capacity_parameter; Type: CONSTRAINT; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

ALTER TABLE ONLY capacity_parameter
    ADD CONSTRAINT pk_capacity_parameter PRIMARY KEY (id);


--
-- Name: pk_cluster; Type: CONSTRAINT; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

ALTER TABLE ONLY cluster
    ADD CONSTRAINT pk_cluster PRIMARY KEY (id);


--
-- Name: pk_commodity; Type: CONSTRAINT; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

ALTER TABLE ONLY commodity
    ADD CONSTRAINT pk_commodity PRIMARY KEY (id);


--
-- Name: pk_customer; Type: CONSTRAINT; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT pk_customer PRIMARY KEY (email);


--
-- Name: pk_objective_function; Type: CONSTRAINT; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

ALTER TABLE ONLY objective_function
    ADD CONSTRAINT pk_objective_function PRIMARY KEY (id);


--
-- Name: pk_objective_parameter; Type: CONSTRAINT; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

ALTER TABLE ONLY objective_parameter
    ADD CONSTRAINT pk_objective_parameter PRIMARY KEY (id);


--
-- Name: pk_vehicle; Type: CONSTRAINT; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

ALTER TABLE ONLY vehicle
    ADD CONSTRAINT pk_vehicle PRIMARY KEY (id);


--
-- Name: play_evolutions_pkey; Type: CONSTRAINT; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

ALTER TABLE ONLY play_evolutions
    ADD CONSTRAINT play_evolutions_pkey PRIMARY KEY (id);


--
-- Name: ix_application_customer_1; Type: INDEX; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE INDEX ix_application_customer_1 ON application USING btree (customer_email);


--
-- Name: ix_application_objectivefuncti_2; Type: INDEX; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE INDEX ix_application_objectivefuncti_2 ON application USING btree (objective_function_id);


--
-- Name: ix_capacity_parameter_applicat_3; Type: INDEX; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE INDEX ix_capacity_parameter_applicat_3 ON capacity_parameter USING btree (application_id);


--
-- Name: ix_cluster_parent_id; Type: INDEX; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE INDEX ix_cluster_parent_id ON cluster USING btree (parent_id);


--
-- Name: ix_commodity_cluster_id; Type: INDEX; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE INDEX ix_commodity_cluster_id ON commodity USING btree (cluster_id);


--
-- Name: ix_objective_parameter_applica_4; Type: INDEX; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE INDEX ix_objective_parameter_applica_4 ON objective_parameter USING btree (application_id);


--
-- Name: ix_vehicle_cluster_id; Type: INDEX; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE INDEX ix_vehicle_cluster_id ON vehicle USING btree (cluster_id);


--
-- Name: fk_application_customer_1; Type: FK CONSTRAINT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY application
    ADD CONSTRAINT fk_application_customer_1 FOREIGN KEY (customer_email) REFERENCES customer(email);


--
-- Name: fk_application_objectivefuncti_2; Type: FK CONSTRAINT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY application
    ADD CONSTRAINT fk_application_objectivefuncti_2 FOREIGN KEY (objective_function_id) REFERENCES objective_function(id);


--
-- Name: fk_capacity_parameter_applicat_3; Type: FK CONSTRAINT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY capacity_parameter
    ADD CONSTRAINT fk_capacity_parameter_applicat_3 FOREIGN KEY (application_id) REFERENCES application(id);


--
-- Name: fk_cluster_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY cluster
    ADD CONSTRAINT fk_cluster_parent_id FOREIGN KEY (parent_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_commodity_cluster_id; Type: FK CONSTRAINT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY commodity
    ADD CONSTRAINT fk_commodity_cluster_id FOREIGN KEY (cluster_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_objective_parameter_applica_4; Type: FK CONSTRAINT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY objective_parameter
    ADD CONSTRAINT fk_objective_parameter_applica_4 FOREIGN KEY (application_id) REFERENCES application(id);


--
-- Name: fk_vehicle_cluster_id; Type: FK CONSTRAINT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY vehicle
    ADD CONSTRAINT fk_vehicle_cluster_id FOREIGN KEY (cluster_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: adam
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM adam;
GRANT ALL ON SCHEMA public TO adam;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

