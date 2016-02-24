--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.1
-- Dumped by pg_dump version 9.4.1
-- Started on 2016-02-24 19:58:43 GMT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE skinny;
--
-- TOC entry 2291 (class 1262 OID 16457)
-- Name: skinny; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE skinny WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_GB.UTF-8' LC_CTYPE = 'en_GB.UTF-8';


ALTER DATABASE skinny OWNER TO postgres;

\connect skinny

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: jamesgardner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO jamesgardner;

--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: jamesgardner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 178 (class 3079 OID 12123)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 178
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 175 (class 1259 OID 16493)
-- Name: resumes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resumes (
    id integer NOT NULL,
    name character varying(255),
    updated_at date DEFAULT now()
);


ALTER TABLE resumes OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16491)
-- Name: resumes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resumes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resumes_id_seq OWNER TO postgres;

--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 174
-- Name: resumes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE resumes_id_seq OWNED BY resumes.id;


--
-- TOC entry 172 (class 1259 OID 16460)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    username character varying(255) NOT NULL,
    password character varying(255),
    id integer NOT NULL,
    resume_id integer,
    status character varying(255),
    reason character varying(500),
    type character varying(255)
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 16469)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 173
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 177 (class 1259 OID 16501)
-- Name: work; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE work (
    id integer NOT NULL,
    started_at date NOT NULL,
    ended_at date,
    summary character varying(255),
    description text,
    technology character varying(255),
    resume_id integer NOT NULL,
    "position" character varying(255),
    company character varying(255),
    type character varying(255),
    highlights json,
    updated_at date DEFAULT now()
);


ALTER TABLE work OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 16499)
-- Name: work_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE work_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE work_id_seq OWNER TO postgres;

--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 176
-- Name: work_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE work_id_seq OWNED BY work.id;


--
-- TOC entry 2162 (class 2604 OID 16496)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resumes ALTER COLUMN id SET DEFAULT nextval('resumes_id_seq'::regclass);


--
-- TOC entry 2161 (class 2604 OID 16471)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2164 (class 2604 OID 16504)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY work ALTER COLUMN id SET DEFAULT nextval('work_id_seq'::regclass);


--
-- TOC entry 2284 (class 0 OID 16493)
-- Dependencies: 175
-- Data for Name: resumes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO resumes VALUES (1, 'standard', '2016-02-10');
INSERT INTO resumes VALUES (2, 'extended', '2016-02-10');


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 174
-- Name: resumes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resumes_id_seq', 2, true);


--
-- TOC entry 2281 (class 0 OID 16460)
-- Dependencies: 172
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users VALUES ('james@backdesk.io', '$2a$10$1RdpVIqR3WNNo6YipuwKnOe.NH2zA5zWw2bhZ.N1DdY2sQCMrfJvy', 1, 1, 'enabled', NULL, NULL);
INSERT INTO users VALUES ('sddasdas@asdasda.com', NULL, 4, NULL, NULL, 'asdasdas', 'agency');
INSERT INTO users VALUES ('sddasdas@asdasda.com', NULL, 5, NULL, NULL, 'asdasdas', 'agency');
INSERT INTO users VALUES ('sddasdas@asdasda.com', NULL, 6, NULL, NULL, 'asdasdas', 'agency');
INSERT INTO users VALUES ('sddasdas@asdasda.com', NULL, 7, NULL, NULL, 'asdasdas', 'agency');
INSERT INTO users VALUES ('sddasdas@asdasda.com', NULL, 8, NULL, NULL, 'asdasdas', 'agency');
INSERT INTO users VALUES ('sddasdas@asdasda.com', NULL, 9, NULL, NULL, 'asdasdas', 'agency');
INSERT INTO users VALUES ('sddasdas@asdasda.com', NULL, 10, NULL, NULL, 'asdasdas', 'agency');


--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 173
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 10, true);


--
-- TOC entry 2286 (class 0 OID 16501)
-- Dependencies: 177
-- Data for Name: work; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO work VALUES (3, '2006-09-01', '2008-09-01', 'I developed numerous websites for well-known brands and producers using PHP, JavaScript and Flash.', NULL, 'php, mysql, javascript, flash', 1, 'Web Developer', 'Engine Creative', 'permanent', NULL, '2016-02-10');
INSERT INTO work VALUES (7, '2009-09-01', '2011-09-01', NULL, NULL, NULL, 1, 'Flash Developer', 'Derivco', 'permanent', NULL, '2016-02-10');
INSERT INTO work VALUES (8, '2011-09-01', '2013-03-01', NULL, NULL, NULL, 1, 'JavaScript Developer', 'Derivco', 'permanent', NULL, '2016-02-10');
INSERT INTO work VALUES (9, '2013-04-01', '2013-09-01', NULL, NULL, NULL, 1, 'Frontend Developer', 'Invitation Digital Ltd', 'permanent', NULL, '2016-02-10');
INSERT INTO work VALUES (11, '2013-09-01', '2014-10-01', NULL, NULL, NULL, 1, 'JavaScript Developer', 'Global Medical Treatment', 'permanent', NULL, '2016-02-10');
INSERT INTO work VALUES (12, '2014-09-01', '2014-10-01', NULL, NULL, NULL, 1, 'JavaScript Developer', 'GGMR', 'contract', NULL, '2016-02-10');
INSERT INTO work VALUES (15, '2015-05-01', NULL, 'Consulting on a broad range of e-commerce solutions.', 'I’m responsible for UI development across a number of platforms. My day to day responsibilities involve coaching and mentoring junior members of staff on their numerous projects as well as modernizing legacy commerce back office tools such as IBM Sales Centre.', 'javascript, react, express, gulp, grunt, backbone, dojo, jquery', 1, 'Frontend Developer', 'Salmon Ltd', 'contract', '["Dojo Components","Grounds up CSR written using Backbone/Underscore","RESTful services using Node","Back office tools using React and Reflux","Progressive enhancement of existing pages using Riot and Angular."]', '2016-02-10');
INSERT INTO work VALUES (13, '2014-10-01', '2015-02-01', 'Working on the next generation of music delivery platforms. ', 'I was successful in ensuring that proposed changes to the existing platform were properly assessed and carried out through robust releases. I was also able to juggle this responsibility with the development of the new in-house payment solution as well as assisting with the new and up-coming version written with JavaScript/Fluxxor/React.js.', NULL, 1, 'JavaScript Developer', 'Microsoft/MixRadio', 'contract', '["Maintaining existing bespoke JavaScript framework (mixrad.io)","Backbone (Paypal integration project)","Node/ExpressJS","Webpack/CommonJS","TDD using Jasmine, Instanbul, PhamtomJS and Karma","Cucumber for integration testing"]', '2016-02-10');
INSERT INTO work VALUES (14, '2015-02-01', '2015-05-01', 'Brought in to consult on a large-scale integration project powered by Backbone.', 'My responsibilities involved writing robust and modular UI components whilst introducing patterns for a scalable architecture.', NULL, 1, 'JavaScript Developer', 'John Wiley', 'contract', '["Architectural patterns using Backbone.js","TDD with Mocha/Sinon","Modular JavaScript with RequireJS"]', '2016-02-10');


--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 176
-- Name: work_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('work_id_seq', 15, true);


--
-- TOC entry 2169 (class 2606 OID 16498)
-- Name: resumes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resumes
    ADD CONSTRAINT resumes_pkey PRIMARY KEY (id);


--
-- TOC entry 2167 (class 2606 OID 16479)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2171 (class 2606 OID 16509)
-- Name: work_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY work
    ADD CONSTRAINT work_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: jamesgardner
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM jamesgardner;
GRANT ALL ON SCHEMA public TO jamesgardner;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-02-24 19:58:44 GMT

--
-- PostgreSQL database dump complete
--

