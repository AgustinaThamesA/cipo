--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: movies_descriptions; Type: TABLE; Schema: public; Owner: nico
--

CREATE TABLE public.movies_descriptions (
    id_movie integer NOT NULL,
    title character varying(255) NOT NULL,
    genre character varying(255) NOT NULL,
    adult boolean NOT NULL,
    budget integer,
    origin_country character varying(255) NOT NULL,
    release_date date NOT NULL,
    revenue integer,
    runtime integer NOT NULL
);


ALTER TABLE public.movies_descriptions OWNER TO nico;

--
-- Name: movies_descriptions_id_movie_seq; Type: SEQUENCE; Schema: public; Owner: nico
--

CREATE SEQUENCE public.movies_descriptions_id_movie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_descriptions_id_movie_seq OWNER TO nico;

--
-- Name: movies_descriptions_id_movie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nico
--

ALTER SEQUENCE public.movies_descriptions_id_movie_seq OWNED BY public.movies_descriptions.id_movie;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: nico
--

CREATE TABLE public.reviews (
    id_review integer NOT NULL,
    id_movie integer,
    comments character varying(255) NOT NULL,
    score integer NOT NULL,
    reviewer_name character varying(255) NOT NULL
);


ALTER TABLE public.reviews OWNER TO nico;

--
-- Name: reviews_id_review_seq; Type: SEQUENCE; Schema: public; Owner: nico
--

CREATE SEQUENCE public.reviews_id_review_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_review_seq OWNER TO nico;

--
-- Name: reviews_id_review_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nico
--

ALTER SEQUENCE public.reviews_id_review_seq OWNED BY public.reviews.id_review;


--
-- Name: movies_descriptions id_movie; Type: DEFAULT; Schema: public; Owner: nico
--

ALTER TABLE ONLY public.movies_descriptions ALTER COLUMN id_movie SET DEFAULT nextval('public.movies_descriptions_id_movie_seq'::regclass);


--
-- Name: reviews id_review; Type: DEFAULT; Schema: public; Owner: nico
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id_review SET DEFAULT nextval('public.reviews_id_review_seq'::regclass);


--
-- Data for Name: movies_descriptions; Type: TABLE DATA; Schema: public; Owner: nico
--

COPY public.movies_descriptions (id_movie, title, genre, adult, budget, origin_country, release_date, revenue, runtime) FROM stdin;
2	Superbad	Comedia	f	20000000	USA	2007-08-17	169871719	113
3	The Hangover	Comedia	f	35000000	USA	2009-06-05	467483912	100
4	Dumb and Dumber	Comedia	f	17000000	USA	1994-12-16	247275374	107
5	Anchorman	Comedia	f	26000000	USA	2004-07-09	90449570	94
6	Step Brothers	Comedia	f	65000000	USA	2008-07-25	128107642	98
7	Toy Story	Infantil	f	30000000	USA	1995-11-22	373554033	81
8	Finding Nemo	Infantil	f	94000000	USA	2003-05-30	940343261	100
9	Frozen	Infantil	f	150000000	USA	2013-11-27	1276480335	102
10	The Lion King	Infantil	f	45000000	USA	1994-06-24	968511805	88
11	Despicable Me	Infantil	f	69000000	USA	2010-07-09	543113985	95
12	The Shawshank Redemption	Drama	f	25000000	USA	1994-09-23	28341469	142
13	Forrest Gump	Drama	f	55000000	USA	1994-07-06	678200000	142
14	The Godfather	Drama	f	6000000	USA	1972-03-24	246120986	175
15	Schindler's List	Drama	f	22000000	USA	1993-12-15	321365567	195
16	Fight Club	Drama	f	63000000	USA	1999-10-15	101209702	139
17	The Lord of the Rings: The Fellowship of the Ring	Fantasía	f	93000000	New Zealand	2001-12-19	897700000	178
18	Harry Potter and the Philosopher's Stone	Fantasía	f	125000000	UK	2001-11-16	978500000	152
19	Pan's Labyrinth	Fantasía	f	19000000	Mexico	2006-10-11	83586308	118
20	The Chronicles of Narnia: The Lion, the Witch and the Wardrobe	Fantasía	f	180000000	UK	2005-12-09	745013115	143
21	Stardust	Fantasía	f	70000000	UK	2007-08-10	137000000	127
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: nico
--

COPY public.reviews (id_review, id_movie, comments, score, reviewer_name) FROM stdin;
\.


--
-- Name: movies_descriptions_id_movie_seq; Type: SEQUENCE SET; Schema: public; Owner: nico
--

SELECT pg_catalog.setval('public.movies_descriptions_id_movie_seq', 21, true);


--
-- Name: reviews_id_review_seq; Type: SEQUENCE SET; Schema: public; Owner: nico
--

SELECT pg_catalog.setval('public.reviews_id_review_seq', 1, true);


--
-- Name: movies_descriptions movies_descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: nico
--

ALTER TABLE ONLY public.movies_descriptions
    ADD CONSTRAINT movies_descriptions_pkey PRIMARY KEY (id_movie);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: nico
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id_review);


--
-- Name: reviews reviews_id_movie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nico
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_id_movie_fkey FOREIGN KEY (id_movie) REFERENCES public.movies_descriptions(id_movie);


--
-- PostgreSQL database dump complete
--

