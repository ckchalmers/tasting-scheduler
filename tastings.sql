--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: tastings; Type: TABLE; Schema: public; Owner: cchalmers
--

CREATE TABLE public.tastings (
    tasting_id integer NOT NULL,
    date date NOT NULL,
    "time" time without time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.tastings OWNER TO cchalmers;

--
-- Name: tastings_tasting_id_seq; Type: SEQUENCE; Schema: public; Owner: cchalmers
--

CREATE SEQUENCE public.tastings_tasting_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tastings_tasting_id_seq OWNER TO cchalmers;

--
-- Name: tastings_tasting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cchalmers
--

ALTER SEQUENCE public.tastings_tasting_id_seq OWNED BY public.tastings.tasting_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: cchalmers
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.users OWNER TO cchalmers;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: cchalmers
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO cchalmers;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cchalmers
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: tastings tasting_id; Type: DEFAULT; Schema: public; Owner: cchalmers
--

ALTER TABLE ONLY public.tastings ALTER COLUMN tasting_id SET DEFAULT nextval('public.tastings_tasting_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: cchalmers
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: tastings; Type: TABLE DATA; Schema: public; Owner: cchalmers
--

COPY public.tastings (tasting_id, date, "time", user_id) FROM stdin;
1	2022-07-23	09:00:00	\N
2	2022-07-23	09:30:00	\N
3	2022-07-23	10:00:00	\N
4	2022-07-23	10:30:00	\N
5	2022-07-23	11:00:00	\N
6	2022-07-23	11:30:00	\N
7	2022-07-23	12:00:00	\N
8	2022-07-23	12:30:00	\N
9	2022-07-23	01:00:00	\N
10	2022-07-23	01:30:00	\N
11	2022-07-23	02:00:00	\N
12	2022-07-23	02:30:00	\N
13	2022-07-23	03:00:00	\N
14	2022-07-23	03:30:00	\N
15	2022-07-23	04:00:00	\N
16	2022-07-23	04:30:00	\N
17	2022-07-24	09:00:00	\N
18	2022-07-24	09:30:00	\N
19	2022-07-24	10:00:00	\N
20	2022-07-24	10:30:00	\N
21	2022-07-24	11:00:00	\N
22	2022-07-24	11:30:00	\N
23	2022-07-24	12:00:00	\N
24	2022-07-24	12:30:00	\N
25	2022-07-24	01:00:00	\N
26	2022-07-24	01:30:00	\N
27	2022-07-24	02:00:00	\N
28	2022-07-24	02:30:00	\N
29	2022-07-24	03:00:00	\N
30	2022-07-24	03:30:00	\N
31	2022-07-24	04:00:00	\N
32	2022-07-24	04:30:00	\N
33	2022-07-25	09:00:00	\N
34	2022-07-25	09:30:00	\N
35	2022-07-25	10:00:00	\N
36	2022-07-25	10:30:00	\N
37	2022-07-25	11:00:00	\N
38	2022-07-25	11:30:00	\N
39	2022-07-25	12:00:00	\N
40	2022-07-25	12:30:00	\N
41	2022-07-25	01:00:00	\N
42	2022-07-25	01:30:00	\N
43	2022-07-25	02:00:00	\N
44	2022-07-25	02:30:00	\N
45	2022-07-25	03:00:00	\N
46	2022-07-25	03:30:00	\N
47	2022-07-25	04:00:00	\N
48	2022-07-25	04:30:00	\N
49	2022-07-26	09:00:00	\N
50	2022-07-26	09:30:00	\N
51	2022-07-26	10:00:00	\N
52	2022-07-26	10:30:00	\N
53	2022-07-26	11:00:00	\N
54	2022-07-26	11:30:00	\N
55	2022-07-26	12:00:00	\N
56	2022-07-26	12:30:00	\N
57	2022-07-26	01:00:00	\N
58	2022-07-26	01:30:00	\N
59	2022-07-26	02:00:00	\N
60	2022-07-26	02:30:00	\N
61	2022-07-26	03:00:00	\N
62	2022-07-26	03:30:00	\N
63	2022-07-26	04:00:00	\N
64	2022-07-26	04:30:00	\N
65	2022-07-27	09:00:00	\N
66	2022-07-27	09:30:00	\N
67	2022-07-27	10:00:00	\N
68	2022-07-27	10:30:00	\N
69	2022-07-27	11:00:00	\N
70	2022-07-27	11:30:00	\N
71	2022-07-27	12:00:00	\N
72	2022-07-27	12:30:00	\N
73	2022-07-27	01:00:00	\N
74	2022-07-27	01:30:00	\N
75	2022-07-27	02:00:00	\N
76	2022-07-27	02:30:00	\N
77	2022-07-27	03:00:00	\N
78	2022-07-27	03:30:00	\N
79	2022-07-27	04:00:00	\N
80	2022-07-27	04:30:00	\N
81	2022-07-28	09:00:00	\N
82	2022-07-28	09:30:00	\N
83	2022-07-28	10:00:00	\N
84	2022-07-28	10:30:00	\N
85	2022-07-28	11:00:00	\N
86	2022-07-28	11:30:00	\N
87	2022-07-28	12:00:00	\N
88	2022-07-28	12:30:00	\N
89	2022-07-28	01:00:00	\N
90	2022-07-28	01:30:00	\N
91	2022-07-28	02:00:00	\N
92	2022-07-28	02:30:00	\N
93	2022-07-28	03:00:00	\N
94	2022-07-28	03:30:00	\N
95	2022-07-28	04:00:00	\N
96	2022-07-28	04:30:00	\N
97	2022-07-29	09:00:00	\N
98	2022-07-29	09:30:00	\N
99	2022-07-29	10:00:00	\N
100	2022-07-29	10:30:00	\N
101	2022-07-29	11:00:00	\N
102	2022-07-29	11:30:00	\N
103	2022-07-29	12:00:00	\N
104	2022-07-29	12:30:00	\N
105	2022-07-29	01:00:00	\N
106	2022-07-29	01:30:00	\N
107	2022-07-29	02:00:00	\N
108	2022-07-29	02:30:00	\N
109	2022-07-29	03:00:00	\N
110	2022-07-29	03:30:00	\N
111	2022-07-29	04:00:00	\N
112	2022-07-29	04:30:00	\N
113	2022-07-30	09:00:00	\N
114	2022-07-30	09:30:00	\N
115	2022-07-30	10:00:00	\N
116	2022-07-30	10:30:00	\N
117	2022-07-30	11:00:00	\N
118	2022-07-30	11:30:00	\N
119	2022-07-30	12:00:00	\N
120	2022-07-30	12:30:00	\N
121	2022-07-30	01:00:00	\N
122	2022-07-30	01:30:00	\N
123	2022-07-30	02:00:00	\N
124	2022-07-30	02:30:00	\N
125	2022-07-30	03:00:00	\N
126	2022-07-30	03:30:00	\N
127	2022-07-30	04:00:00	\N
128	2022-07-30	04:30:00	\N
129	2022-07-31	09:00:00	\N
130	2022-07-31	09:30:00	\N
131	2022-07-31	10:00:00	\N
132	2022-07-31	10:30:00	\N
133	2022-07-31	11:00:00	\N
134	2022-07-31	11:30:00	\N
135	2022-07-31	12:00:00	\N
136	2022-07-31	12:30:00	\N
137	2022-07-31	01:00:00	\N
138	2022-07-31	01:30:00	\N
139	2022-07-31	02:00:00	\N
140	2022-07-31	02:30:00	\N
141	2022-07-31	03:00:00	\N
142	2022-07-31	03:30:00	\N
143	2022-07-31	04:00:00	\N
144	2022-07-31	04:30:00	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: cchalmers
--

COPY public.users (user_id, name) FROM stdin;
1	Gene
2	Emily
3	Rich
4	Andra
5	Lisa
6	Kevin
7	Bea
8	Franklin
9	Frank
10	Neha
11	Austin
12	Megg
13	Mark
14	Patrick
15	Adam
16	Viv
17	Caryn
18	Kathleen
19	Lesley
20	Christine
\.


--
-- Name: tastings_tasting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cchalmers
--

SELECT pg_catalog.setval('public.tastings_tasting_id_seq', 144, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cchalmers
--

SELECT pg_catalog.setval('public.users_user_id_seq', 20, true);


--
-- Name: tastings tastings_pkey; Type: CONSTRAINT; Schema: public; Owner: cchalmers
--

ALTER TABLE ONLY public.tastings
    ADD CONSTRAINT tastings_pkey PRIMARY KEY (tasting_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: cchalmers
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: tastings tastings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cchalmers
--

ALTER TABLE ONLY public.tastings
    ADD CONSTRAINT tastings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

