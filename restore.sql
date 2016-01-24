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
\.


--
-- Data for Name: capacity_parameter; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY capacity_parameter (id, application_id, parameter) FROM stdin;
\.


--
-- Name: capacity_parameter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('capacity_parameter_id_seq', 1, false);


--
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY cluster (id) FROM stdin;
9869bd06-12ec-451f-8207-2c5f217eb4d0
7d8f2ead-ee48-45ef-8314-3c5bebd4db82
2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8
\.


--
-- Data for Name: commodity; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY commodity (id, startlatitude, startlongitude, endlatitude, endlongitude, status, metadata, cluster_id) FROM stdin;
1	39.3875000000000028	-87.1106000000000051	39.7160000000000011	-86.2964000000000055	0	{"capacity":1}	9869bd06-12ec-451f-8207-2c5f217eb4d0
2	39.8012000000000015	-86.2789999999999964	41.5827999999999989	-87.3462999999999994	0	{"capacity":1}	9869bd06-12ec-451f-8207-2c5f217eb4d0
3	42.5844000000000023	-88.4770000000000039	41.8534000000000006	-87.6518999999999977	0	{"capacity":1}	9869bd06-12ec-451f-8207-2c5f217eb4d0
\.


--
-- Name: commodity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('commodity_id_seq', 4, false);


--
-- Data for Name: objective_parameter; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY objective_parameter (id, application_id, parameter) FROM stdin;
\.


--
-- Name: objective_parameter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('objective_parameter_id_seq', 1, false);

--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY vehicle (id, latitude, longitude, cluster_id, status, metadata) FROM stdin;
1	39.4437130820373483	-87.3394701071896975	9869bd06-12ec-451f-8207-2c5f217eb4d0	0	{"capacity":1}
2	42.1863000000000028	-88.1088000000000022	9869bd06-12ec-451f-8207-2c5f217eb4d0	0	{"capacity":1}
\.


--
-- Name: vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('vehicle_id_seq', 3, false);


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
\.


--
-- Data for Name: capacity_parameter; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY capacity_parameter (id, application_id, parameter) FROM stdin;
\.


--
-- Name: capacity_parameter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('capacity_parameter_id_seq', 1, false);


--
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY cluster (id) FROM stdin;
9869bd06-12ec-451f-8207-2c5f217eb4d0
7d8f2ead-ee48-45ef-8314-3c5bebd4db82
2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8
7d8f2ead-ee48-45ef-8314-3c5bebd4db82/foo
7d8f2ead-ee48-45ef-8314-3c5bebd4db82/foo/bar
7d8f2ead-ee48-45ef-8314-3c5bebd4db82/foo/bar/baz
9869bd06-12ec-451f-8207-2c5f217eb4d0/foo
9869bd06-12ec-451f-8207-2c5f217eb4d0/foo/bad
\.


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY vehicle (id, latitude, longitude, cluster_id, status, metadata) FROM stdin;
1	39.4437130820373483	-87.3394701071896975	9869bd06-12ec-451f-8207-2c5f217eb4d0	0	{"capacity":1}
2	42.1863000000000028	-88.1088000000000022	9869bd06-12ec-451f-8207-2c5f217eb4d0	0	{"capacity":1}
3	39.4809569999999965	-87.3232069999999965	2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8	1	{"capacity":1}
4	37.7629000000000019	-122.417199999999994	9869bd06-12ec-451f-8207-2c5f217eb4d0/foo	0	{"capacity":1}
\.


--
-- Data for Name: commodity; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY commodity (id, startlatitude, startlongitude, endlatitude, endlongitude, status, metadata, vehicle_id, cluster_id) FROM stdin;
1	39.3875000000000028	-87.1106000000000051	39.7160000000000011	-86.2964000000000055	0	{"capacity":1}	\N	9869bd06-12ec-451f-8207-2c5f217eb4d0
2	39.8012000000000015	-86.2789999999999964	41.5827999999999989	-87.3462999999999994	0	{"capacity":1}	\N	9869bd06-12ec-451f-8207-2c5f217eb4d0
3	42.5844000000000023	-88.4770000000000039	41.8534000000000006	-87.6518999999999977	0	{"capacity":1}	\N	9869bd06-12ec-451f-8207-2c5f217eb4d0
4	39.4723860000000002	-87.3694590000000062	39.4628769999999989	-87.3736760000000032	2	{}	\N	2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8
5	39.4657520000000019	-87.3601290000000006	39.4675459999999987	-87.3941849999999931	2	{}	\N	2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8
6	37.7931999999999988	-122.407200000000003	37.8096000000000032	-122.269099999999995	0	{}	\N	9869bd06-12ec-451f-8207-2c5f217eb4d0/foo
7	37.7635999999999967	-122.509900000000002	37.6195000000000022	-122.378399999999999	0	{}	\N	9869bd06-12ec-451f-8207-2c5f217eb4d0/foo
\.


--
-- Name: commodity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('commodity_id_seq', 5, true);


--
-- Data for Name: objective_parameter; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY objective_parameter (id, application_id, parameter) FROM stdin;
\.


--
-- Name: objective_parameter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('objective_parameter_id_seq', 1, false);

--
-- Name: vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('vehicle_id_seq', 3, true);


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
1674f1f6-9a93-4fcb-be9d-1e81cfd29b16	My new application.	adam@ajmichael.net	MIN_DIST
8d000a4c-f030-416b-a69c-4bf7cf6974fb	Another new app	adam@ajmichael.net	MIN_DIST
342c253e-f5c2-4f97-b444-ed2a41633f8a	Testing cluster creation live	adam@ajmichael.net	MIN_DIST
\.


--
-- Data for Name: capacity_parameter; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY capacity_parameter (id, application_id, parameter) FROM stdin;
\.


--
-- Name: capacity_parameter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('capacity_parameter_id_seq', 1, false);


--
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY cluster (id) FROM stdin;
9869bd06-12ec-451f-8207-2c5f217eb4d0
7d8f2ead-ee48-45ef-8314-3c5bebd4db82
2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8
7d8f2ead-ee48-45ef-8314-3c5bebd4db82/foo
7d8f2ead-ee48-45ef-8314-3c5bebd4db82/foo/bar
7d8f2ead-ee48-45ef-8314-3c5bebd4db82/foo/bar/baz
9869bd06-12ec-451f-8207-2c5f217eb4d0/foo
9869bd06-12ec-451f-8207-2c5f217eb4d0/foo/bad
8d000a4c-f030-416b-a69c-4bf7cf6974fb
342c253e-f5c2-4f97-b444-ed2a41633f8a
\.


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY vehicle (id, latitude, longitude, cluster_id, status, metadata) FROM stdin;
1	39.4437130820373483	-87.3394701071896975	9869bd06-12ec-451f-8207-2c5f217eb4d0	0	{"capacity":1}
2	42.1863000000000028	-88.1088000000000022	9869bd06-12ec-451f-8207-2c5f217eb4d0	0	{"capacity":1}
3	39.4809569999999965	-87.3232069999999965	2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8	1	{"capacity":1}
4	37.7629000000000019	-122.417199999999994	9869bd06-12ec-451f-8207-2c5f217eb4d0/foo	0	{"capacity":1}
5	39.4940939999999969	-87.2665939999999978	2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8	1	{"capacity":1}
\.


--
-- Data for Name: commodity; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY commodity (id, startlatitude, startlongitude, endlatitude, endlongitude, status, metadata, vehicle_id, cluster_id) FROM stdin;
1	39.3875000000000028	-87.1106000000000051	39.7160000000000011	-86.2964000000000055	0	{"capacity":1}	\N	9869bd06-12ec-451f-8207-2c5f217eb4d0
2	39.8012000000000015	-86.2789999999999964	41.5827999999999989	-87.3462999999999994	0	{"capacity":1}	\N	9869bd06-12ec-451f-8207-2c5f217eb4d0
3	42.5844000000000023	-88.4770000000000039	41.8534000000000006	-87.6518999999999977	0	{"capacity":1}	\N	9869bd06-12ec-451f-8207-2c5f217eb4d0
6	37.7931999999999988	-122.407200000000003	37.8096000000000032	-122.269099999999995	0	{}	\N	9869bd06-12ec-451f-8207-2c5f217eb4d0/foo
7	37.7635999999999967	-122.509900000000002	37.6195000000000022	-122.378399999999999	0	{}	\N	9869bd06-12ec-451f-8207-2c5f217eb4d0/foo
8	39.4723860000000002	-87.3694590000000062	39.4628769999999989	-87.3736760000000032	2	{}	\N	2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8
9	39.4657520000000019	-87.3601290000000006	39.4675459999999987	-87.3941849999999931	2	{}	\N	2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8
10	39.5213660000000004	-87.1348760000000055	39.5165409999999966	-87.1340390000000014	2	{"capacity":1}	\N	2e465a65-6c2b-4eaf-ae48-bd5f4ac209b8
\.


--
-- Name: commodity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('commodity_id_seq', 10, true);


--
-- Data for Name: objective_parameter; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY objective_parameter (id, application_id, parameter) FROM stdin;
\.


--
-- Name: objective_parameter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('objective_parameter_id_seq', 1, false);


--
-- Data for Name: play_evolutions; Type: TABLE DATA; Schema: public; Owner: pathfinderwebserver
--

COPY play_evolutions (id, hash, applied_at, apply_script, revert_script, state, last_problem) FROM stdin;
\.


--
-- Name: vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('vehicle_id_seq', 5, true);


--
-- PostgreSQL database dump complete
--

