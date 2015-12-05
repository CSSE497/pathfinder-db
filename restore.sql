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

COPY cluster (id, authentication_token) FROM stdin;
1	\\x746f7020736563726574
\.


--
-- Name: cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('cluster_id_seq', 1, false);


--
-- Data for Name: commodity; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY commodity (id, startlatitude, startlongitude, endlatitude, endlongitude, status, metadata, cluster_id) FROM stdin;
1	39.4815139999999971	-87.3141770000000008	39.4754629999999977	-87.3487089999999995	2	"{}"	1
2	39.4423790000000025	-87.3390610000000009	39.4816379999999967	-87.3211009999999987	3	"{}"	1
3	39.4993100000000013	-87.3791140000000013	39.5159969999999987	-87.3586860000000058	3	"{}"	1
6	39.404952999999999	-87.3176050000000004	39.4704460000000026	-87.4144220000000018	3	"{}"	1
7	39.4587840000000014	-87.4068690000000004	39.4484449999999995	-87.3344280000000026	3	"{}"	1
9	43.1035260000000022	-86.2484919999999988	39.4399999999999977	-87.3400000000000034	3	"{}"	1
10	39.4399999999999977	-87.3400000000000034	43.1035260000000022	-86.2484919999999988	3	"{}"	1
11	43.1035260000000022	-86.2484919999999988	39.4399999999999977	-87.3400000000000034	3	"{}"	1
12	39.4399999999999977	-87.3400000000000034	43.1035260000000022	-86.2484919999999988	3	"{}"	1
13	43.1035260000000022	-86.2484919999999988	39.4399999999999977	-87.3400000000000034	3	"{}"	1
14	39.4399999999999977	-87.3400000000000034	43.1035260000000022	-86.2484919999999988	3	"{}"	1
15	39.4835410779709832	-87.3245842662521881	39.4399999999999977	-87.3400000000000034	3	"{}"	1
16	39.4399999999999977	-87.3400000000000034	39.4835410779709832	-87.3245842662521881	3	"{}"	1
17	39.4432649000000026	-87.3386129999999952	39.4399999999999977	-87.3400000000000034	2	"{}"	1
18	39.4399999999999977	-87.3400000000000034	39.4432649000000026	-87.3386129999999952	2	"{}"	1
19	39.4432649000000026	-87.3386129999999952	39.4399999999999977	-87.3400000000000034	2	"{}"	1
20	39.4399999999999977	-87.3400000000000034	39.4432649000000026	-87.3386129999999952	2	"{}"	1
21	39.4432649000000026	-87.3386129999999952	39.4399999999999977	-87.3400000000000034	2	"{}"	1
22	39.4399999999999977	-87.3400000000000034	39.4432649000000026	-87.3386129999999952	2	"{}"	1
23	43.1035260000000022	-86.2484919999999988	39.4399999999999977	-87.3400000000000034	2	"{}"	1
24	39.4399999999999977	-87.3400000000000034	43.1035260000000022	-86.2484919999999988	2	"{}"	1
25	43.1035260000000022	-86.2484919999999988	39.4399999999999977	-87.3400000000000034	2	"{}"	1
26	39.4399999999999977	-87.3400000000000034	43.1035260000000022	-86.2484919999999988	2	"{}"	1
27	39.4432649000000026	-87.3386129999999952	39.4399999999999977	-87.3400000000000034	2	"{}"	1
28	39.4399999999999977	-87.3400000000000034	39.4432649000000026	-87.3386129999999952	2	"{}"	1
29	43.1035260000000022	-86.2484919999999988	39.4399999999999977	-87.3400000000000034	2	"{}"	1
30	39.4399999999999977	-87.3400000000000034	43.1035260000000022	-86.2484919999999988	2	"{}"	1
31	43.1035260000000022	-86.2484919999999988	39.4399999999999977	-87.3400000000000034	2	"{}"	1
32	39.4399999999999977	-87.3400000000000034	43.1035260000000022	-86.2484919999999988	2	"{}"	1
33	43.1035260000000022	-86.2484919999999988	39.4399999999999977	-87.3400000000000034	2	"{}"	1
34	39.4399999999999977	-87.3400000000000034	43.1035260000000022	-86.2484919999999988	2	"{}"	1
35	42.1864145016690628	-88.1087807101086753	39.4399999999999977	-87.3400000000000034	2	"{}"	1
36	39.4399999999999977	-87.3400000000000034	42.1864145016690628	-88.1087807101086753	2	"{}"	1
4	39.4920240000000007	-87.4484649999999988	39.4334460000000036	-87.4134459999999933	4	"{}"	1
5	39.4914970000000025	-87.3145319999999998	39.4919610000000034	-87.3631129999999985	4	"{}"	1
\.


--
-- Name: commodity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('commodity_id_seq', 36, false);


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
1	099c07c448fd7fb1817447733f1a0716f2b4c139	2015-12-04 00:00:00	create table cluster (\nid                            bigserial not null,\nparent_id                     bigint,\nauthentication_token          bytea,\nconstraint pk_cluster primary key (id)\n);\n\ncreate table commodity (\nid                            bigserial not null,\nstartlatitude                 float not null,\nstartlongitude                float not null,\nendlatitude                   float not null,\nendlongitude                  float not null,\nstatus                        integer not null,\nmetadata                      json,\ncluster_id                    bigint,\nconstraint ck_commodity_status check (status in ('3','0','1','4','2')),\nconstraint pk_commodity primary key (id)\n);\n\ncreate table pathfinder_application (\nid                            uuid not null,\nname                          varchar(255),\ntoken                         bytea,\ncluster_id                    bigint,\nconstraint pk_pathfinder_application primary key (id)\n);\n\ncreate table vehicle (\nid                            bigserial not null,\nlatitude                      float not null,\nlongitude                     float not null,\ncluster_id                    bigint,\nstatus                        integer not null,\nmetadata                      json,\nconstraint ck_vehicle_status check (status in ('0','1')),\nconstraint pk_vehicle primary key (id)\n);\n\nalter table cluster add constraint fk_cluster_parent_id foreign key (parent_id) references cluster (id) on delete restrict on update restrict;\ncreate index ix_cluster_parent_id on cluster (parent_id);\n\nalter table commodity add constraint fk_commodity_cluster_id foreign key (cluster_id) references cluster (id) on delete restrict on update restrict;\ncreate index ix_commodity_cluster_id on commodity (cluster_id);\n\nalter table pathfinder_application add constraint fk_pathfinder_application_cluster_id foreign key (cluster_id) references cluster (id) on delete restrict on update restrict;\ncreate index ix_pathfinder_application_cluster_id on pathfinder_application (cluster_id);\n\nalter table vehicle add constraint fk_vehicle_cluster_id foreign key (cluster_id) references cluster (id) on delete restrict on update restrict;\ncreate index ix_vehicle_cluster_id on vehicle (cluster_id);	alter table cluster drop constraint if exists fk_cluster_parent_id;\ndrop index if exists ix_cluster_parent_id;\n\nalter table commodity drop constraint if exists fk_commodity_cluster_id;\ndrop index if exists ix_commodity_cluster_id;\n\nalter table pathfinder_application drop constraint if exists fk_pathfinder_application_cluster_id;\ndrop index if exists ix_pathfinder_application_cluster_id;\n\nalter table vehicle drop constraint if exists fk_vehicle_cluster_id;\ndrop index if exists ix_vehicle_cluster_id;\n\ndrop table if exists cluster cascade;\n\ndrop table if exists commodity cascade;\n\ndrop table if exists pathfinder_application cascade;\n\ndrop table if exists vehicle cascade;	applied	
\.


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY vehicle (id, latitude, longitude, cluster_id, status, metadata) FROM stdin;
3	39	-87	1	1	"{}"
4	39.4838028867165391	-87.3246072326668781	1	0	"{}"
5	42.1863397582631876	-88.1086967003562762	1	0	"{}"
6	42.1864473168199723	-88.1088692230061667	1	1	"{}"
7	42.1864670562019413	-88.1087871641741174	1	0	"{}"
8	42.18650511004234	-88.1088082027510779	1	1	"{}"
\.


--
-- Name: vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('vehicle_id_seq', 8, false);


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

