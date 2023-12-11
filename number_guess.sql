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
-- Name: results; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.results (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.results OWNER TO freecodecamp;

--
-- Name: results_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.results_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.results_game_id_seq OWNER TO freecodecamp;

--
-- Name: results_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.results_game_id_seq OWNED BY public.results.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: results game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.results ALTER COLUMN game_id SET DEFAULT nextval('public.results_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.results VALUES (1, 15, 10);
INSERT INTO public.results VALUES (2, 16, 8);
INSERT INTO public.results VALUES (3, 17, 489);
INSERT INTO public.results VALUES (4, 17, 829);
INSERT INTO public.results VALUES (5, 18, 212);
INSERT INTO public.results VALUES (6, 18, 584);
INSERT INTO public.results VALUES (7, 17, 383);
INSERT INTO public.results VALUES (8, 17, 61);
INSERT INTO public.results VALUES (9, 17, 925);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1702289308195');
INSERT INTO public.users VALUES (2, 'user_1702289308195');
INSERT INTO public.users VALUES (3, 'user_1702289308194');
INSERT INTO public.users VALUES (4, 'user_1702289308194');
INSERT INTO public.users VALUES (5, 'user_1702289308195');
INSERT INTO public.users VALUES (6, 'user_1702289308195');
INSERT INTO public.users VALUES (7, 'user_1702289308195');
INSERT INTO public.users VALUES (8, 'user_1702289333265');
INSERT INTO public.users VALUES (9, 'user_1702289333265');
INSERT INTO public.users VALUES (10, 'user_1702289333264');
INSERT INTO public.users VALUES (11, 'user_1702289333264');
INSERT INTO public.users VALUES (12, 'user_1702289333265');
INSERT INTO public.users VALUES (13, 'user_1702289333265');
INSERT INTO public.users VALUES (14, 'user_1702289333265');
INSERT INTO public.users VALUES (15, 'Kees');
INSERT INTO public.users VALUES (16, 'Henk');
INSERT INTO public.users VALUES (17, 'user_1702290200618');
INSERT INTO public.users VALUES (18, 'user_1702290200617');


--
-- Name: results_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.results_game_id_seq', 9, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 18, true);


--
-- Name: results results_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: results results_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--
