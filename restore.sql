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
-- Name: play_evolutions; Type: ACL; Schema: public; Owner: pathfinderwebserver
--

REVOKE ALL ON TABLE play_evolutions FROM PUBLIC;
REVOKE ALL ON TABLE play_evolutions FROM pathfinderwebserver;
GRANT ALL ON TABLE play_evolutions TO pathfinderwebserver;
GRANT ALL ON TABLE play_evolutions TO PUBLIC;


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

COPY customer (email) FROM stdin;
adam@ajmichael.net
androidsampleapp@thepathfinder.com
danielghanson93@gmail.com
\.


--
-- Data for Name: objective_function; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY objective_function (id, dsl, function) FROM stdin;
MIN_DIST	sense: min\ncontext:\n    method: sum\n    for:\n        t: transport\nquantity: t.distance\n	@defVar(model, _value, Int)\n@addConstraint(model, _value == sum{distance[t],t=TA})\n@setObjective(model, Min, _value)\n
MIN_TIME	sense: min\ncontext:\n    method: sum\n    for:\n        t: transport\nquantity: t.duration\n	@defVar(model, _value, Int)\n@addConstraint(model, _value == sum{duration[t],t=TA})\n@setObjective(model, Min, _value)\n
\.


--
-- Data for Name: application; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY application (id, name, customer_email, objective_function_id, auth_url, key) FROM stdin;
9869bd06-12ec-451f-8207-2c5f217eb4d0	Chimney Swap	adam@ajmichael.net	MIN_DIST	https://auth.thepathfinder.xyz/connection	\N
7d8f2ead-ee48-45ef-8314-3c5bebd4db82	This is a thing	adam@ajmichael.net	MIN_DIST	https://auth.thepathfinder.xyz/connection	\N
2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8	MyTestCluster	androidsampleapp@thepathfinder.com	MIN_DIST	https://auth.thepathfinder.xyz/connection	\N
64bf2f19-7e6e-48e8-8c50-42dbda195785	my-test-app	danielghanson93@gmail.com	MIN_DIST	https://auth.thepathfinder.xyz/connection	\N
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
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY transport (id, latitude, longitude, cluster_id, status, metadata) FROM stdin;
6	39.4814530000000019	-87.3209329999999966	2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8	1	{"capacity":2}
2	42.1863000000000028	-88.1088000000000022	9869bd06-12ec-451f-8207-2c5f217eb4d0	1	{"capacity":1}
1	39.4437130820373483	-87.3394701071896975	9869bd06-12ec-451f-8207-2c5f217eb4d0	1	{"capacity":1}
\.


--
-- Data for Name: commodity; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY commodity (id, startlatitude, startlongitude, endlatitude, endlongitude, status, metadata, transport_id, cluster_id, request_time) FROM stdin;
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
-- Data for Name: connection; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY connection (id, token) FROM stdin;
\.


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
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY permission (email, application_id, permissions) FROM stdin;
danielghanson93@gmail.com	7d8f2ead-ee48-45ef-8314-3c5bebd4db82	[]
danielghanson93@gmail.com	2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8	[]
danielghanson93@gmail.com	9869bd06-12ec-451f-8207-2c5f217eb4d0	[]
\.

--
-- Name: vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('transport_id_seq', 6, true);


--
-- PostgreSQL database dump complete
--

