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
-- Name: dark_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dark_hole (
    dark_hole_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size integer,
    mass integer,
    galaxy_id integer
);


ALTER TABLE public.dark_hole OWNER TO freecodecamp;

--
-- Name: dark_hole_dark_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dark_hole_dark_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dark_hole_dark_hole_id_seq OWNER TO freecodecamp;

--
-- Name: dark_hole_dark_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dark_hole_dark_hole_id_seq OWNED BY public.dark_hole.dark_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    galaxy_type character varying(255) NOT NULL,
    size integer,
    rotation_speed integer
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
    name character varying(255) NOT NULL,
    is_habitable boolean NOT NULL,
    distance_from_planet numeric,
    planet_id integer,
    mass integer
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
    name character varying(255) NOT NULL,
    distance_from_earth numeric,
    planet_type character varying(255) NOT NULL,
    star_id integer,
    mass integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_millions_of_year integer,
    is_spherical boolean NOT NULL,
    galaxy_id integer,
    temperature integer
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
-- Name: dark_hole dark_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dark_hole ALTER COLUMN dark_hole_id SET DEFAULT nextval('public.dark_hole_dark_hole_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: dark_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dark_hole VALUES (1, 'Sagitario', 44, NULL, 1);
INSERT INTO public.dark_hole VALUES (2, 'Cygnus', 15, NULL, 2);
INSERT INTO public.dark_hole VALUES (3, 'M87', 7, NULL, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'ViaLactea', 'Es la galaxia donde vivimos', true, 'SBbc', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'La galaxia de andromeda es la galaxia mas grande del grupo local y se encuentra a 2.5 millones de anos luz', false, 'Espiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Galaxia del triangulo', 'La galaxia del triangulo es otra galaxia espiral del grupo local', false, 'Espiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Galaxia de Whirlpool', 'Es una galaxia espiral en interaccion con una pequena galaxia satelite', false, 'Espiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Galaxia del sombrero', 'La galaxia del sombrero es una galaxia eliptica vista de frente, lo que le da su caracteristica forma de sombrero', false, 'Eliptica', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Galaxia del cigarro', 'Es una galaxia irregular y perturbada por la interaccio gravitacional con su vecina', false, 'Irregular', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Io', false, 422, 5, NULL);
INSERT INTO public.moon VALUES (2, 'Europa', true, 671, 5, NULL);
INSERT INTO public.moon VALUES (3, 'Ganimedes', true, 1070, 5, NULL);
INSERT INTO public.moon VALUES (4, 'Calixto', true, 1882, 5, NULL);
INSERT INTO public.moon VALUES (5, 'Titan', false, 1221, 6, NULL);
INSERT INTO public.moon VALUES (6, 'Encelado', true, 238, 6, NULL);
INSERT INTO public.moon VALUES (7, 'Titania', false, 436, 7, NULL);
INSERT INTO public.moon VALUES (8, 'Oberon', false, 583, 7, NULL);
INSERT INTO public.moon VALUES (9, 'Triton', false, 354, 8, NULL);
INSERT INTO public.moon VALUES (10, 'Proteo', false, 117, 8, NULL);
INSERT INTO public.moon VALUES (11, 'Fobos', false, 9, 4, NULL);
INSERT INTO public.moon VALUES (12, 'Deimos', false, 23, 4, NULL);
INSERT INTO public.moon VALUES (13, 'Caronte', false, 19, 12, NULL);
INSERT INTO public.moon VALUES (14, 'Rea', false, 527, 6, NULL);
INSERT INTO public.moon VALUES (15, 'Dione', false, 377, 6, NULL);
INSERT INTO public.moon VALUES (16, 'Ariel', false, 191, 7, NULL);
INSERT INTO public.moon VALUES (17, 'Miranda', false, 129, 7, NULL);
INSERT INTO public.moon VALUES (18, 'Nereida', false, 5513, 8, NULL);
INSERT INTO public.moon VALUES (19, 'Larisa', false, 11135, 8, NULL);
INSERT INTO public.moon VALUES (20, 'Galatea', false, 15266, 8, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 57000000, 'Rocoso', 1, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 108000000, 'Rocoso', 1, NULL);
INSERT INTO public.planet VALUES (3, 'Tierra', 149000000, 'Rocoso', 1, NULL);
INSERT INTO public.planet VALUES (4, 'Marte', 227000000, 'Rocoso', 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupite', 778000000, 'Gigante Gaseoso', 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturno', 1400000000, 'Gigante Gaseoso', 1, NULL);
INSERT INTO public.planet VALUES (7, 'Urano', 2900000000, 'Gigante Gaseoso', 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptuno', 4500000000, 'Gigante Gaseoso', 1, NULL);
INSERT INTO public.planet VALUES (9, 'Alfa Centauri A b', 6000000, 'Rocoso', 2, NULL);
INSERT INTO public.planet VALUES (10, 'Alfa Centauri A c', 23000000, 'Rocoso', 2, NULL);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 7500000000, 'Rocoso', 4, NULL);
INSERT INTO public.planet VALUES (12, 'Pluton', 5900000000, 'Planeta Enano', 1, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 4600, true, 1, NULL);
INSERT INTO public.star VALUES (2, 'Alfa Centauri A', 6000, true, 1, NULL);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8, false, 1, NULL);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 4850, true, 1, NULL);
INSERT INTO public.star VALUES (5, 'Sirio', 200, true, 1, NULL);
INSERT INTO public.star VALUES (6, 'Pola', 50, true, 1, NULL);


--
-- Name: dark_hole_dark_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dark_hole_dark_hole_id_seq', 33, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: dark_hole dark_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dark_hole
    ADD CONSTRAINT dark_hole_name_key UNIQUE (name);


--
-- Name: dark_hole dark_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dark_hole
    ADD CONSTRAINT dark_hole_pkey PRIMARY KEY (dark_hole_id);


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
-- Name: dark_hole dark_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dark_hole
    ADD CONSTRAINT dark_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

