
# --- !Ups


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
-- Name: commodity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pathfinderwebserver
--

SELECT pg_catalog.setval('commodity_id_seq', 1, false);


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

drop table if exists vehicle;

