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
    authentication_token bytea NOT NULL
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
    param integer,
    cluster_id bigint
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
    id character varying(40) NOT NULL,
    name character varying(255),
    token bytea NOT NULL,
    cluster_id bigint
);


ALTER TABLE pathfinder_application OWNER TO pathfinderwebserver;

--
-- Name: pathfinder_user; Type: TABLE; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE TABLE pathfinder_user (
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    user_token bytea NOT NULL
);


ALTER TABLE pathfinder_user OWNER TO pathfinderwebserver;

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
    capacity integer NOT NULL,
    status integer NOT NULL,
    cluster_id bigint
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

COPY cluster (id, authentication_token) FROM stdin;
1	\\x746f7020736563726574
\.


--
-- Name: cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('cluster_id_seq', 1, true);


--
-- Data for Name: commodity; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY commodity (id, startlatitude, startlongitude, endlatitude, endlongitude, param, cluster_id) FROM stdin;
1	39.481514	-87.314177	39.475463	-87.348709	3	1
2	39.442379	-87.339061	39.481638	-87.321101	2	1
3	39.499310	-87.379114	39.515997	-87.358686	1	1
4	39.492024	-87.448465	39.433446	-87.413446	1	1
5	39.491497	-87.314532	39.491961	-87.363113	1	1
6	39.404953	-87.317605	39.470446	-87.414422	2	1
7	39.458784	-87.406869	39.448445	-87.334428	1	1
\.


--
-- Name: commodity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('commodity_id_seq', 2, true);


--
-- Data for Name: pathfinder_application; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY pathfinder_application (id, name, token, cluster_id) FROM stdin;
9c4166bb-9535-49e1-8844-1904a0b1f45b	Chimney Swap	\\xefbfbdefbfbdefbfbdefbfbd0a2aefbfbdefbfbd55efbfbd6750efbfbd45efbfbd5befbfbd7333efbfbd27efbfbd34efbfbd14efbfbd51efbfbd524eefbfbd70efbfbd7defbfbd317a173334341912efbfbdefbfbd6defbfbd073befbfbd00efbfbdefbfbdefbfbdefbfbd6c5e6c1defbfbd30efbfbdefbfbd2fefbfbdefbfbd3defbfbd77efbfbd271909efbfbdefbfbd5aefbfbd3307efbfbd3befbfbdefbfbdefbfbd7f527512efbfbd1843efbfbd7fefbfbdefbfbdefbfbdefbfbdefbfbdefbfbd4fefbfbdefbfbdefbfbd7365efbfbdefbfbd49efbfbd7f1c171eefbfbd3e4fefbfbdefbfbdefbfbdefbfbd724e526232422defbfbdefbfbd3257efbfbdefbfbdefbfbd5b59efbfbd643b6befbfbd1eefbfbdefbfbd21efbfbdefbfbdefbfbd237cefbfbdefbfbdefbfbdefbfbdefbfbdefbfbd5befbfbd5d6eefbfbd08efbfbdefbfbdefbfbd3c72efbfbdefbfbdefbfbdefbfbd77efbfbdefbfbd76efbfbd73efbfbd2cefbfbdefbfbdefbfbdefbfbdefbfbdefbfbd7465efbfbd70efbfbdefbfbdefbfbd23efbfbd4a7aefbfbdefbfbdefbfbd26efbfbd752f2aefbfbdefbfbdefbfbd15efbfbd7defbfbd35efbfbdefbfbd0aefbfbdefbfbdefbfbd7506efbfbd5aefbfbd1eefbfbdefbfbd5f187515efbfbd2849efbfbd5800efbfbdefbfbdefbfbd7c102966efbfbd5befbfbdefbfbdefbfbd4cefbfbdefbfbdefbfbdefbfbd134e	1
\.


--
-- Data for Name: pathfinder_user; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY pathfinder_user (username, password, user_token) FROM stdin;
test test \\xweiucnweufvwecacasfc
\.


--
-- Data for Name: play_evolutions; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY play_evolutions (id, hash, applied_at, apply_script, revert_script, state, last_problem) FROM stdin;
1	61ef40efa6afa31572cb7c2a9acff50da32fd1c4	2015-10-25 00:00:00	create table cluster (\nid                        bigserial not null,\nauthentication_token      bytea not null,\nconstraint pk_cluster primary key (id))\n;\n\ncreate table commodity (\nid                        bigserial not null,\nstartLatitude             float not null,\nstartLongitude            float not null,\nendLatitude               float not null,\nendLongitude              float not null,\nparam                     integer,\ncluster_id                bigint,\nconstraint pk_commodity primary key (id))\n;\n\ncreate table pathfinder_application (\nid                        varchar(40) not null,\nname                      varchar(255),\ntoken                     bytea not null,\ncluster_id                bigint,\nconstraint pk_pathfinder_application primary key (id))\n;\n\ncreate table pathfinder_user (\nusername                  varchar(255) not null,\npassword                  varchar(255) not null,\nuser_token                bytea not null,\nconstraint pk_pathfinder_user primary key (username))\n;\n\ncreate table vehicle (\nid                        bigserial not null,\nlatitude                  float not null,\nlongitude                 float not null,\ncapacity                  integer not null,\nstatus                integer not null,\ncluster_id                bigint,\nconstraint pk_vehicle primary key (id))\n;\n\nalter table commodity add constraint fk_commodity_cluster_1 foreign key (cluster_id) references cluster (id);\ncreate index ix_commodity_cluster_1 on commodity (cluster_id);\nalter table pathfinder_application add constraint fk_pathfinder_application_clus_2 foreign key (cluster_id) references cluster (id);\ncreate index ix_pathfinder_application_clus_2 on pathfinder_application (cluster_id);\nalter table vehicle add constraint fk_vehicle_cluster_3 foreign key (cluster_id) references cluster (id);\ncreate index ix_vehicle_cluster_3 on vehicle (cluster_id);	drop table if exists cluster cascade;\n\ndrop table if exists commodity cascade;\n\ndrop table if exists pathfinder_application cascade;\n\ndrop table if exists pathfinder_user cascade;\n\ndrop table if exists vehicle cascade;	applied	
\.


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY vehicle (id, latitude, longitude, capacity, status, cluster_id) FROM stdin;
1	39.478768	-87.332829	3	1	1
\.


--
-- Name: vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('vehicle_id_seq', 2, true);


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
-- Name: pk_pathfinder_user; Type: CONSTRAINT; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

ALTER TABLE ONLY pathfinder_user
    ADD CONSTRAINT pk_pathfinder_user PRIMARY KEY (username);


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
-- Name: ix_commodity_cluster_1; Type: INDEX; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE INDEX ix_commodity_cluster_1 ON commodity USING btree (cluster_id);


--
-- Name: ix_pathfinder_application_clus_2; Type: INDEX; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE INDEX ix_pathfinder_application_clus_2 ON pathfinder_application USING btree (cluster_id);


--
-- Name: ix_vehicle_cluster_3; Type: INDEX; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

CREATE INDEX ix_vehicle_cluster_3 ON vehicle USING btree (cluster_id);


--
-- Name: fk_commodity_cluster_1; Type: FK CONSTRAINT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY commodity
    ADD CONSTRAINT fk_commodity_cluster_1 FOREIGN KEY (cluster_id) REFERENCES cluster(id);


--
-- Name: fk_pathfinder_application_clus_2; Type: FK CONSTRAINT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY pathfinder_application
    ADD CONSTRAINT fk_pathfinder_application_clus_2 FOREIGN KEY (cluster_id) REFERENCES cluster(id);


--
-- Name: fk_vehicle_cluster_3; Type: FK CONSTRAINT; Schema: public; Owner: pathfinderwebserver
--

ALTER TABLE ONLY vehicle
    ADD CONSTRAINT fk_vehicle_cluster_3 FOREIGN KEY (cluster_id) REFERENCES cluster(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: cluster; Type: ACL; Schema: public; Owner: pathfinderwebserver
--

REVOKE ALL ON TABLE cluster FROM PUBLIC;
REVOKE ALL ON TABLE cluster FROM pathfinderwebserver;
GRANT ALL ON TABLE cluster TO pathfinderwebserver;
GRANT ALL ON TABLE cluster TO PUBLIC;


--
-- Name: commodity; Type: ACL; Schema: public; Owner: pathfinderwebserver
--

REVOKE ALL ON TABLE commodity FROM PUBLIC;
REVOKE ALL ON TABLE commodity FROM pathfinderwebserver;
GRANT ALL ON TABLE commodity TO pathfinderwebserver;
GRANT ALL ON TABLE commodity TO PUBLIC;


--
-- Name: pathfinder_application; Type: ACL; Schema: public; Owner: pathfinderwebserver
--

REVOKE ALL ON TABLE pathfinder_application FROM PUBLIC;
REVOKE ALL ON TABLE pathfinder_application FROM pathfinderwebserver;
GRANT ALL ON TABLE pathfinder_application TO pathfinderwebserver;
GRANT ALL ON TABLE pathfinder_application TO PUBLIC;


--
-- Name: pathfinder_user; Type: ACL; Schema: public; Owner: pathfinderwebserver
--

REVOKE ALL ON TABLE pathfinder_user FROM PUBLIC;
REVOKE ALL ON TABLE pathfinder_user FROM pathfinderwebserver;
GRANT ALL ON TABLE pathfinder_user TO pathfinderwebserver;
GRANT ALL ON TABLE pathfinder_user TO PUBLIC;


--
-- Name: play_evolutions; Type: ACL; Schema: public; Owner: pathfinderwebserver
--

REVOKE ALL ON TABLE play_evolutions FROM PUBLIC;
REVOKE ALL ON TABLE play_evolutions FROM pathfinderwebserver;
GRANT ALL ON TABLE play_evolutions TO pathfinderwebserver;
GRANT ALL ON TABLE play_evolutions TO PUBLIC;


--
-- Name: vehicle; Type: ACL; Schema: public; Owner: pathfinderwebserver
--

REVOKE ALL ON TABLE vehicle FROM PUBLIC;
REVOKE ALL ON TABLE vehicle FROM pathfinderwebserver;
GRANT ALL ON TABLE vehicle TO pathfinderwebserver;
GRANT ALL ON TABLE vehicle TO PUBLIC;


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

