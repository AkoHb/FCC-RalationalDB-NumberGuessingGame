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
    user_id integer NOT NULL,
    guesses integer DEFAULT 0 NOT NULL
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
    username character varying(22) NOT NULL
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

INSERT INTO public.games VALUES (1, 2, 169);
INSERT INTO public.games VALUES (2, 2, 629);
INSERT INTO public.games VALUES (3, 3, 910);
INSERT INTO public.games VALUES (4, 3, 985);
INSERT INTO public.games VALUES (5, 2, 554);
INSERT INTO public.games VALUES (6, 2, 143);
INSERT INTO public.games VALUES (7, 2, 240);
INSERT INTO public.games VALUES (8, 1, 3);
INSERT INTO public.games VALUES (9, 1, 3);
INSERT INTO public.games VALUES (10, 4, 232);
INSERT INTO public.games VALUES (11, 4, 673);
INSERT INTO public.games VALUES (12, 5, 898);
INSERT INTO public.games VALUES (13, 5, 333);
INSERT INTO public.games VALUES (14, 4, 771);
INSERT INTO public.games VALUES (15, 4, 478);
INSERT INTO public.games VALUES (16, 4, 913);
INSERT INTO public.games VALUES (17, 1, 1);
INSERT INTO public.games VALUES (18, 1, 1);
INSERT INTO public.games VALUES (19, 1, 4);
INSERT INTO public.games VALUES (20, 6, 309);
INSERT INTO public.games VALUES (21, 6, 613);
INSERT INTO public.games VALUES (22, 7, 367);
INSERT INTO public.games VALUES (23, 7, 969);
INSERT INTO public.games VALUES (24, 6, 631);
INSERT INTO public.games VALUES (25, 6, 142);
INSERT INTO public.games VALUES (26, 6, 406);
INSERT INTO public.games VALUES (27, 8, 397);
INSERT INTO public.games VALUES (28, 8, 422);
INSERT INTO public.games VALUES (29, 9, 498);
INSERT INTO public.games VALUES (30, 9, 659);
INSERT INTO public.games VALUES (31, 8, 151);
INSERT INTO public.games VALUES (32, 8, 804);
INSERT INTO public.games VALUES (33, 8, 257);
INSERT INTO public.games VALUES (34, 10, 638);
INSERT INTO public.games VALUES (35, 10, 401);
INSERT INTO public.games VALUES (36, 11, 970);
INSERT INTO public.games VALUES (37, 11, 340);
INSERT INTO public.games VALUES (38, 10, 738);
INSERT INTO public.games VALUES (39, 10, 319);
INSERT INTO public.games VALUES (40, 10, 446);
INSERT INTO public.games VALUES (41, 12, 3);
INSERT INTO public.games VALUES (42, 13, 525);
INSERT INTO public.games VALUES (43, 13, 979);
INSERT INTO public.games VALUES (44, 14, 89);
INSERT INTO public.games VALUES (45, 14, 703);
INSERT INTO public.games VALUES (46, 13, 381);
INSERT INTO public.games VALUES (47, 13, 703);
INSERT INTO public.games VALUES (48, 13, 287);
INSERT INTO public.games VALUES (49, 15, 892);
INSERT INTO public.games VALUES (50, 15, 381);
INSERT INTO public.games VALUES (51, 16, 588);
INSERT INTO public.games VALUES (52, 16, 398);
INSERT INTO public.games VALUES (53, 15, 575);
INSERT INTO public.games VALUES (54, 15, 579);
INSERT INTO public.games VALUES (55, 15, 11);
INSERT INTO public.games VALUES (56, 17, 269);
INSERT INTO public.games VALUES (57, 17, 746);
INSERT INTO public.games VALUES (58, 18, 866);
INSERT INTO public.games VALUES (59, 18, 794);
INSERT INTO public.games VALUES (60, 17, 218);
INSERT INTO public.games VALUES (61, 17, 662);
INSERT INTO public.games VALUES (62, 17, 593);
INSERT INTO public.games VALUES (63, 19, 152);
INSERT INTO public.games VALUES (64, 19, 782);
INSERT INTO public.games VALUES (65, 20, 290);
INSERT INTO public.games VALUES (66, 20, 175);
INSERT INTO public.games VALUES (67, 19, 986);
INSERT INTO public.games VALUES (68, 19, 79);
INSERT INTO public.games VALUES (69, 19, 914);
INSERT INTO public.games VALUES (70, 21, 319);
INSERT INTO public.games VALUES (71, 22, 356);
INSERT INTO public.games VALUES (72, 21, 100);
INSERT INTO public.games VALUES (73, 21, 545);
INSERT INTO public.games VALUES (74, 21, 610);
INSERT INTO public.games VALUES (75, 23, 888);
INSERT INTO public.games VALUES (76, 23, 418);
INSERT INTO public.games VALUES (77, 24, 302);
INSERT INTO public.games VALUES (78, 24, 404);
INSERT INTO public.games VALUES (79, 23, 905);
INSERT INTO public.games VALUES (80, 23, 595);
INSERT INTO public.games VALUES (81, 23, 663);
INSERT INTO public.games VALUES (82, 26, 841);
INSERT INTO public.games VALUES (83, 26, 526);
INSERT INTO public.games VALUES (84, 27, 952);
INSERT INTO public.games VALUES (85, 27, 562);
INSERT INTO public.games VALUES (86, 26, 426);
INSERT INTO public.games VALUES (87, 26, 603);
INSERT INTO public.games VALUES (88, 26, 800);
INSERT INTO public.games VALUES (89, 28, 61);
INSERT INTO public.games VALUES (90, 28, 897);
INSERT INTO public.games VALUES (91, 29, 338);
INSERT INTO public.games VALUES (92, 29, 752);
INSERT INTO public.games VALUES (93, 28, 376);
INSERT INTO public.games VALUES (94, 28, 252);
INSERT INTO public.games VALUES (95, 28, 493);
INSERT INTO public.games VALUES (96, 30, 179);
INSERT INTO public.games VALUES (97, 30, 674);
INSERT INTO public.games VALUES (98, 31, 116);
INSERT INTO public.games VALUES (99, 31, 144);
INSERT INTO public.games VALUES (100, 30, 597);
INSERT INTO public.games VALUES (101, 30, 636);
INSERT INTO public.games VALUES (102, 30, 398);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Landon');
INSERT INTO public.users VALUES (2, 'user_1736005385450');
INSERT INTO public.users VALUES (3, 'user_1736005385449');
INSERT INTO public.users VALUES (4, 'user_1736005667723');
INSERT INTO public.users VALUES (5, 'user_1736005667722');
INSERT INTO public.users VALUES (6, 'user_1736005878829');
INSERT INTO public.users VALUES (7, 'user_1736005878828');
INSERT INTO public.users VALUES (8, 'user_1736006039206');
INSERT INTO public.users VALUES (9, 'user_1736006039205');
INSERT INTO public.users VALUES (10, 'user_1736006098450');
INSERT INTO public.users VALUES (11, 'user_1736006098449');
INSERT INTO public.users VALUES (12, 'Ldfsf');
INSERT INTO public.users VALUES (13, 'user_1736006228662');
INSERT INTO public.users VALUES (14, 'user_1736006228661');
INSERT INTO public.users VALUES (15, 'user_1736006277838');
INSERT INTO public.users VALUES (16, 'user_1736006277837');
INSERT INTO public.users VALUES (17, 'user_1736006347676');
INSERT INTO public.users VALUES (18, 'user_1736006347675');
INSERT INTO public.users VALUES (19, 'user_1736006374540');
INSERT INTO public.users VALUES (20, 'user_1736006374539');
INSERT INTO public.users VALUES (21, 'user_1736006436884');
INSERT INTO public.users VALUES (22, 'user_1736006436883');
INSERT INTO public.users VALUES (23, 'user_1736006476747');
INSERT INTO public.users VALUES (24, 'user_1736006476746');
INSERT INTO public.users VALUES (25, 'Anton');
INSERT INTO public.users VALUES (26, 'user_1736006659607');
INSERT INTO public.users VALUES (27, 'user_1736006659606');
INSERT INTO public.users VALUES (28, 'user_1736006747222');
INSERT INTO public.users VALUES (29, 'user_1736006747221');
INSERT INTO public.users VALUES (30, 'user_1736006790447');
INSERT INTO public.users VALUES (31, 'user_1736006790446');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 102, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 31, true);


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

