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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_ly integer,
    age numeric,
    num_stars integer NOT NULL,
    is_near boolean,
    has_associated_planet boolean,
    description text
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
    mass integer,
    distance_from_planet integer,
    resource_value numeric,
    is_habitable boolean,
    has_atmosphere boolean,
    planet_id integer,
    description text
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
    mass integer,
    distance_from_star integer,
    gravity numeric,
    is_habitable boolean,
    is_resource_rich boolean,
    star_id integer,
    description text
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
-- Name: ship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.ship (
    ship_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mass integer,
    crew_capacity integer,
    max_safe_acceleration numeric,
    is_friendly boolean,
    is_federation boolean,
    planet_id integer NOT NULL,
    description text
);


ALTER TABLE public.ship OWNER TO freecodecamp;

--
-- Name: ship_ship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.ship_ship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ship_ship_id_seq OWNER TO freecodecamp;

--
-- Name: ship_ship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.ship_ship_id_seq OWNED BY public.ship.ship_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_ly integer,
    diameter_km integer,
    temperature numeric,
    is_supernova boolean,
    has_associated_planet boolean,
    galaxy_id integer,
    description text
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
-- Name: ship ship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ship ALTER COLUMN ship_id SET DEFAULT nextval('public.ship_ship_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 13.2, 200000000, true, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 150000, 12.8, 300000000, false, true, 'Nearest spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 290000, 10.5, 100000000, false, false, 'Unusual galaxy with a distinct appearance');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 310000, 11.7, 120000000, true, false, 'Known for its interaction with a smaller galaxy');
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 290000, 8.5, 70000000, false, true, 'Third-largest galaxy in the Local Group');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 540000, 10.3, 80000000, false, false, 'Located in the Virgo Cluster');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (65, 'Luna', 7347673, 384400, 0.5, false, false, 13, 'Earth''s natural satellite');
INSERT INTO public.moon VALUES (66, 'Deimos', 14760, 23460, 0.05, false, false, 15, 'Mars''s smaller moon');
INSERT INTO public.moon VALUES (67, 'Phobos', 101260, 9376, 0.1, false, false, 15, 'Mars''s larger moon');
INSERT INTO public.moon VALUES (68, 'Ganymede', 14819, 1070400, 0.25, false, true, 18, 'Largest moon in the Solar System');
INSERT INTO public.moon VALUES (69, 'Callisto', 10759, 1882700, 0.2, false, false, 18, 'Jupiter''s heavily cratered moon');
INSERT INTO public.moon VALUES (70, 'Io', 8932, 421700, 0.15, false, true, 18, 'Jupiter''s volcanic moon');
INSERT INTO public.moon VALUES (71, 'Europa', 4800, 670900, 0.3, true, true, 18, 'Jupiter''s icy moon with subsurface ocean');
INSERT INTO public.moon VALUES (72, 'Rhea', 2309, 527108, 0.18, false, false, 21, 'Saturn''s second-largest moon');
INSERT INTO public.moon VALUES (73, 'Iapetus', 1805, 3560820, 0.07, false, false, 21, 'Saturn''s third-largest moon');
INSERT INTO public.moon VALUES (74, 'Enceladus', 108, 238020, 0.35, true, true, 21, 'Saturn''s icy moon with active geysers');
INSERT INTO public.moon VALUES (75, 'Titan', 13455, 1221865, 0.4, false, true, 21, 'Saturn''s largest moon with thick atmosphere');
INSERT INTO public.moon VALUES (76, 'Miranda', 6592, 129390, 0.1, false, false, 22, 'Uranus''s small, icy moon');
INSERT INTO public.moon VALUES (77, 'Ariel', 1343, 190900, 0.2, false, false, 23, 'Uranus''s second-largest moon');
INSERT INTO public.moon VALUES (78, 'Umbriel', 1169, 266000, 0.17, false, false, 23, 'Uranus''s third-largest moon');
INSERT INTO public.moon VALUES (79, 'Titania', 3520, 435910, 0.12, false, false, 23, 'Uranus''s largest moon by diameter');
INSERT INTO public.moon VALUES (80, 'Triton', 21410, 354759, 0.1, false, true, 19, 'Neptune''s largest moon');
INSERT INTO public.moon VALUES (81, 'Nereid', 67, 5513400, 0.03, false, false, 19, 'Neptune''s third-largest moon');
INSERT INTO public.moon VALUES (82, 'Charon', 1580, 19591, 0.2, false, false, 24, 'Pluto''s largest moon');
INSERT INTO public.moon VALUES (83, 'Styx', 22, 42300, 0.03, false, false, 24, 'Small moon of Pluto');
INSERT INTO public.moon VALUES (84, 'Nix', 45, 42300, 0.02, false, false, 24, 'Small moon of Pluto');
INSERT INTO public.moon VALUES (85, 'Kerberos', 13, 59000, 0.03, false, false, 24, 'Small moon of Pluto');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Earth', 597200, 1, 9.8, true, true, 1, 'Home planet of humans');
INSERT INTO public.planet VALUES (14, 'Proxima b', 1270000, 0, 8.6, false, false, 2, 'Exoplanet in the habitable zone of Proxima Centauri');
INSERT INTO public.planet VALUES (15, 'Mars', 63900, 2, 3.7, false, false, 1, 'Known as the Red Planet');
INSERT INTO public.planet VALUES (16, 'Venus', 487000, 1, 8.87, false, false, 3, 'Known for its thick atmosphere');
INSERT INTO public.planet VALUES (17, 'Kepler-452b', 2940000, 1, 3.68, true, false, 4, 'Potentially habitable exoplanet in the Cygnus constellation');
INSERT INTO public.planet VALUES (18, 'Jupiter', 189800000, 5, 24.79, false, false, 3, 'Largest planet in the Solar System');
INSERT INTO public.planet VALUES (19, 'Neptune', 10240000, 30, 11.15, false, false, 2, 'Ice giant in the Solar System');
INSERT INTO public.planet VALUES (20, 'Gliese 581 d', 620000, 0, 0.949, true, false, 4, 'Exoplanet within the habitable zone of Gliese 581');
INSERT INTO public.planet VALUES (21, 'Saturn', 56830000, 9, 10.44, false, false, 1, 'Known for its distinctive rings');
INSERT INTO public.planet VALUES (22, 'HD 209458 b', 229000, 0, 8.9, false, false, 2, 'First exoplanet detected transiting a star');
INSERT INTO public.planet VALUES (23, 'Uranus', 8681000, 19, 8.69, false, false, 4, 'Seventh planet from the Sun');
INSERT INTO public.planet VALUES (24, 'TRAPPIST-1 e', 353000, 0, 0.932, true, false, 3, 'One of the TRAPPIST-1 exoplanets in the habitable zone');


--
-- Data for Name: ship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.ship VALUES (1, 'Starship Voyager', 700000, 200, 2.5, true, true, 14, 'Federation starship on a mission in the Delta Quadrant');
INSERT INTO public.ship VALUES (2, 'Millennium Falcon', 100000, 6, 10.0, true, false, 13, 'Legendary Corellian light freighter');
INSERT INTO public.ship VALUES (3, 'USS Enterprise', 725000, 1500, 3.0, true, true, 16, 'Flagship of Starfleet and exploration in space');
INSERT INTO public.ship VALUES (4, 'Serenity', 580000, 9, 1.5, true, false, 15, 'Firefly-class spaceship used for smuggling and transport');
INSERT INTO public.ship VALUES (5, 'Nostromo', 1680000, 7, 0.5, false, false, 17, 'Commercial towing vehicle turned into a spacecraft for deep space exploration');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0, 1392000, 5778, false, true, 1, 'Our solar system''s central star');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4, 196548, 3042, false, true, 2, 'Closest known star to the Sun');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 643, 950000, 3500, true, false, 1, 'Red supergiant in Orion constellation');
INSERT INTO public.star VALUES (4, 'Sirius', 9, 167236, 9940, false, true, 3, 'Brightest star in the night sky');
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 4, 196300, 5790, false, true, 2, 'Primary star in the Alpha Centauri system');
INSERT INTO public.star VALUES (6, 'Vega', 25, 236184, 9602, false, false, 4, 'Fifth-brightest star in the night sky');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 85, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: ship_ship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.ship_ship_id_seq', 5, true);


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
-- Name: ship ship_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ship
    ADD CONSTRAINT ship_name_key UNIQUE (name);


--
-- Name: ship ship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ship
    ADD CONSTRAINT ship_pkey PRIMARY KEY (ship_id);


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
-- Name: ship ship_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ship
    ADD CONSTRAINT ship_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

