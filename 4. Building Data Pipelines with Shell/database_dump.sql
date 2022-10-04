--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-1.pgdg18.04+1)

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
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    username character varying(50),
    userid integer,
    homedirectory character varying(100)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (username, userid, homedirectory) FROM stdin;
root	0	/root
daemon	1	/usr/sbin
bin	2	/bin
sys	3	/dev
sync	4	/bin
games	5	/usr/games
man	6	/var/cache/man
lp	7	/var/spool/lpd
mail	8	/var/mail
news	9	/var/spool/news
uucp	10	/var/spool/uucp
proxy	13	/bin
www-data	33	/var/www
backup	34	/var/backups
list	38	/var/list
irc	39	/var/run/ircd
gnats	41	/var/lib/gnats
nobody	65534	/nonexistent
_apt	100	/nonexistent
messagebus	101	/nonexistent
theia	1000	/home/theia
mongodb	102	/var/lib/mongodb
ntp	103	/nonexistent
cassandra	104	/var/lib/cassandra
postgres	105	/var/lib/postgresql
\.


--
-- PostgreSQL database dump complete
--

