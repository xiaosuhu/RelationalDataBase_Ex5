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

INSERT INTO public.usert VALUES (101, 'Test01', 4, 2);
INSERT INTO public.usert VALUES (103, 'user_1677691434466', 2, 398);
INSERT INTO public.usert VALUES (102, 'user_1677691434467', 5, 24);
INSERT INTO public.usert VALUES (105, 'user_1677691470890', 2, 309);
INSERT INTO public.usert VALUES (104, 'user_1677691470891', 5, 496);
INSERT INTO public.usert VALUES (107, 'user_1677691586099', 2, 201);
INSERT INTO public.usert VALUES (106, 'user_1677691586100', 5, 15);


--
-- Name: usert_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.usert_user_id_seq', 107, true);


--
-- Name: usert usert_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usert
    ADD CONSTRAINT usert_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

