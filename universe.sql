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
-- Name: asteroids; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroids (
    asteroids_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer
);


ALTER TABLE public.asteroids OWNER TO freecodecamp;

--
-- Name: asteroids_asteroids_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroids_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroids_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_asteroids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroids_id_seq OWNED BY public.asteroids.asteroids_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    distance_from_earth numeric,
    description text NOT NULL,
    estimated_billion_years numeric
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
    name character varying(60) NOT NULL,
    distance_from_earth_in_ly numeric NOT NULL,
    description text NOT NULL,
    planet_id integer
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
    name character varying(60) NOT NULL,
    bigger_than_earth boolean,
    has_atmosphere boolean NOT NULL,
    number_of_moons integer,
    star_id integer
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
    name character varying(60) NOT NULL,
    distance_from_earth_in_ly numeric NOT NULL,
    description text NOT NULL,
    size_in_sunradius integer NOT NULL,
    galaxy_id integer
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
-- Name: asteroids asteroids_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids ALTER COLUMN asteroids_id SET DEFAULT nextval('public.asteroids_asteroids_id_seq'::regclass);


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
-- Data for Name: asteroids; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroids VALUES (1, 'Asteroid 1724 Vladimir', 'This asteroid is named in honor of Vladimir Baade, the grandson of the famous astronomer Walter Baade. Walter Baade was the first person to resolve individual stars in the central region of the Andromeda Galaxy in 1943. He used his observations of M31 to identify two distinct "populations" of stars, which changed our entire understanding of how galaxies evolve.', 2);
INSERT INTO public.asteroids VALUES (2, 'Asteroid 2014 JO25', 'In 2017, this large asteroid "photo-bombed" the Black Eye Galaxy (M64). As astronomers were taking long-exposure photos of the galaxys beautiful dust lanes, this asteroid zoomed across the foreground, leaving a bright white streak of light right in front of the 17-million-light-year-old galaxy.', 4);
INSERT INTO public.asteroids VALUES (3, 'Asteroid 3672 Stevedavis', 'This asteroid is related to the modern observation of the Pinwheel Galaxy. Many asteroids are discovered by "amateur" astronomers or automated surveys looking at the same patches of sky where these famous galaxies reside. Steve Davis was a contributor to sky surveys that monitor galaxies like M101 for supernovae (exploding stars). Because M101 is "face-on" and very active, it is a primary target for these observers.', 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, 'A large barred spiral galaxy containing 100–400 billion stars. It has a central "bar" of stars and several spiral arms; our solar system is located in the smaller Orion Arm.', 13.6);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 2537000.056, 'The closest major galaxy to the Milky Way and the largest in our Local Group. It is a massive spiral galaxy on a slow-motion collision course with us, set to merge with the Milky Way in about 4 billion years.', 10.1);
INSERT INTO public.galaxy VALUES (3, 'Cigar Galaxy', 11415000.743, 'A famous starburst galaxy in the constellation Ursa Major. It is called the "Cigar" because of its long, thin shape. It is producing new stars 10 times faster than the Milky Way due to a gravitational "tug-of-war" with its neighbor, M81.', 13.3);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 17280000.393, 'Named for the spectacular dark band of dust at its center that looks like a "black eye" or "bruise." Interestingly, the gas in its outer regions rotates in the opposite direction of the gas in its inner regions.', 12.0);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 20870000.932, 'A "grand design" spiral galaxy that is nearly double the size of the Milky Way. It is perfectly "face-on" from our perspective, meaning we see its beautiful, winding spiral arms and bright star-forming regions in full detail.', 12.8);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 29350000.702, 'Known for its brilliant white core and a thick, dark dust lane that makes it look like a wide-brimmed Mexican hat. It is a very bright galaxy that can be seen even with small amateur telescopes.', 13.1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Hi iaka', 0.000773, 'It is the larger and brighter of the two. Its surface is unique because it is covered in nearly pure crystalline water ice, which is very rare in the outer solar system.', 12);
INSERT INTO public.moon VALUES (2, 'Namaka', 0.000773, 'Namaka is only about 1/10 the mass of Hi iaka. Because of its proximity to both the massive Hi iaka and the strangely elongated (football-shaped) Haumea, its orbit is very chaotic and changes shape over time.', 12);
INSERT INTO public.moon VALUES (3, 'Io (The Volcanic Moon)', 0.000000067, 'Io is the most volcanically active body in our solar system. Caught in a gravitational tug-of-war between Jupiter and other moons, its interior is constantly heated by friction. This results in hundreds of active volcanoes that blast plumes of sulfur dozens of miles into space, giving the moon a yellow, red, and moldy pizza appearance.', 8);
INSERT INTO public.moon VALUES (4, 'Europa (The Ocean Moon)', 0.000000067, 'Europa is a world of ice and mystery. Its surface is a frozen crust of water ice, incredibly smooth and crisscrossed by reddish-brown cracks called lineae. Beneath this shell lies a global saltwater ocean containing more than twice the amount of water found in all of Earths oceans, making it a top candidate for finding extraterrestrial life.', 8);
INSERT INTO public.moon VALUES (5, 'Titan (The Giant Moon)', 0.000000157, 'Titan is the second-largest moon in the solar system (larger than the planet Mercury). It is the only moon known to have a dense atmosphere and the only place besides Earth with stable bodies of liquid (methane and ethane) on its surface in the form of rivers, lakes, and seas.', 9);
INSERT INTO public.moon VALUES (6, 'Enceladus (The Geyser Moon)', 0.000000157, 'Enceladus is a small, icy world that is the most reflective object in the solar system. It is famous for cryovolcanic geysers at its south pole that spray water vapor and ice particles into space, creating Saturns E ring. Beneath its frozen shell lies a global saltwater ocean that scientists believe could potentially host life.', 9);
INSERT INTO public.moon VALUES (7, 'The Moon', 0.0000000406, 'The Moon is a rocky, "differentiated" world, meaning it has internal layers similar to Earth: a crust, a mantle, and a core.', 7);
INSERT INTO public.moon VALUES (8, 'Phobos', 0.000000028, 'A small, lumpy moon that looks like a space potato. It orbits Mars so closely that it will eventually be torn apart by gravity or crash into the planet in about 50 million years.', 11);
INSERT INTO public.moon VALUES (13, 'Enceladus', 0.000000157, 'A small, brilliant-white moon that sprays giant geysers of water vapor and ice from its south pole into space.', 9);
INSERT INTO public.moon VALUES (14, 'Iapetus', 0.000000157, 'Known as the "yin-yang" moon because one half is pitch black and the other is snow white. It also has a strange mountain ridge that runs exactly along its equator.', 9);
INSERT INTO public.moon VALUES (15, 'Valetudo', 0.000000069, 'A "collision waiting to happen." This tiny moon orbits Jupiter in the prograde direction but is surrounded by dozens of other moons moving in the opposite direction. It is like a car driving the wrong way on a highway.', 8);
INSERT INTO public.moon VALUES (16, 'S/2021 J 1', 0.000000069, 'One of the newest and most distant members of Jupiters family. It belongs to the Ananke group, a cluster of rocks that are likely fragments of a much larger moon that was shattered by a collision billions of years ago.', 8);
INSERT INTO public.moon VALUES (20, 'Alvaldi', 0.000000159, 'One of the "new" moons of Saturn announced in 2019. It is part of the Norse group of moons, which are thought to be debris from a massive moon that was shattered in a collision billions of years ago.', 9);
INSERT INTO public.moon VALUES (9, 'Charon', 0.000000558, 'This moon is so large compared to Pluto that the two actually orbit each other like a "double planet" system.', 3);
INSERT INTO public.moon VALUES (10, 'Dysnomia', 0.000001518, 'A distant moon orbiting the dwarf planet Eris. It is located in the cold, dark region of the scattered disc far beyond Pluto.', 3);
INSERT INTO public.moon VALUES (11, 'Weywot', 0.000662, 'Weywot orbits the dwarf planet Quaoar. Quaoar is unique because it has a ring system that sits much farther out than scientists thought was physically possible. Weywot likely helps shepherd the particles in these strange rings.', 4);
INSERT INTO public.moon VALUES (12, 'Vanth', 0.000755, 'Vanth orbits Orcus, a dwarf planet often called the "Anti-Pluto" because its orbit is a mirror image of Plutos. Vanth is unusually large compared to Orcus (about half its size), making the two look more like a "double planet" system than a moon and a planet.', 4);
INSERT INTO public.moon VALUES (17, 'Ferdinand', 0.000000305, 'The most distant moon of Uranus. It orbits nearly 21 million km away from its planet. Because it is so far out, it takes about 7.7 Earth years to complete just one trip around Uranus.', 5);
INSERT INTO public.moon VALUES (18, 'Psamathe', 0.000000481, 'One of the most distant moons in the entire solar system relative to its planet. It orbits Neptune at a distance of 46.7 million km. Its orbit is so vast and slow that if you lived on Psamathe, you would only see a "New Moon" once every 25 years.', 2);
INSERT INTO public.moon VALUES (19, 'Xiangliu', 0.001407, 'Orbiting the dwarf planet Gonggong (named after a Chinese water god), this moon is extremely far out, near the edge of the Scattered Disc. It is roughly 100 km in diameter and was discovered using archival Hubble images.', 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'PA-99-N2 b', true, true, 95, 2);
INSERT INTO public.planet VALUES (3, 'The Ghost', true, false, NULL, 3);
INSERT INTO public.planet VALUES (4, 'Retrograde World', true, true, NULL, 4);
INSERT INTO public.planet VALUES (5, 'Scorched Giant', true, false, 0, 5);
INSERT INTO public.planet VALUES (6, 'Ancient Terrestrial', false, true, 1, 6);
INSERT INTO public.planet VALUES (1, 'S-Star Rogue', true, false, 0, 1);
INSERT INTO public.planet VALUES (7, 'Earth', NULL, true, 1, 1);
INSERT INTO public.planet VALUES (8, 'Jupiter', true, true, 95, 1);
INSERT INTO public.planet VALUES (9, 'Saturn', true, true, 274, 1);
INSERT INTO public.planet VALUES (10, 'Venus', false, true, 0, 1);
INSERT INTO public.planet VALUES (11, 'Mars', false, true, 2, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', false, false, 2, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'S2 (S0-2)', 26673.212, 'A high-velocity B-type star that orbits the supermassive black hole at the center of our galaxy. It is used by scientists to test Einsteins Theory of General Relativity.', 12000, 1);
INSERT INTO public.star VALUES (2, 'V1 (Hubble Variable 1)', 2536000.768, 'A Cepheid variable star. Its rhythmic pulsing allowed Edwin Hubble to calculate the distance to Andromeda, proving for the first time that other galaxies exist outside our own.', 45000, 2);
INSERT INTO public.star VALUES (3, 'SN 2014J', 11415000.737, 'This was a Type Ia supernova—the explosion of a white dwarf. It is the closest standard candle supernova observed in recent decades, helping refine our cosmic distance markers.', 1, 3);
INSERT INTO public.star VALUES (4, 'Inner Disk Star (Average)', 17286000.847, 'While individual stars are not named, the dense inner disk stars are unique because they orbit in the opposite direction of the galaxys outer edge due to an ancient galactic merger.', 1050, 4);
INSERT INTO public.star VALUES (5, 'SN 2023ixf', 20874000.000, 'A spectacular Type II supernova that was discovered in May 2023. Before its collapse, the star was a Red Supergiant that had reached the very end of its life cycle.', 730000, 5);
INSERT INTO public.star VALUES (6, 'Globular Cluster Star (Average)', 29354000.006, 'These stars reside in the Sombreros massive system of nearly 2,000 globular clusters. Most are ancient, metal-poor stars that have been burning since the early universe.', 1, 6);


--
-- Name: asteroids_asteroids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroids_id_seq', 3, true);


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
-- Name: asteroids asteroids_asteroids_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_asteroids_id_key UNIQUE (asteroids_id);


--
-- Name: asteroids asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroids_id);


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
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


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
-- Name: asteroids asteroids_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

