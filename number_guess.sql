--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: usert; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usert (
    user_id integer NOT NULL,
    username character varying(30) NOT NULL,
    game_played integer NOT NULL,
    best_game integer
);


ALTER TABLE public.usert OWNER TO freecodecamp;

--
-- Name: usert_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.usert_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usert_user_id_seq OWNER TO freecodecamp;

--
-- Name: usert_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.usert_user_id_seq OWNED BY public.usert.user_id;


--
-- Name: usert user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usert ALTER COLUMN user_id SET DEFAULT nextval('public.usert_user_id_seq'::regclass);


--
-- Data for Name: usert; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usert VALUES (19, 'user_1677682134506', 2, 612);
INSERT INTO public.usert VALUES (18, 'user_1677682134507', 5, 600);
INSERT INTO public.usert VALUES (8, 'Test01', 14, 3);
INSERT INTO public.usert VALUES (21, 'user_1677682267931', 2, 278);
INSERT INTO public.usert VALUES (11, 'user_1677681795971', 2, NULL);
INSERT INTO public.usert VALUES (10, 'user_1677681795972', 5, 33);
INSERT INTO public.usert VALUES (20, 'user_1677682267932', 5, 686);
INSERT INTO public.usert VALUES (9, 'Test02', 9, 4);
INSERT INTO public.usert VALUES (13, 'user_1677681905078', 2, 549);
INSERT INTO public.usert VALUES (12, 'user_1677681905079', 5, 625);
INSERT INTO public.usert VALUES (23, 'user_1677682310819', 2, 855);
INSERT INTO public.usert VALUES (15, 'user_1677681968813', 2, 703);
INSERT INTO public.usert VALUES (22, 'user_1677682310820', 5, 320);
INSERT INTO public.usert VALUES (24, 'Test03', 1, NULL);
INSERT INTO public.usert VALUES (14, 'user_1677681968814', 5, 563);
INSERT INTO public.usert VALUES (17, 'user_1677682068853', 2, NULL);
INSERT INTO public.usert VALUES (26, 'user_1677684776496', 2, NULL);
INSERT INTO public.usert VALUES (16, 'user_1677682068854', 5, 354);
INSERT INTO public.usert VALUES (25, 'user_1677684776497', 5, 923);


--
-- Name: usert_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.usert_user_id_seq', 26, true);


--
-- Name: usert usert_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usert
    ADD CONSTRAINT usert_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

