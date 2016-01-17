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
4	42.5844000000000023	-88.4770000000000039	41.8534000000000006	-87.6518999999999977	0	{"capacity":1}	9869bd06-12ec-451f-8207-2c5f217eb4d0
\.


--
-- Name: commodity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('commodity_id_seq', 1, false);


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
14	39.4437130820373483	-87.3394701071896975	9869bd06-12ec-451f-8207-2c5f217eb4d0	0	{"capacity":1}
15	42.1863000000000028	-88.1088000000000022	9869bd06-12ec-451f-8207-2c5f217eb4d0	0	{"capacity":1}
\.


--
-- Name: vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('vehicle_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

