--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer DEFAULT 0,
    random_num integer DEFAULT 0,
    guesses integer DEFAULT 0
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(100) NOT NULL,
    best_game_id integer DEFAULT 0,
    best_game_guesses integer DEFAULT 0,
    win_rate integer DEFAULT 0,
    games_win integer DEFAULT 0,
    games_count integer DEFAULT 0
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 9, 872, 0);
INSERT INTO public.games VALUES (2, 9, 697, 0);
INSERT INTO public.games VALUES (3, 11, 292, 0);
INSERT INTO public.games VALUES (4, 11, 507, 0);
INSERT INTO public.games VALUES (5, 9, 625, 0);
INSERT INTO public.games VALUES (6, 9, 385, 0);
INSERT INTO public.games VALUES (7, 9, 691, 0);
INSERT INTO public.games VALUES (8, 16, 556, 0);
INSERT INTO public.games VALUES (9, 16, 962, 0);
INSERT INTO public.games VALUES (10, 18, 705, 0);
INSERT INTO public.games VALUES (11, 18, 128, 0);
INSERT INTO public.games VALUES (12, 16, 480, 0);
INSERT INTO public.games VALUES (13, 16, 718, 0);
INSERT INTO public.games VALUES (14, 16, 259, 0);
INSERT INTO public.games VALUES (15, 23, 756, 0);
INSERT INTO public.games VALUES (16, 71, 621, 622);
INSERT INTO public.games VALUES (17, 71, 751, 752);
INSERT INTO public.games VALUES (18, 72, 224, 225);
INSERT INTO public.games VALUES (19, 72, 335, 336);
INSERT INTO public.games VALUES (20, 71, 78, 81);
INSERT INTO public.games VALUES (21, 71, 448, 449);
INSERT INTO public.games VALUES (22, 71, 22, 23);
INSERT INTO public.games VALUES (23, 73, 517, 518);
INSERT INTO public.games VALUES (24, 73, 573, 574);
INSERT INTO public.games VALUES (25, 74, 224, 225);
INSERT INTO public.games VALUES (26, 74, 149, 150);
INSERT INTO public.games VALUES (27, 73, 81, 84);
INSERT INTO public.games VALUES (28, 73, 573, 574);
INSERT INTO public.games VALUES (29, 73, 396, 397);
INSERT INTO public.games VALUES (30, 75, 78, 79);
INSERT INTO public.games VALUES (31, 75, 905, 906);
INSERT INTO public.games VALUES (32, 76, 512, 513);
INSERT INTO public.games VALUES (33, 76, 53, 54);
INSERT INTO public.games VALUES (34, 75, 684, 687);
INSERT INTO public.games VALUES (35, 75, 821, 822);
INSERT INTO public.games VALUES (36, 75, 624, 625);
INSERT INTO public.games VALUES (37, 77, 972, 973);
INSERT INTO public.games VALUES (38, 77, 710, 711);
INSERT INTO public.games VALUES (39, 78, 331, 332);
INSERT INTO public.games VALUES (40, 78, 810, 811);
INSERT INTO public.games VALUES (41, 77, 661, 664);
INSERT INTO public.games VALUES (42, 77, 127, 128);
INSERT INTO public.games VALUES (43, 77, 835, 836);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1736346011874', 0, 0, 0, 0, 0);
INSERT INTO public.users VALUES (60, 'dsfsdf', 0, 10, 0, 0, 1);
INSERT INTO public.users VALUES (3, 'user_1736346011873', 0, 0, 0, 0, 0);
INSERT INTO public.users VALUES (8, 'Anton', 0, 0, 0, 0, 0);
INSERT INTO public.users VALUES (9, 'user_1736346079511', 0, 0, 0, 0, 0);
INSERT INTO public.users VALUES (11, 'user_1736346079510', 0, 0, 0, 0, 0);
INSERT INTO public.users VALUES (63, 'user_1736346290357', 0, 892, 0, 0, 1);
INSERT INTO public.users VALUES (16, 'user_1736346091006', 0, 0, 0, 0, 0);
INSERT INTO public.users VALUES (18, 'user_1736346091005', 0, 0, 0, 0, 0);
INSERT INTO public.users VALUES (61, 'user_1736346290358', 0, 566, 0, 0, 1);
INSERT INTO public.users VALUES (23, 'fdgd', 0, 0, 0, 0, 0);
INSERT INTO public.users VALUES (26, 'user_1736346206912', 0, 0, 0, 0, 1);
INSERT INTO public.users VALUES (70, 'user_1736346355154', 0, 207, 0, 0, 2);
INSERT INTO public.users VALUES (69, 'user_1736346355155', 0, 416, 0, 0, 5);
INSERT INTO public.users VALUES (24, 'user_1736346206913', 0, 0, 0, 0, 1);
INSERT INTO public.users VALUES (31, 'kyuk', 0, 0, 0, 0, 1);
INSERT INTO public.users VALUES (71, 'user_1736346370596', 0, 0, 0, 0, 0);
INSERT INTO public.users VALUES (72, 'user_1736346370595', 0, 0, 0, 0, 0);
INSERT INTO public.users VALUES (73, 'user_1736346377464', 0, 0, 0, 0, 0);
INSERT INTO public.users VALUES (74, 'user_1736346377463', 0, 0, 0, 0, 0);
INSERT INTO public.users VALUES (75, 'user_1736346380220', 0, 0, 0, 0, 0);
INSERT INTO public.users VALUES (34, 'user_1736346241744', 0, 42, 0, 0, 1);
INSERT INTO public.users VALUES (76, 'user_1736346380219', 0, 0, 0, 0, 0);
INSERT INTO public.users VALUES (77, 'user_1736346382891', 0, 0, 0, 0, 0);
INSERT INTO public.users VALUES (78, 'user_1736346382890', 0, 0, 0, 0, 0);
INSERT INTO public.users VALUES (32, 'user_1736346241745', 0, 214, 0, 0, 1);
INSERT INTO public.users VALUES (80, 'user_1736346391543', 0, 303, 0, 0, 2);
INSERT INTO public.users VALUES (41, 'user_1736346250752', 0, 283, 0, 0, 1);
INSERT INTO public.users VALUES (79, 'user_1736346391544', 0, 12, 0, 0, 5);
INSERT INTO public.users VALUES (39, 'user_1736346250753', 0, 376, 0, 0, 1);
INSERT INTO public.users VALUES (82, 'user_1736346593274', 0, 264, 0, 0, 2);
INSERT INTO public.users VALUES (48, 'user_1736346253675', 0, 11, 0, 0, 1);
INSERT INTO public.users VALUES (81, 'user_1736346593275', 0, 289, 0, 0, 5);
INSERT INTO public.users VALUES (46, 'user_1736346253676', 0, 128, 0, 0, 1);
INSERT INTO public.users VALUES (55, 'user_1736346255900', 0, 281, 0, 0, 1);
INSERT INTO public.users VALUES (53, 'user_1736346255902', 0, 278, 0, 0, 1);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 43, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 82, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games fk_users_games; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_users_games FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

