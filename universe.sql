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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: celestial_dwarf; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_dwarf (
    name character varying NOT NULL,
    celestial_dwarf_id integer NOT NULL,
    radius integer NOT NULL,
    solar_system character varying
);


ALTER TABLE public.celestial_dwarf OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    age integer,
    radius numeric,
    cluster character varying
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying NOT NULL,
    moon_id integer NOT NULL,
    age integer,
    radius numeric,
    solar_system character varying,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    age integer,
    radius numeric,
    has_life boolean,
    description text,
    solar_system character varying,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying NOT NULL,
    star_id integer NOT NULL,
    age integer,
    radius numeric,
    giant boolean,
    solar_system character varying,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: celestial_dwarf; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_dwarf VALUES ('Pluto', 1, 3, NULL);
INSERT INTO public.celestial_dwarf VALUES ('Eris', 2, 3, NULL);
INSERT INTO public.celestial_dwarf VALUES ('Haumea', 3, 3, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 27000, 100000, 'Virgo');
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 27000, 100000, 'Virgo');
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 27000, 100000, 'Virgo');
INSERT INTO public.galaxy VALUES ('Canis Major', 4, 27000, 100000, 'Virgo');
INSERT INTO public.galaxy VALUES ('Sagittarius', 5, 27000, 100000, 'Virgo');
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud ', 6, 27000, 100000, 'Virgo');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES ('Phobos', 2, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES ('Deimos', 3, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES ('Io', 4, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES ('Europa', 5, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES ('Ganymede', 6, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES ('Callistop', 7, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES ('Titan', 8, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES ('Rhea', 9, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES ('Iapetus', 10, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES ('Dione', 11, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES ('Tethys', 12, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES ('Enceladus', 13, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES ('Miranda', 14, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES ('Ariel', 15, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES ('Umbriel', 16, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES ('Titania', 17, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES ('Oberon', 18, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES ('Triton', 19, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES ('Nereid', 20, NULL, NULL, NULL, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Venus', 2, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Earth', 3, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Mars', 4, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Jupiter', 5, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Saturn', 6, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Uranus', 7, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Neptune', 8, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 9, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('Proxima Centauri c', 10, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('Barnard star b', 11, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES ('Proxima centauri x', 12, NULL, NULL, NULL, NULL, NULL, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('', 1, 5, 1390000000, NULL, NULL, 1);
INSERT INTO public.star VALUES ('Proxima Centauri', 2, 5, 97000, NULL, NULL, 1);
INSERT INTO public.star VALUES ('Alpha Centauri A', 3, 5, 860000, NULL, NULL, 1);
INSERT INTO public.star VALUES ('Alpha Centauri B', 4, 5, 600000, NULL, NULL, 1);
INSERT INTO public.star VALUES ('Barnards Star', 5, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES ('Wolf 359', 6, NULL, NULL, NULL, NULL, 1);


--
-- Name: celestial_dwarf celestial_dwarf_celestial_dwarf_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_dwarf
    ADD CONSTRAINT celestial_dwarf_celestial_dwarf_id_key UNIQUE (celestial_dwarf_id);


--
-- Name: celestial_dwarf celestial_dwarf_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_dwarf
    ADD CONSTRAINT celestial_dwarf_name_key UNIQUE (name);


--
-- Name: celestial_dwarf celestial_dwarf_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_dwarf
    ADD CONSTRAINT celestial_dwarf_name_key1 UNIQUE (name);


--
-- Name: celestial_dwarf celestial_dwarf_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_dwarf
    ADD CONSTRAINT celestial_dwarf_pkey PRIMARY KEY (celestial_dwarf_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

