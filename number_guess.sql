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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_name character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('Joop', 3, 7);
INSERT INTO public.users VALUES ('Kees', 2, 9);
INSERT INTO public.users VALUES ('user_1701703680413', 0, 0);
INSERT INTO public.users VALUES ('user_1701703680414', 0, 0);
INSERT INTO public.users VALUES ('user_1701704537897', 0, 0);
INSERT INTO public.users VALUES ('user_1701703816251', 0, 0);
INSERT INTO public.users VALUES ('user_1701704537898', 0, 0);
INSERT INTO public.users VALUES ('user_1701703816252', 0, 0);
INSERT INTO public.users VALUES ('user_1701703843337', 0, 0);
INSERT INTO public.users VALUES ('user_1701704600477', 0, 0);
INSERT INTO public.users VALUES ('user_1701703843338', 0, 0);
INSERT INTO public.users VALUES ('user_1701704600478', 0, 0);
INSERT INTO public.users VALUES ('user_1701703849667', 0, 0);
INSERT INTO public.users VALUES ('user_1701703849668', 0, 0);
INSERT INTO public.users VALUES ('user_1701704040728', 0, 0);
INSERT INTO public.users VALUES ('user_1701704686612', 0, 0);
INSERT INTO public.users VALUES ('user_1701704040729', 0, 0);
INSERT INTO public.users VALUES ('user_1701704686613', 0, 0);
INSERT INTO public.users VALUES ('user_1701704276909', 0, 0);
INSERT INTO public.users VALUES ('user_1701704276910', 0, 0);
INSERT INTO public.users VALUES ('user_1701704780062', 0, 0);
INSERT INTO public.users VALUES ('user_1701704359876', 0, 0);
INSERT INTO public.users VALUES ('user_1701704359877', 0, 0);
INSERT INTO public.users VALUES ('user_1701704780063', 0, 0);
INSERT INTO public.users VALUES ('user_1701704457698', 0, 0);
INSERT INTO public.users VALUES ('user_1701704457699', 0, 0);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_name);


--
-- PostgreSQL database dump complete
--

