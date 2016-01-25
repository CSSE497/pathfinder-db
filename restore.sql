--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

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
-- Name: play_evolutions_pkey; Type: CONSTRAINT; Schema: public; Owner: pathfinderwebserver; Tablespace: 
--

ALTER TABLE ONLY play_evolutions
    ADD CONSTRAINT play_evolutions_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY customer (email, password) FROM stdin;
adam@ajmichael.net	password
androidsampleapp@thepathfinder.com	tester
danielghanson93@gmail.com	password
\.


--
-- Data for Name: objective_function; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY objective_function (id, function) FROM stdin;
MIN_DIST	sum{distances[k1,k2]*x[k1,k2,i],k1=RA,k2=RA,i=VA}
MIN_TIME	sum{durations[k1,k2]*x[k1,k2,i],k1=RA,k2=RA,i=VA}
\.


--
-- Data for Name: application; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY application (id, name, customer_email, objective_function_id) FROM stdin;
9869bd06-12ec-451f-8207-2c5f217eb4d0	Chimney Swap	adam@ajmichael.net	MIN_DIST
7d8f2ead-ee48-45ef-8314-3c5bebd4db82	This is a thing	adam@ajmichael.net	MIN_DIST
2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8	MyTestCluster	androidsampleapp@thepathfinder.com	MIN_DIST
64bf2f19-7e6e-48e8-8c50-42dbda195785	my-test-app	danielghanson93@gmail.com	MIN_DIST
\.


--
-- Data for Name: capacity_parameter; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY capacity_parameter (id, application_id, parameter) FROM stdin;
1	9869bd06-12ec-451f-8207-2c5f217eb4d0	capacity
\.


--
-- Name: capacity_parameter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('capacity_parameter_id_seq', 1, true);


--
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY cluster (id) FROM stdin;
9869bd06-12ec-451f-8207-2c5f217eb4d0
7d8f2ead-ee48-45ef-8314-3c5bebd4db82
2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8
64bf2f19-7e6e-48e8-8c50-42dbda195785
\.


--
-- Data for Name: commodity; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY commodity (id, startlatitude, startlongitude, endlatitude, endlongitude, status, metadata, vehicle_id, cluster_id, request_time) FROM stdin;
17	39.4711360000000013	-87.3776210000000049	39.4656670000000034	-87.381857999999994	2	{"capacity":1}	\N	2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8	2016-01-24 19:53:22.484
18	39.4700160000000011	-87.383964000000006	39.4695150000000012	-87.3870139999999935	2	{"capacity":1}	\N	2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8	2016-01-24 19:53:35.994
23	39.4699999999999989	-87.3700000000000045	39.7000000000000028	-87.3799999999999955	2	{}	\N	64bf2f19-7e6e-48e8-8c50-42dbda195785	2016-01-24 20:00:40.339
1	39.3875000000000028	-87.1106000000000051	39.7160000000000011	-86.2964000000000055	2	{"capacity":1}	\N	9869bd06-12ec-451f-8207-2c5f217eb4d0	2016-01-24 21:55:48.693
2	39.8012000000000015	-86.2789999999999964	41.5827999999999989	-87.3462999999999994	2	{"capacity":1}	\N	9869bd06-12ec-451f-8207-2c5f217eb4d0	2016-01-24 21:55:56.53
3	42.5844000000000023	-88.4770000000000039	41.8534000000000006	-87.6518999999999977	2	{"capacity":1}	\N	9869bd06-12ec-451f-8207-2c5f217eb4d0	2016-01-24 21:56:00.758
\.


--
-- Name: commodity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('commodity_id_seq', 23, true);


--
-- Data for Name: objective_parameter; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY objective_parameter (id, application_id, parameter) FROM stdin;
1	9869bd06-12ec-451f-8207-2c5f217eb4d0	capacity
\.


--
-- Name: objective_parameter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('objective_parameter_id_seq', 1, true);


--
-- Data for Name: play_evolutions; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY play_evolutions (id, hash, applied_at, apply_script, revert_script, state, last_problem) FROM stdin;
1	bb3e8e635e7954bce4ab39a7f2d480abccbd96f3	2016-01-23 00:00:00	create table application (\nid                            varchar(255) not null,\nname                          varchar(255),\ncustomer_email                varchar(255),\nobjective_function_id         varchar(255),\nconstraint pk_application primary key (id)\n);\n\ncreate table capacity_parameter (\nid                            bigserial not null,\napplication_id                varchar(255) not null,\nparameter                     varchar(255) not null,\nconstraint pk_capacity_parameter primary key (id)\n);\n\ncreate table cluster (\nid                            varchar(255) not null,\nconstraint pk_cluster primary key (id)\n);\n\ncreate table commodity (\nid                            bigserial not null,\nstartlatitude                 float not null,\nstartlongitude                float not null,\nendlatitude                   float not null,\nendlongitude                  float not null,\nstatus                        integer not null,\nmetadata                      json,\nvehicle_id                    bigint,\ncluster_id                    varchar(255),\nconstraint ck_commodity_status check (status in ('3','0','1','4','2')),\nconstraint pk_commodity primary key (id)\n);\n\ncreate table customer (\nemail                         varchar(255) not null,\npassword                      varchar(255) not null,\nconstraint pk_customer primary key (email)\n);\n\ncreate table objective_function (\nid                            varchar(255) not null,\nfunction                      varchar(255) not null,\nconstraint pk_objective_function primary key (id)\n);\n\ncreate table objective_parameter (\nid                            bigserial not null,\napplication_id                varchar(255) not null,\nparameter                     varchar(255) not null,\nconstraint pk_objective_parameter primary key (id)\n);\n\ncreate table vehicle (\nid                            bigserial not null,\nlatitude                      float not null,\nlongitude                     float not null,\ncluster_id                    varchar(255),\nstatus                        integer not null,\nmetadata                      json,\nconstraint ck_vehicle_status check (status in ('0','1')),\nconstraint pk_vehicle primary key (id)\n);\n\nalter table application add constraint fk_application_customer_email foreign key (customer_email) references customer (email) on delete restrict on update restrict;\ncreate index ix_application_customer_email on application (customer_email);\n\nalter table application add constraint fk_application_objective_function_id foreign key (objective_function_id) references objective_function (id) on delete restrict on update restrict;\ncreate index ix_application_objective_function_id on application (objective_function_id);\n\nalter table capacity_parameter add constraint fk_capacity_parameter_application_id foreign key (application_id) references application (id) on delete restrict on update restrict;\ncreate index ix_capacity_parameter_application_id on capacity_parameter (application_id);\n\nalter table commodity add constraint fk_commodity_vehicle_id foreign key (vehicle_id) references vehicle (id) on delete restrict on update restrict;\ncreate index ix_commodity_vehicle_id on commodity (vehicle_id);\n\nalter table objective_parameter add constraint fk_objective_parameter_application_id foreign key (application_id) references application (id) on delete restrict on update restrict;\ncreate index ix_objective_parameter_application_id on objective_parameter (application_id);\n\nalter table vehicle add constraint fk_vehicle_cluster_id foreign key (cluster_id) references cluster (id) on delete restrict on update restrict;\ncreate index ix_vehicle_cluster_id on vehicle (cluster_id);	alter table application drop constraint if exists fk_application_customer_email;\ndrop index if exists ix_application_customer_email;\n\nalter table application drop constraint if exists fk_application_objective_function_id;\ndrop index if exists ix_application_objective_function_id;\n\nalter table application drop constraint if exists fk_application_cluster_id;\ndrop index if exists ix_application_cluster_id;\n\nalter table capacity_parameter drop constraint if exists fk_capacity_parameter_application_id;\ndrop index if exists ix_capacity_parameter_application_id;\n\nalter table commodity drop constraint if exists fk_commodity_vehicle_id;\ndrop index if exists ix_commodity_vehicle_id;\n\nalter table commodity drop constraint if exists fk_commodity_cluster_id;\ndrop index if exists ix_commodity_cluster_id;\n\nalter table objective_parameter drop constraint if exists fk_objective_parameter_application_id;\ndrop index if exists ix_objective_parameter_application_id;\n\nalter table vehicle drop constraint if exists fk_vehicle_cluster_id;\ndrop index if exists ix_vehicle_cluster_id;\n\ndrop table if exists application cascade;\n\ndrop table if exists capacity_parameter cascade;\n\ndrop table if exists capacity_parameter cascade;\n\ndrop table if exists cluster cascade;\n\ndrop table if exists commodity cascade;\n\ndrop table if exists customer cascade;\n\ndrop table if exists objective_function cascade;\n\ndrop table if exists objective_parameter cascade;\n\ndrop table if exists vehicle cascade;	applied	ERROR: relation "application" already exists [ERROR:0, SQLSTATE:42P07]
\.


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY vehicle (id, latitude, longitude, cluster_id, status, metadata) FROM stdin;
6	39.4814530000000019	-87.3209329999999966	2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8	1	{"capacity":2}
2	42.1863000000000028	-88.1088000000000022	9869bd06-12ec-451f-8207-2c5f217eb4d0	1	{"capacity":1}
1	39.4437130820373483	-87.3394701071896975	9869bd06-12ec-451f-8207-2c5f217eb4d0	1	{"capacity":1}
\.


--
-- Name: vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('vehicle_id_seq', 6, true);


--
-- PostgreSQL database dump complete
--

