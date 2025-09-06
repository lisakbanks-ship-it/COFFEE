--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 14.17 (Ubuntu 14.17-0ubuntu0.22.04.1)

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

--
-- Name: COFFEE; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "COFFEE";


ALTER SCHEMA "COFFEE" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    product_name character varying(100) NOT NULL,
    description text,
    price numeric(10,2),
    product_type_id integer NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_id_seq OWNER TO postgres;

--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- Name: product_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_type (
    product_type_id integer NOT NULL,
    product_type_name character varying(50) NOT NULL
);


ALTER TABLE public.product_type OWNER TO postgres;

--
-- Name: product_type_product_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_type_product_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_type_product_type_id_seq OWNER TO postgres;

--
-- Name: product_type_product_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_type_product_type_id_seq OWNED BY public.product_type.product_type_id;


--
-- Name: sales_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_detail (
    sales_detail_id integer NOT NULL,
    transaction_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.sales_detail OWNER TO postgres;

--
-- Name: sales_detail_sales_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_detail_sales_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_detail_sales_detail_id_seq OWNER TO postgres;

--
-- Name: sales_detail_sales_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_detail_sales_detail_id_seq OWNED BY public.sales_detail.sales_detail_id;


--
-- Name: sales_transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_transaction (
    transaction_id integer NOT NULL,
    customer_id integer NOT NULL,
    transaction_date date NOT NULL
);


ALTER TABLE public.sales_transaction OWNER TO postgres;

--
-- Name: sales_transaction_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_transaction_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_transaction_transaction_id_seq OWNER TO postgres;

--
-- Name: sales_transaction_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_transaction_transaction_id_seq OWNED BY public.sales_transaction.transaction_id;


--
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- Name: product_type product_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type ALTER COLUMN product_type_id SET DEFAULT nextval('public.product_type_product_type_id_seq'::regclass);


--
-- Name: sales_detail sales_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_detail ALTER COLUMN sales_detail_id SET DEFAULT nextval('public.sales_detail_sales_detail_id_seq'::regclass);


--
-- Name: sales_transaction transaction_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_transaction ALTER COLUMN transaction_id SET DEFAULT nextval('public.sales_transaction_transaction_id_seq'::regclass);


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_id, product_name, description, price, product_type_id) FROM stdin;
1	Espresso Single Shot	Strong espresso shot	3.50	1
2	Vanilla Latte	Creamy latte with vanilla syrup	4.75	2
\.


--
-- Data for Name: product_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_type (product_type_id, product_type_name) FROM stdin;
1	Espresso
2	Latte
3	Tea
\.


--
-- Data for Name: sales_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_detail (sales_detail_id, transaction_id, product_id, quantity, price) FROM stdin;
1	1	1	2	3.50
2	2	2	1	4.75
\.


--
-- Data for Name: sales_transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_transaction (transaction_id, customer_id, transaction_date) FROM stdin;
1	101	2024-06-01
2	102	2024-06-02
\.


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_id_seq', 2, true);


--
-- Name: product_type_product_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_type_product_type_id_seq', 3, true);


--
-- Name: sales_detail_sales_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_detail_sales_detail_id_seq', 2, true);


--
-- Name: sales_transaction_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_transaction_transaction_id_seq', 2, true);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- Name: product_type product_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type
    ADD CONSTRAINT product_type_pkey PRIMARY KEY (product_type_id);


--
-- Name: sales_detail sales_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_detail
    ADD CONSTRAINT sales_detail_pkey PRIMARY KEY (sales_detail_id);


--
-- Name: sales_transaction sales_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_transaction
    ADD CONSTRAINT sales_transaction_pkey PRIMARY KEY (transaction_id);


--
-- Name: product product_product_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_product_type_id_fkey FOREIGN KEY (product_type_id) REFERENCES public.product_type(product_type_id);


--
-- Name: sales_detail sales_detail_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_detail
    ADD CONSTRAINT sales_detail_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- Name: sales_detail sales_detail_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_detail
    ADD CONSTRAINT sales_detail_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.sales_transaction(transaction_id);


--
-- PostgreSQL database dump complete
--

