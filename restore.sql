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
-- Name: pathfinder_application; Type: TABLE; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE TABLE pathfinder_application (
    id uuid NOT NULL,
    name character varying(255),
    token bytea,
    cluster_id bigint
);


ALTER TABLE pathfinder_application OWNER TO pathfinderwebserver;

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

ALTER TABLE ONLY cluster ALTER COLUMN id SET DEFAULT nextval('cluster_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY commodity ALTER COLUMN id SET DEFAULT nextval('commodity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY vehicle ALTER COLUMN id SET DEFAULT nextval('vehicle_id_seq'::regclass);


--
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY cluster (id, parent_id, authentication_token) FROM stdin;
1	\N	\\x746f7020736563726574
\.


--
-- Name: cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('cluster_id_seq', 1, true);


--
-- Data for Name: commodity; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY commodity (id, startlatitude, startlongitude, endlatitude, endlongitude, status, metadata, cluster_id) FROM stdin;
1	39.4819999999999993	-87.3282999999999987	39.4420000000000002	-87.3399000000000001	0	{"capacity":1}	1
2	39.4617000000000004	-87.3033999999999963	39.4836000000000027	-87.3262	0	{"capacity":1}	1
\.


--
-- Name: commodity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('commodity_id_seq', 6, true);


--
-- Data for Name: pathfinder_application; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY pathfinder_application (id, name, token, cluster_id) FROM stdin;
9c4166bb-9535-49e1-8844-1904a0b1f45b	Chimney Swap	\\xefbfbdefbfbdefbfbdefbfbd0a2aefbfbdefbfbd55efbfbd6750efbfbd45efbfbd5befbfbd7333efbfbd27efbfbd34efbfbd14efbfbd51efbfbd524eefbfbd70efbfbd7defbfbd317a173334341912efbfbdefbfbd6defbfbd073befbfbd00efbfbdefbfbdefbfbdefbfbd6c5e6c1defbfbd30efbfbdefbfbd2fefbfbdefbfbd3defbfbd77efbfbd271909efbfbdefbfbd5aefbfbd3307efbfbd3befbfbdefbfbdefbfbd7f527512efbfbd1843efbfbd7fefbfbdefbfbdefbfbdefbfbdefbfbdefbfbd4fefbfbdefbfbdefbfbd7365efbfbdefbfbd49efbfbd7f1c171eefbfbd3e4fefbfbdefbfbdefbfbdefbfbd724e526232422defbfbdefbfbd3257efbfbdefbfbdefbfbd5b59efbfbd643b6befbfbd1eefbfbdefbfbd21efbfbdefbfbdefbfbd237cefbfbdefbfbdefbfbdefbfbdefbfbdefbfbd5befbfbd5d6eefbfbd08efbfbdefbfbdefbfbd3c72efbfbdefbfbdefbfbdefbfbd77efbfbdefbfbd76efbfbd73efbfbd2cefbfbdefbfbdefbfbdefbfbdefbfbdefbfbd7465efbfbd70efbfbdefbfbdefbfbd23efbfbd4a7aefbfbdefbfbdefbfbd26efbfbd752f2aefbfbdefbfbdefbfbd15efbfbd7defbfbd35efbfbdefbfbd0aefbfbdefbfbdefbfbd7506efbfbd5aefbfbd1eefbfbdefbfbd5f187515efbfbd2849efbfbd5800efbfbdefbfbdefbfbd7c102966efbfbd5befbfbdefbfbdefbfbd4cefbfbdefbfbdefbfbdefbfbd134e	1
\.


--
-- Data for Name: play_evolutions; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY play_evolutions (id, hash, applied_at, apply_script, revert_script, state, last_problem) FROM stdin;
1	f332ff093c2b2b9a09d3b618c76764badc063d17	2015-12-12 00:00:00	SET search_path = public, pg_catalog;\n\nSET default_tablespace = '';\n\nSET default_with_oids = false;\n\nCREATE TABLE cluster (\nid bigint NOT NULL,\nparent_id bigint,\nauthentication_token bytea\n);\n\n\nALTER TABLE cluster OWNER TO pathfinderwebserver;\n\n\nCREATE SEQUENCE cluster_id_seq\nSTART WITH 1\nINCREMENT BY 1\nNO MINVALUE\nNO MAXVALUE\nCACHE 1;\n\n\nALTER TABLE cluster_id_seq OWNER TO pathfinderwebserver;\n\n\nALTER SEQUENCE cluster_id_seq OWNED BY cluster.id;\n\n\nCREATE TABLE commodity (\nid bigint NOT NULL,\nstartlatitude double precision NOT NULL,\nstartlongitude double precision NOT NULL,\nendlatitude double precision NOT NULL,\nendlongitude double precision NOT NULL,\nstatus integer NOT NULL,\nmetadata json,\ncluster_id bigint,\nCONSTRAINT ck_commodity_status CHECK ((status = ANY (ARRAY[3, 0, 1, 4, 2])))\n);\n\n\nALTER TABLE commodity OWNER TO pathfinderwebserver;\n\nCREATE SEQUENCE commodity_id_seq\nSTART WITH 1\nINCREMENT BY 1\nNO MINVALUE\nNO MAXVALUE\nCACHE 1;\n\n\nALTER TABLE commodity_id_seq OWNER TO pathfinderwebserver;\n\nALTER SEQUENCE commodity_id_seq OWNED BY commodity.id;\n\n\nCREATE TABLE pathfinder_application (\nid uuid NOT NULL,\nname character varying(255),\ntoken bytea,\ncluster_id bigint\n);\n\n\nALTER TABLE pathfinder_application OWNER TO pathfinderwebserver;\n\nCREATE TABLE pathfinder_user (\nusername character varying(255) NOT NULL,\npassword character varrying(255) NOT NULL,\nuser_token bytea NOT NULL\n);\n\n\nALTER TABLE pathfinder_user OWNER TO pathfinderwebserver;\n\nCREATE SEQUENCE pathfinder_user_id_seq\nSTART WITH 1\nINCREMENT BY 1\nNO MINVALUE\nNO MAXVALUE\nCACHE 1;\n\nALTER TABLE commodity_id_seq OWNER TO pathfinderwebserver;\n\nALTER SEQUENCE commodity_id_seq OWNED BY pathfinder_user.id;\n\n\nCREATE TABLE vehicle (\nid bigint NOT NULL,\nlatitude double precision NOT NULL,\nlongitude double precision NOT NULL,\ncluster_id bigint,\nstatus integer NOT NULL,\nmetadata json,\nCONSTRAINT ck_vehicle_status CHECK ((status = ANY (ARRAY[0, 1])))\n);\n\n\nALTER TABLE vehicle OWNER TO pathfinderwebserver;\n\nCREATE SEQUENCE vehicle_id_seq\nSTART WITH 1\nINCREMENT BY 1\nNO MINVALUE\nNO MAXVALUE\nCACHE 1;\n\n\nALTER TABLE vehicle_id_seq OWNER TO pathfinderwebserver;\n\nALTER SEQUENCE vehicle_id_seq OWNED BY vehicle.id;\n\n\nALTER TABLE ONLY cluster ALTER COLUMN id SET DEFAULT nextval('cluster_id_seq'::regclass);\n\n\nALTER TABLE ONLY commodity ALTER COLUMN id SET DEFAULT nextval('commodity_id_seq'::regclass);\n\n\nALTER TABLE ONLY pathfinder_user ALTER COLUMN id set DEFAULT nextval('pathfinder_user_id_seq'::regclass);\n\n\nALTER TABLE ONLY vehicle ALTER COLUMN id SET DEFAULT nextval('vehicle_id_seq'::regclass);\n\n\nSELECT pg_catalog.setval('cluster_id_seq', 1, false);\n\nSELECT pg_catalog.setval('commodity_id_seq', 1, false);\n\nSELECT pg_catalog.setval('pathfinder_user_id_seq', 1, false);\n\nSELECT pg_catalog.setval('vehicle_id_seq', 1, false);\n\n\nALTER TABLE ONLY cluster\nADD CONSTRAINT pk_cluster PRIMARY KEY (id);\n\n\nALTER TABLE ONLY commodity\nADD CONSTRAINT pk_commodity PRIMARY KEY (id);\n\n\nALTER TABLE ONLY pathfinder_application\nADD CONSTRAINT pk_pathfinder_application PRIMARY KEY (id);\n\nALTER TABLE ONLY pathfinder_user\nADD CONSTRAINT pk_pathfinder_user PRIMARY KEY (id);\n\nALTER TABLE ONLY vehicle\nADD CONSTRAINT pk_vehicle PRIMARY KEY (id);\n\n\nCREATE INDEX ix_cluster_parent_id ON cluster USING btree (parent_id);\n\n\nCREATE INDEX ix_commodity_cluster_id ON commodity USING btree (cluster_id);\n\n\nCREATE INDEX ix_pathfinder_application_cluster_id ON pathfinder_application USING btree (cluster_id);\n\n\nCREATE INDEX ix_vehicle_cluster_id ON vehicle USING btree (cluster_id);\n\n\n\nALTER TABLE ONLY cluster\nADD CONSTRAINT fk_cluster_parent_id FOREIGN KEY (parent_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;\n\n\nALTER TABLE ONLY commodity\nADD CONSTRAINT fk_commodity_cluster_id FOREIGN KEY (cluster_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;\n\n\nALTER TABLE ONLY pathfinder_application\nADD CONSTRAINT fk_pathfinder_application_cluster_id FOREIGN KEY (cluster_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;\n\n\nALTER TABLE ONLY vehicle\nADD CONSTRAINT fk_vehicle_cluster_id FOREIGN KEY (cluster_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;	alter table cluster drop constraint if exists fk_cluster_parent_id;\ndrop index if exists ix_cluster_parent_id;\n\nalter table commodity drop constraint if exists fk_commodity_cluster_id;\ndrop index if exists ix_commodity_cluster_id;\n\nalter table pathfinder_application drop constraint if exists fk_pathfinder_application_cluster_id;\ndrop index if exists ix_pathfinder_application_cluster_id;\n\nalter table vehicle drop constraint if exists fk_vehicle_cluster_id;\ndrop index if exists ix_vehicle_cluster_id;\n\ndrop table if exists cluster;\n\ndrop table if exists commodity;\n\ndrop table if exists pathfinder_application;\n\ndrop table if exists pathfinder_user;\n\ndrop table if exists vehicle;	applied	ERROR: relation "cluster" already exists [ERROR:0, SQLSTATE:42P07]
\.


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY vehicle (id, latitude, longitude, cluster_id, status, metadata) FROM stdin;
8	39.4438000000000031	-87.3392999999999944	1	0	{"capacity":1}
12	39.4437130820373483	-87.3394701071896975	1	1	{"chimney":1}
\.


--
-- Name: vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('vehicle_id_seq', 12, true);


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
-- Name: pk_pathfinder_application; Type: CONSTRAINT; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

ALTER TABLE ONLY pathfinder_application
    ADD CONSTRAINT pk_pathfinder_application PRIMARY KEY (id);


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
-- Name: ix_cluster_parent_id; Type: INDEX; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE INDEX ix_cluster_parent_id ON cluster USING btree (parent_id);


--
-- Name: ix_commodity_cluster_id; Type: INDEX; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE INDEX ix_commodity_cluster_id ON commodity USING btree (cluster_id);


--
-- Name: ix_pathfinder_application_cluster_id; Type: INDEX; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE INDEX ix_pathfinder_application_cluster_id ON pathfinder_application USING btree (cluster_id);


--
-- Name: ix_vehicle_cluster_id; Type: INDEX; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE INDEX ix_vehicle_cluster_id ON vehicle USING btree (cluster_id);


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
-- Name: fk_pathfinder_application_cluster_id; Type: FK CONSTRAINT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY pathfinder_application
    ADD CONSTRAINT fk_pathfinder_application_cluster_id FOREIGN KEY (cluster_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_vehicle_cluster_id; Type: FK CONSTRAINT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY vehicle
    ADD CONSTRAINT fk_vehicle_cluster_id FOREIGN KEY (cluster_id) REFERENCES cluster(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: pathfinderwebserver
--

ALTER DEFAULT PRIVILEGES FOR ROLE pathfinderwebserver REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE pathfinderwebserver REVOKE ALL ON TABLES  FROM pathfinderwebserver;
ALTER DEFAULT PRIVILEGES FOR ROLE pathfinderwebserver GRANT ALL ON TABLES  TO pathfinderwebserver;
ALTER DEFAULT PRIVILEGES FOR ROLE pathfinderwebserver GRANT ALL ON TABLES  TO PUBLIC;


--
-- PostgreSQL database dump complete
--

