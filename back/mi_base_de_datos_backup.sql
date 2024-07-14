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
    runtime integer NOT NULL,
    image text
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

COPY public.movies_descriptions (id_movie, title, genre, adult, budget, origin_country, release_date, revenue, runtime, image) FROM stdin;
2	Superbad	Comedia	f	20000000	USA	2007-08-17	169871719	113	https://play-lh.googleusercontent.com/P84MvBpEpuozFphHEOGdX7ezEJoa-c__NVrka6SpWfx0oVN2dplp0Z9muKRLH0oVAu58
3	The Hangover	Comedia	f	35000000	USA	2009-06-05	467483912	100	https://i.pinimg.com/474x/0f/9d/b8/0f9db82721ca52cbd7581ad255880edd.jpg
5	Anchorman	Comedia	f	26000000	USA	2004-07-09	90449570	94	https://play-lh.googleusercontent.com/nIuYdULAinEQsMfNbHkmO2SWe5bqHvrwK16xr_v9Q1LdOLx8bWGTRkIreBXnsLNv_31iXqC7Pzp3WPhIqBw
6	Step Brothers	Comedia	f	65000000	USA	2008-07-25	128107642	98	https://play-lh.googleusercontent.com/QH8Vi3hYiwOTZCV_QS69oUb9HO8YZi3I4twa7mVwcIZP7cb5VX1332v9LuywdyzWwYJj
7	Toy Story	Infantil	f	30000000	USA	1995-11-22	373554033	81	https://img.aullidos.com/imagenes/caratulas/toy-story-1.jpg
8	Finding Nemo	Infantil	f	94000000	USA	2003-05-30	940343261	100	https://i.pinimg.com/originals/8d/6f/37/8d6f371c00cdbfaad93fe187311d8f1a.jpg
9	Frozen	Infantil	f	150000000	USA	2013-11-27	1276480335	102	https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj-iwUWY_B7uEIWPbqJBizQihN4yyQL3CyVKdKUI-JWDDftGaU5nhi3oXbt1SysjKaUkTJdcpbYVQXTCjLASC2ArHNOvmwepk4luk4KQ5QgkJ8FIA9zkXko1xlad-1uUt4Iqu0u7XxgiilC/s1600/frozendisneyn.jpg
10	The Lion King	Infantil	f	45000000	USA	1994-06-24	968511805	88	https://i.pinimg.com/474x/54/46/64/54466444dca01b1e038dd9c44f6f5d44.jpg
11	Despicable Me	Infantil	f	69000000	USA	2010-07-09	543113985	95	https://play-lh.googleusercontent.com/HihhmPVUKMThE7Ik3NwRG33NDfhvSGTsljZUYHNMJOJ0dYcHwrhde6H0EhcWDokCBc30rQ
12	The Shawshank Redemption	Drama	f	25000000	USA	1994-09-23	28341469	142	https://i.pinimg.com/474x/4e/3c/f4/4e3cf4d6d9f5d86ce6cbc4b78699eede.jpg
13	Forrest Gump	Drama	f	55000000	USA	1994-07-06	678200000	142	https://i.pinimg.com/474x/dd/16/39/dd163911d14ba1399f5a32fcaf8fe72b.jpg
14	The Godfather	Drama	f	6000000	USA	1972-03-24	246120986	175	https://i.pinimg.com/originals/a0/c0/50/a0c050d68a619f501fb3f3a44e4aeba8.jpg
15	Schindler's List	Drama	f	22000000	USA	1993-12-15	321365567	195	https://pics.filmaffinity.com/schindler_s_list-307828275-large.jpg
16	Fight Club	Drama	f	63000000	USA	1999-10-15	101209702	139	https://i.pinimg.com/236x/c8/b5/0e/c8b50ea36b6c19595ab4e5ead7c25b04.jpg
17	The Lord of the Rings: The Fellowship of the Ring	Fantasía	f	93000000	New Zealand	2001-12-19	897700000	178	https://play-lh.googleusercontent.com/wFc1LmX2Ac1e2kHLuWRv2mQ8iMRLyedgs4VhjLSwhwx2VesSizmvpUavaVSxxmfJa5s
18	Harry Potter and the Philosopher's Stone	Fantasía	f	125000000	UK	2001-11-16	978500000	152	https://media.themoviedb.org/t/p/w500/wuMc08IPKEatf9rnMNXvIDxqP4W.jpg
19	Pan's Labyrinth	Fantasía	f	19000000	Mexico	2006-10-11	83586308	118	https://play-lh.googleusercontent.com/5XXvn36n7N8M2Af7BnNjb9V3-n8CbUaH0-aKZaPr3pnv0hQ5UXSsjLY1jHrIZYqLzQo
20	The Chronicles of Narnia: The Lion, the Witch and the Wardrobe	Fantasía	f	180000000	UK	2005-12-09	745013115	143	https://es.web.img3.acsta.net/c_310_420/medias/nmedia/18/89/76/32/20065582.jpg
21	Stardust	Fantasía	f	70000000	UK	2007-08-10	137000000	127	https://es.web.img3.acsta.net/c_310_420/medias/nmedia/18/69/52/58/20160826.jpg
4	Dumb and Dumber	Comedia	f	17000000	USA	1994-12-16	247275374	107	https://i.pinimg.com/736x/f7/7a/2e/f77a2edbcf4b9298a5db5ba116e33725.jpg
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: nico
--

COPY public.reviews (id_review, id_movie, comments, score, reviewer_name) FROM stdin;
2	2	Una obra maestra del cine moderno, con una narrativa envolvente y actuaciones excepcionales. Los efectos especiales son impresionantes y la banda sonora se ajusta perfectamente al tono.	5	Juan Pérez
3	3	Una experiencia cinematográfica única que desafía las convenciones del género. La historia y los personajes son cautivadores, aunque el ritmo es lento en algunas partes.	4	Ana García
4	4	Una película divertida y ligera que ofrece muchas risas. Aunque no es una obra maestra, cumple su propósito de entretener y hacer pasar un buen rato.	4	Luis Fernández
5	2	Una película visualmente impresionante, pero la trama se siente un poco predecible. Las actuaciones son sólidas y la dirección es destacable.	4	Carlos López
6	2	Una película divertida y ligera que ofrece muchas risas. Aunque no es una obra maestra, cumple su propósito de entretener y hacer pasar un buen rato.	3	Luis Fernández
7	2	Una comedia refrescante con momentos de humor genuino. La química entre los actores es palpable y la historia, aunque simple, es efectiva.	4	Elena Martínez
8	2	BOEEE	3	Nico
9	2	Aburrido, una cagada.	1	Ignacio
10	3	Mi pelicula favorita	5	Juan Scopel
11	7	Muy educativa 	4	Agustina Alderete
\.


--
-- Name: movies_descriptions_id_movie_seq; Type: SEQUENCE SET; Schema: public; Owner: nico
--

SELECT pg_catalog.setval('public.movies_descriptions_id_movie_seq', 21, true);


--
-- Name: reviews_id_review_seq; Type: SEQUENCE SET; Schema: public; Owner: nico
--

SELECT pg_catalog.setval('public.reviews_id_review_seq', 11, true);


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

