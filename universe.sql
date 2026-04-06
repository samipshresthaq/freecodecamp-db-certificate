--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    total_stars integer,
    total_planets integer,
    galaxy_life numeric(3,1),
    has_habitable_zone boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    total_craters integer,
    radius integer,
    area numeric(3,1),
    has_rocks boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    total_moon integer,
    radius integer,
    area numeric(3,1),
    is_habitable boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satelite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satelite (
    satelite_id integer NOT NULL,
    name character varying(80) NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.satelite OWNER TO freecodecamp;

--
-- Name: satelite_satelite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satelite_satelite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satelite_satelite_id_seq OWNER TO freecodecamp;

--
-- Name: satelite_satelite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satelite_satelite_id_seq OWNED BY public.satelite.satelite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    planet_count integer,
    radius integer,
    distance_from_earth numeric(3,1),
    has_planets boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satelite satelite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite ALTER COLUMN satelite_id SET DEFAULT nextval('public.satelite_satelite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 'A barred spiral galaxy containing Solar System', 9999, 99999, 8.1, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest galaxy to Milky way', 99, 922, 9.2, false);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'Spiral galaxy', 123, 444, 5.2, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Bright spiral galaxy with cenntral bulge', 777, 239, 12.8, false);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Third largest memeber', 4321, 1234, 8.2, false);
INSERT INTO public.galaxy VALUES (6, 'Black eye galaxy', 'Has spectacular dark band of dust', 999999, 2, 99.9, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'A moon', 5185, 1737, 37.9, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'A moon', 17, 11, 15.7, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'A moon', 2, 6, 49.5, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'A moon', 0, 1822, 41.7, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'A moon', 41, 1561, 30.6, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'A moon', 131, 2634, 87.0, false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A moon', 141, 2410, 73.0, false, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'A moon', 2, 84, 87.6, false, 5);
INSERT INTO public.moon VALUES (9, 'Mimas', 'A moon', 35, 198, 49.4, false, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'A moon', 53, 252, 80.0, false, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', 'A moon', 50, 533, 35.7, false, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 'A moon', 73, 562, 39.6, false, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', 'A moon', 128, 764, 73.3, false, 6);
INSERT INTO public.moon VALUES (14, 'Titan', 'A moon', 11, 2575, 83.0, false, 6);
INSERT INTO public.moon VALUES (15, 'Hyperion', 'A moon', 4, 135, 22.9, false, 6);
INSERT INTO public.moon VALUES (16, 'Iapetus', 'A moon', 58, 734, 67.7, false, 6);
INSERT INTO public.moon VALUES (17, 'Miranda', 'A moon', 7, 236, 70.0, false, 8);
INSERT INTO public.moon VALUES (18, 'Ariel', 'A moon', 17, 579, 42.1, false, 8);
INSERT INTO public.moon VALUES (19, 'Titania', 'A moon', 15, 788, 78.2, false, 8);
INSERT INTO public.moon VALUES (20, 'Triton', 'A moon', 9, 1353, 23.0, false, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'First planet', 0, 2240, 7.5, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Second planet', 0, 6052, 46.1, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Third planet', 1, 6371, 50.1, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Fourth planet', 2, 3390, 14.4, false, 1);
INSERT INTO public.planet VALUES (5, 'Neptune', 'Eight planet', 16, 24622, 76.1, false, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', 'Fifth planet', 95, 69911, 61.4, false, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 'Sixth planet', 274, 58232, 42.7, false, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Seventh Planet', 28, 25362, 81.1, false, 1);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 'A planet', 0, 1, 1.1, false, 4);
INSERT INTO public.planet VALUES (13, 'Kepler-22b', 'A planet', 0, 2, 5.7, false, 4);
INSERT INTO public.planet VALUES (14, 'WASP-39b', 'A planet', 0, 1, 18.4, false, 2);
INSERT INTO public.planet VALUES (15, 'Kepler-1625b-i (Exomoon)', 'A planet', 0, 4, 18.5, false, 3);


--
-- Data for Name: satelite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satelite VALUES (1, 'ISS', 3);
INSERT INTO public.satelite VALUES (2, 'Hubble Space', 3);
INSERT INTO public.satelite VALUES (3, 'Sputnik 1', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Star of solar system', 8, 695, 93.0, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'A Star', 3, 1, 4.2, true, 1);
INSERT INTO public.star VALUES (3, 'Barnards Star', 'A Star', 4, 1, 6.0, true, 1);
INSERT INTO public.star VALUES (4, 'TRAPPIST-1', 'A Star', 7, 1, 39.5, true, 1);
INSERT INTO public.star VALUES (5, '51 Pegasi', 'A Star', 1, 11, 50.9, true, 1);
INSERT INTO public.star VALUES (6, 'Epsilon Eridani', 'A Star', 1, 11, 10.5, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: satelite_satelite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satelite_satelite_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: satelite name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: satelite pk_satelite_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite
    ADD CONSTRAINT pk_satelite_id PRIMARY KEY (satelite_id);


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
-- Name: satelite satelite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite
    ADD CONSTRAINT satelite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

