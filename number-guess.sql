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

DROP DATABASE games;
--
-- Name: games; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE games WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE games OWNER TO freecodecamp;

\connect games

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
    user_id integer,
    game_id integer NOT NULL,
    number_of_guesses integer
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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_user_id_seq OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_user_id_seq OWNED BY public.players.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN user_id SET DEFAULT nextval('public.players_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (34, 2, 6);
INSERT INTO public.games VALUES (34, 3, 8);
INSERT INTO public.games VALUES (34, 4, 2);
INSERT INTO public.games VALUES (35, 5, 3);
INSERT INTO public.games VALUES (34, 6, 8);
INSERT INTO public.games VALUES (35, 7, 1);
INSERT INTO public.games VALUES (35, 8, 1);
INSERT INTO public.games VALUES (36, 9, 258);
INSERT INTO public.games VALUES (36, 10, 154);
INSERT INTO public.games VALUES (37, 11, 347);
INSERT INTO public.games VALUES (37, 12, 334);
INSERT INTO public.games VALUES (36, 13, 155);
INSERT INTO public.games VALUES (36, 14, 628);
INSERT INTO public.games VALUES (36, 15, 580);
INSERT INTO public.games VALUES (38, 16, 19);
INSERT INTO public.games VALUES (38, 17, 852);
INSERT INTO public.games VALUES (39, 18, 814);
INSERT INTO public.games VALUES (39, 19, 886);
INSERT INTO public.games VALUES (38, 20, 49);
INSERT INTO public.games VALUES (38, 21, 35);
INSERT INTO public.games VALUES (38, 22, 388);
INSERT INTO public.games VALUES (40, 23, 689);
INSERT INTO public.games VALUES (40, 24, 561);
INSERT INTO public.games VALUES (41, 25, 536);
INSERT INTO public.games VALUES (41, 26, 761);
INSERT INTO public.games VALUES (40, 27, 96);
INSERT INTO public.games VALUES (40, 28, 233);
INSERT INTO public.games VALUES (40, 29, 421);
INSERT INTO public.games VALUES (42, 30, 926);
INSERT INTO public.games VALUES (42, 31, 765);
INSERT INTO public.games VALUES (43, 32, 312);
INSERT INTO public.games VALUES (43, 33, 726);
INSERT INTO public.games VALUES (42, 34, 130);
INSERT INTO public.games VALUES (42, 35, 786);
INSERT INTO public.games VALUES (42, 36, 276);
INSERT INTO public.games VALUES (44, 37, 280);
INSERT INTO public.games VALUES (44, 38, 726);
INSERT INTO public.games VALUES (45, 39, 415);
INSERT INTO public.games VALUES (45, 40, 78);
INSERT INTO public.games VALUES (44, 41, 434);
INSERT INTO public.games VALUES (44, 42, 639);
INSERT INTO public.games VALUES (44, 43, 375);
INSERT INTO public.games VALUES (46, 44, 441);
INSERT INTO public.games VALUES (46, 45, 459);
INSERT INTO public.games VALUES (47, 46, 847);
INSERT INTO public.games VALUES (47, 47, 756);
INSERT INTO public.games VALUES (46, 48, 255);
INSERT INTO public.games VALUES (46, 49, 516);
INSERT INTO public.games VALUES (46, 50, 836);
INSERT INTO public.games VALUES (48, 51, 215);
INSERT INTO public.games VALUES (48, 52, 335);
INSERT INTO public.games VALUES (49, 53, 657);
INSERT INTO public.games VALUES (49, 54, 379);
INSERT INTO public.games VALUES (48, 55, 420);
INSERT INTO public.games VALUES (48, 56, 537);
INSERT INTO public.games VALUES (48, 57, 261);
INSERT INTO public.games VALUES (50, 58, 810);
INSERT INTO public.games VALUES (50, 59, 125);
INSERT INTO public.games VALUES (51, 60, 651);
INSERT INTO public.games VALUES (51, 61, 37);
INSERT INTO public.games VALUES (50, 62, 861);
INSERT INTO public.games VALUES (50, 63, 869);
INSERT INTO public.games VALUES (50, 64, 606);
INSERT INTO public.games VALUES (52, 65, 670);
INSERT INTO public.games VALUES (52, 66, 816);
INSERT INTO public.games VALUES (53, 67, 264);
INSERT INTO public.games VALUES (53, 68, 81);
INSERT INTO public.games VALUES (52, 69, 820);
INSERT INTO public.games VALUES (52, 70, 892);
INSERT INTO public.games VALUES (52, 71, 751);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (34, 'Robin');
INSERT INTO public.players VALUES (35, 'Rob');
INSERT INTO public.players VALUES (36, 'user_1750082966176');
INSERT INTO public.players VALUES (37, 'user_1750082966175');
INSERT INTO public.players VALUES (38, 'user_1750082999133');
INSERT INTO public.players VALUES (39, 'user_1750082999132');
INSERT INTO public.players VALUES (40, 'user_1750083066560');
INSERT INTO public.players VALUES (41, 'user_1750083066559');
INSERT INTO public.players VALUES (42, 'user_1750083132492');
INSERT INTO public.players VALUES (43, 'user_1750083132491');
INSERT INTO public.players VALUES (44, 'user_1750083183463');
INSERT INTO public.players VALUES (45, 'user_1750083183462');
INSERT INTO public.players VALUES (46, 'user_1750083211992');
INSERT INTO public.players VALUES (47, 'user_1750083211991');
INSERT INTO public.players VALUES (48, 'user_1750083236147');
INSERT INTO public.players VALUES (49, 'user_1750083236146');
INSERT INTO public.players VALUES (50, 'user_1750083252877');
INSERT INTO public.players VALUES (51, 'user_1750083252876');
INSERT INTO public.players VALUES (52, 'user_1750083277760');
INSERT INTO public.players VALUES (53, 'user_1750083277759');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 71, true);


--
-- Name: players_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_user_id_seq', 53, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.players(user_id);


--
-- PostgreSQL database dump complete
--

