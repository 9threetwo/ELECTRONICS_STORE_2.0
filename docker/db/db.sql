--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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
-- Name: basket_devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket_devices (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "basketId" integer,
    "deviceId" integer
);


ALTER TABLE public.basket_devices OWNER TO postgres;

--
-- Name: basket_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basket_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basket_devices_id_seq OWNER TO postgres;

--
-- Name: basket_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basket_devices_id_seq OWNED BY public.basket_devices.id;


--
-- Name: basket_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket_products (
    quantity integer DEFAULT 1,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    basket_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.basket_products OWNER TO postgres;

--
-- Name: baskets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.baskets (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.baskets OWNER TO postgres;

--
-- Name: baskets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.baskets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.baskets_id_seq OWNER TO postgres;

--
-- Name: baskets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.baskets_id_seq OWNED BY public.baskets.id;


--
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_id_seq OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: device_infos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device_infos (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deviceId" integer
);


ALTER TABLE public.device_infos OWNER TO postgres;

--
-- Name: device_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.device_infos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_infos_id_seq OWNER TO postgres;

--
-- Name: device_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.device_infos_id_seq OWNED BY public.device_infos.id;


--
-- Name: devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    img character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "typeId" integer,
    "brandId" integer
);


ALTER TABLE public.devices OWNER TO postgres;

--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devices_id_seq OWNER TO postgres;

--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    order_id integer
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_id_seq OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    amount integer NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    comment character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: product_props; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_props (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    product_id integer
);


ALTER TABLE public.product_props OWNER TO postgres;

--
-- Name: product_props_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_props_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_props_id_seq OWNER TO postgres;

--
-- Name: product_props_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_props_id_seq OWNED BY public.product_props.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    rating integer DEFAULT 0,
    image character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    category_id integer,
    brand_id integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    rate integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    product_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- Name: type_brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_brands (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "typeId" integer,
    "brandId" integer
);


ALTER TABLE public.type_brands OWNER TO postgres;

--
-- Name: type_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_brands_id_seq OWNER TO postgres;

--
-- Name: type_brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_brands_id_seq OWNED BY public.type_brands.id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.types (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.types OWNER TO postgres;

--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_id_seq OWNER TO postgres;

--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    password character varying(255),
    role character varying(255) DEFAULT 'USER'::character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: basket_devices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_devices ALTER COLUMN id SET DEFAULT nextval('public.basket_devices_id_seq'::regclass);


--
-- Name: baskets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets ALTER COLUMN id SET DEFAULT nextval('public.baskets_id_seq'::regclass);


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: device_infos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_infos ALTER COLUMN id SET DEFAULT nextval('public.device_infos_id_seq'::regclass);


--
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: product_props id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props ALTER COLUMN id SET DEFAULT nextval('public.product_props_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: type_brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands ALTER COLUMN id SET DEFAULT nextval('public.type_brands_id_seq'::regclass);


--
-- Name: types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: basket_devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basket_devices (id, "createdAt", "updatedAt", "basketId", "deviceId") FROM stdin;
\.


--
-- Data for Name: basket_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basket_products (quantity, created_at, updated_at, basket_id, product_id) FROM stdin;
3	2022-12-12 21:04:02.86+03	2022-12-12 21:06:58.564+03	48	141
1	2022-12-12 21:07:03.41+03	2022-12-12 21:07:03.41+03	48	144
1	2022-12-12 21:07:11.825+03	2022-12-12 21:07:17.208+03	48	135
\.


--
-- Data for Name: baskets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.baskets (id, created_at, updated_at) FROM stdin;
3	2021-12-06 16:15:36.763+03	2021-12-06 16:15:36.763+03
4	2021-12-06 16:16:19.377+03	2021-12-06 16:16:19.377+03
5	2021-12-06 16:17:50.942+03	2021-12-06 16:17:50.942+03
6	2021-12-06 16:19:17.509+03	2021-12-06 16:19:17.509+03
7	2021-12-06 16:21:17.856+03	2021-12-06 16:21:17.856+03
8	2021-12-06 16:39:34.386+03	2021-12-06 16:39:34.386+03
9	2021-12-06 16:40:23.737+03	2021-12-06 16:40:23.737+03
10	2021-12-06 16:41:47.306+03	2021-12-06 16:41:47.306+03
11	2021-12-06 16:43:01.965+03	2021-12-06 16:43:01.965+03
12	2021-12-06 16:47:43.839+03	2021-12-06 16:47:43.839+03
13	2021-12-06 16:52:17.305+03	2021-12-06 16:52:17.305+03
14	2021-12-06 16:55:47.192+03	2021-12-06 16:55:47.192+03
15	2022-01-06 14:52:26.859+03	2022-01-06 14:52:26.859+03
16	2022-01-06 14:54:31.701+03	2022-01-06 14:54:31.701+03
17	2022-01-06 14:54:39.164+03	2022-01-06 14:54:39.164+03
18	2022-01-06 14:55:34.705+03	2022-01-06 14:55:34.705+03
19	2022-01-06 14:55:41.728+03	2022-01-06 14:55:41.728+03
20	2022-01-06 14:55:52.828+03	2022-01-06 14:55:52.828+03
21	2022-01-06 14:56:15.76+03	2022-01-06 14:56:15.76+03
22	2022-01-06 15:01:25.607+03	2022-01-06 15:01:25.607+03
23	2022-01-06 15:05:02.88+03	2022-01-06 15:05:02.88+03
24	2022-01-06 15:05:23.058+03	2022-01-06 15:05:23.058+03
25	2022-01-06 15:07:59.899+03	2022-01-06 15:07:59.899+03
26	2022-01-06 15:08:02.705+03	2022-01-06 15:08:02.705+03
27	2022-01-06 15:08:11.787+03	2022-01-06 15:08:11.787+03
28	2022-01-06 15:08:16.727+03	2022-01-06 15:08:16.727+03
29	2022-01-06 15:08:19.7+03	2022-01-06 15:08:19.7+03
30	2022-01-07 09:52:09.273+03	2022-01-07 09:52:09.273+03
31	2022-01-07 12:04:17.392+03	2022-01-07 12:04:17.392+03
32	2022-01-07 12:04:23.891+03	2022-01-07 12:04:23.891+03
33	2022-01-07 12:06:45.405+03	2022-01-07 12:06:45.405+03
34	2022-01-07 12:06:55.065+03	2022-01-07 12:06:55.065+03
35	2022-01-07 12:07:28.213+03	2022-01-07 12:07:28.213+03
36	2022-01-07 12:08:05.64+03	2022-01-07 12:08:05.64+03
37	2022-01-07 12:25:15.763+03	2022-01-07 12:25:15.763+03
38	2022-01-08 12:22:00.939+03	2022-01-08 12:22:00.939+03
39	2022-01-17 16:49:50.526+03	2022-01-17 16:49:50.526+03
40	2022-01-17 16:50:21.6+03	2022-01-17 16:50:21.6+03
41	2022-01-17 16:56:55.263+03	2022-01-17 16:56:55.263+03
42	2022-01-17 16:59:35.304+03	2022-01-17 16:59:35.304+03
43	2022-01-17 17:02:56.956+03	2022-01-17 17:02:56.956+03
44	2022-01-17 17:09:55.318+03	2022-01-17 17:09:55.318+03
45	2022-01-17 17:10:06.146+03	2022-01-17 17:10:06.146+03
46	2022-01-17 17:13:24.91+03	2022-01-17 17:13:24.91+03
47	2022-01-17 17:14:28.474+03	2022-01-17 17:14:28.474+03
48	2022-12-11 17:57:13.246+03	2022-12-11 17:57:13.246+03
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands (id, name, created_at, updated_at) FROM stdin;
4	Xiaomi	2021-12-31 11:53:03.331+03	2021-12-31 11:53:03.331+03
1	Samsung	2021-12-31 11:50:47.963+03	2022-02-05 11:21:22.579+03
2	Sony	2021-12-31 11:51:04.816+03	2022-12-11 18:16:12.798+03
3	Apple	2021-12-31 11:51:17.575+03	2022-12-11 18:16:21.276+03
18	JBL	2022-03-08 11:29:06.427+03	2022-12-11 18:16:31.068+03
19	Huawei	2022-12-11 18:16:41.921+03	2022-12-11 18:16:41.921+03
20	MSI	2022-12-11 19:13:27.314+03	2022-12-11 19:13:27.314+03
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, created_at, updated_at) FROM stdin;
2	Телевизоры	2021-12-31 11:48:04.716+03	2022-02-05 13:28:09.126+03
3	Смартфоны	2021-12-31 11:48:46.955+03	2022-02-14 09:36:07.926+03
4	Ноутбуки	2021-12-31 11:48:56.816+03	2022-12-11 18:14:44.42+03
16	Наушники	2022-03-08 11:06:14.264+03	2022-12-11 18:15:12.434+03
20	Аксессуары	2022-12-12 02:01:43.839+03	2022-12-12 02:01:43.839+03
21	Планшеты	2022-12-12 02:02:50.894+03	2022-12-12 02:02:50.894+03
\.


--
-- Data for Name: device_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_infos (id, title, description, "createdAt", "updatedAt", "deviceId") FROM stdin;
\.


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.devices (id, name, price, img, "createdAt", "updatedAt", "typeId", "brandId") FROM stdin;
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, name, price, quantity, created_at, updated_at, order_id) FROM stdin;
9	Ноутбук игровой MSI Delta	144999	1	2022-12-12 00:45:10.47+03	2022-12-12 00:45:10.47+03	5
10	Apple iPhone 14 Pro 512GB	139999	1	2022-12-12 00:45:10.475+03	2022-12-12 00:45:10.475+03	5
11	Sony WH-CH710N Bluetooth	9999	1	2022-12-12 00:45:10.477+03	2022-12-12 00:45:10.477+03	5
12	Sony KD-55A8	80500	1	2022-12-12 00:45:10.484+03	2022-12-12 00:45:10.484+03	5
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, name, email, phone, address, amount, status, comment, created_at, updated_at, user_id) FROM stdin;
5	Софья Говорова	user@mail.ru	+7 (123) 456-78-90	просп. Вернадского, 78, стр. 4	375497	0	Сообщить, когда товары будут готовы к выдаче	2022-12-12 00:45:10.444+03	2022-12-12 00:45:10.444+03	3
\.


--
-- Data for Name: product_props; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_props (id, name, value, created_at, updated_at, product_id) FROM stdin;
183	Диагональ/разрешение	13.3"/2560x1600 пикс.	2022-12-11 18:30:06.756+03	2022-12-11 18:30:06.756+03	116
184	Процессор	Apple M1	2022-12-11 18:30:06.778+03	2022-12-11 18:30:06.778+03	116
185	Оперативная память (RAM)	8 ГБ	2022-12-11 18:30:06.784+03	2022-12-11 18:30:06.784+03	116
186	Объем SSD	256 ГБ	2022-12-11 18:30:06.79+03	2022-12-11 18:30:06.79+03	116
187	Цвет	Серый космос	2022-12-11 18:30:06.797+03	2022-12-11 18:30:06.797+03	116
193	Диагональ/разрешение	13.6"/2560x1664 пикс.	2022-12-11 18:35:08.209+03	2022-12-11 18:35:08.209+03	123
194	Процессор	Apple M2 M2	2022-12-11 18:35:08.212+03	2022-12-11 18:35:08.212+03	123
195	Оперативная память (RAM)	8 ГБ	2022-12-11 18:35:08.214+03	2022-12-11 18:35:08.214+03	123
196	Объем SSD	256 ГБ	2022-12-11 18:35:08.215+03	2022-12-11 18:35:08.215+03	123
197	Цвет	Космический серый	2022-12-11 18:35:08.217+03	2022-12-11 18:35:08.217+03	123
198	Диагональ/разрешение	13.3"/2560x1600 пикс.	2022-12-11 18:37:27.612+03	2022-12-11 18:37:27.612+03	115
199	Процессор	Apple M1	2022-12-11 18:37:27.619+03	2022-12-11 18:37:27.619+03	115
200	Оперативная память (RAM)	8 ГБ	2022-12-11 18:37:27.624+03	2022-12-11 18:37:27.624+03	115
201	Объем SSD	256 ГБ	2022-12-11 18:37:27.63+03	2022-12-11 18:37:27.63+03	115
202	Цвет	Золотой	2022-12-11 18:37:27.634+03	2022-12-11 18:37:27.634+03	115
203	Диагональ/разрешение	13.6"/2560x1664 пикс.	2022-12-11 18:39:16.14+03	2022-12-11 18:39:16.14+03	121
204	Процессор	Apple M2 M2	2022-12-11 18:39:16.148+03	2022-12-11 18:39:16.148+03	121
205	Оперативная память (RAM)	8 ГБ	2022-12-11 18:39:16.154+03	2022-12-11 18:39:16.154+03	121
206	Объем SSD	256 ГБ	2022-12-11 18:39:16.159+03	2022-12-11 18:39:16.159+03	121
207	Цвет	Полночный черый	2022-12-11 18:39:16.164+03	2022-12-11 18:39:16.164+03	121
208	Диагональ/разрешение	14.2"/3024x1964 пикс.	2022-12-11 18:40:30.636+03	2022-12-11 18:40:30.636+03	118
209	Процессор	Apple M1 Pro	2022-12-11 18:40:30.642+03	2022-12-11 18:40:30.642+03	118
210	Оперативная память (RAM)	16 ГБ	2022-12-11 18:40:30.649+03	2022-12-11 18:40:30.649+03	118
211	Объем SSD	512 ГБ	2022-12-11 18:40:30.654+03	2022-12-11 18:40:30.654+03	118
212	Цвет	Серый космос	2022-12-11 18:40:30.659+03	2022-12-11 18:40:30.659+03	118
213	Диагональ/разрешение	13.3"/2560x1600 пикс.	2022-12-11 18:47:32.604+03	2022-12-11 18:47:32.604+03	124
214	Процессор	Apple M1	2022-12-11 18:47:32.608+03	2022-12-11 18:47:32.608+03	124
215	Оперативная память (RAM)	8 ГБ	2022-12-11 18:47:32.609+03	2022-12-11 18:47:32.609+03	124
216	Объем SSD	256 ГБ	2022-12-11 18:47:32.61+03	2022-12-11 18:47:32.61+03	124
217	Панель Touch Bar	Да	2022-12-11 18:47:32.611+03	2022-12-11 18:47:32.611+03	124
218	Цвет	Space Gray	2022-12-11 18:47:32.612+03	2022-12-11 18:47:32.612+03	124
219	Диагональ/разрешение	13.3"/2560x1600 пикс.	2022-12-11 18:49:50.636+03	2022-12-11 18:49:50.636+03	125
220	Процессор	Apple M2	2022-12-11 18:49:50.638+03	2022-12-11 18:49:50.638+03	125
221	Оперативная память (RAM)	8 ГБ	2022-12-11 18:49:50.639+03	2022-12-11 18:49:50.639+03	125
222	Объем SSD	512 ГБ	2022-12-11 18:49:50.641+03	2022-12-11 18:49:50.641+03	125
223	Панель Touch Bar	Да	2022-12-11 18:49:50.642+03	2022-12-11 18:49:50.642+03	125
224	Цвет	Космический серый	2022-12-11 18:49:50.643+03	2022-12-11 18:49:50.643+03	125
225	Диагональ/разрешение	16.2"/3456x2234 пикс.	2022-12-11 18:51:28.441+03	2022-12-11 18:51:28.441+03	126
226	Процессор	Apple M1 Pro	2022-12-11 18:51:28.446+03	2022-12-11 18:51:28.446+03	126
227	Оперативная память (RAM)	16 ГБ	2022-12-11 18:51:28.447+03	2022-12-11 18:51:28.447+03	126
228	Объем SSD	512 ГБ	2022-12-11 18:51:28.449+03	2022-12-11 18:51:28.449+03	126
229	Цвет	Серый космос	2022-12-11 18:51:28.451+03	2022-12-11 18:51:28.451+03	126
230	Диагональ/разрешение	15.6"/1920x1080 пикс.	2022-12-11 18:57:28.821+03	2022-12-11 18:57:28.821+03	127
231	Процессор	AMD Ryzen 5 5500U 2.1 ГГц	2022-12-11 18:57:28.835+03	2022-12-11 18:57:28.835+03	127
232	Оперативная память (RAM)	16 ГБ	2022-12-11 18:57:28.841+03	2022-12-11 18:57:28.841+03	127
233	Объем SSD	512 ГБ	2022-12-11 18:57:28.846+03	2022-12-11 18:57:28.846+03	127
234	Датчик отпечатков пальцев	Да	2022-12-11 18:57:28.858+03	2022-12-11 18:57:28.858+03	127
235	Операционная система	Windows 11 Домашняя	2022-12-11 18:57:28.862+03	2022-12-11 18:57:28.862+03	127
236	Диагональ/разрешение	15.6"/1920x1080 пикс.	2022-12-11 18:58:45.01+03	2022-12-11 18:58:45.01+03	128
237	Процессор	Intel Core i5 1135G7 2.4 ГГц	2022-12-11 18:58:45.013+03	2022-12-11 18:58:45.013+03	128
238	Оперативная память (RAM)	8 ГБ	2022-12-11 18:58:45.014+03	2022-12-11 18:58:45.014+03	128
239	Объем SSD	512 ГБ	2022-12-11 18:58:45.016+03	2022-12-11 18:58:45.016+03	128
240	Датчик отпечатков пальцев	Да	2022-12-11 18:58:45.017+03	2022-12-11 18:58:45.017+03	128
241	Операционная система	Windows 11	2022-12-11 18:58:45.017+03	2022-12-11 18:58:45.017+03	128
242	Диагональ/разрешение	14"/1920x1080 пикс.	2022-12-11 19:00:00.627+03	2022-12-11 19:00:00.627+03	129
243	Процессор	Intel Core i5 i5-1135G7 2.4 ГГц	2022-12-11 19:00:00.63+03	2022-12-11 19:00:00.63+03	129
244	Оперативная память (RAM)	8 ГБ	2022-12-11 19:00:00.635+03	2022-12-11 19:00:00.635+03	129
245	Объем SSD	512 ГБ	2022-12-11 19:00:00.636+03	2022-12-11 19:00:00.636+03	129
246	Датчик отпечатков пальцев	Да	2022-12-11 19:00:00.637+03	2022-12-11 19:00:00.637+03	129
247	Операционная система	Windows 11 Домашняя	2022-12-11 19:00:00.637+03	2022-12-11 19:00:00.637+03	129
248	Диагональ/разрешение	16"/1920x1200 пикс.	2022-12-11 19:01:27.8+03	2022-12-11 19:01:27.8+03	130
249	Процессор	Intel Core i7 12700H 2.3 ГГц	2022-12-11 19:01:27.805+03	2022-12-11 19:01:27.805+03	130
250	Оперативная память (RAM)	16 ГБ	2022-12-11 19:01:27.807+03	2022-12-11 19:01:27.807+03	130
251	Объем SSD	512 ГБ	2022-12-11 19:01:27.809+03	2022-12-11 19:01:27.809+03	130
252	Датчик отпечатков пальцев	Да	2022-12-11 19:01:27.811+03	2022-12-11 19:01:27.811+03	130
253	Операционная система	Windows 11 Домашняя 64	2022-12-11 19:01:27.812+03	2022-12-11 19:01:27.812+03	130
254	Диагональ/разрешение	16"/2520x1680 пикс.	2022-12-11 19:02:36.255+03	2022-12-11 19:02:36.255+03	131
255	Процессор	Intel Core i9 12900H 2.4 ГГц	2022-12-11 19:02:36.258+03	2022-12-11 19:02:36.258+03	131
256	Оперативная память (RAM)	16 ГБ	2022-12-11 19:02:36.259+03	2022-12-11 19:02:36.259+03	131
257	Объем SSD	1 ТБ	2022-12-11 19:02:36.261+03	2022-12-11 19:02:36.261+03	131
258	Датчик отпечатков пальцев	Да	2022-12-11 19:02:36.262+03	2022-12-11 19:02:36.262+03	131
259	Операционная система	Windows 11 Домашняя	2022-12-11 19:02:36.265+03	2022-12-11 19:02:36.265+03	131
260	Серия	Redmi Note 10 Pro	2022-12-11 19:09:43.767+03	2022-12-11 19:09:43.767+03	132
261	Модель	M2101K6G	2022-12-11 19:09:43.77+03	2022-12-11 19:09:43.77+03	132
262	Операционная система	Android 11	2022-12-11 19:09:43.773+03	2022-12-11 19:09:43.773+03	132
263	Экран	6.67"/2400x1080 Пикс	2022-12-11 19:09:43.774+03	2022-12-11 19:09:43.774+03	132
264	Оперативная память (RAM)	8 ГБ	2022-12-11 19:09:43.775+03	2022-12-11 19:09:43.775+03	132
265	Встроенная память (ROM)	128 ГБ	2022-12-11 19:09:43.777+03	2022-12-11 19:09:43.777+03	132
266	Серия	Redmi	2022-12-11 19:12:06.655+03	2022-12-11 19:12:06.655+03	133
267	Модель	9T	2022-12-11 19:12:06.659+03	2022-12-11 19:12:06.659+03	133
268	Операционная система	Android 10	2022-12-11 19:12:06.661+03	2022-12-11 19:12:06.661+03	133
269	Экран	6.53"/2340x1080 Пикс	2022-12-11 19:12:06.662+03	2022-12-11 19:12:06.662+03	133
270	Оперативная память (RAM)	4 ГБ	2022-12-11 19:12:06.663+03	2022-12-11 19:12:06.663+03	133
271	Встроенная память (ROM)	64 ГБ	2022-12-11 19:12:06.664+03	2022-12-11 19:12:06.664+03	133
272	Операционная система	Windows 11 Домашняя 64	2022-12-11 19:15:38.053+03	2022-12-11 19:15:38.053+03	134
273	Процессор	Intel Core i7 12700H 2.3 ГГц	2022-12-11 19:15:38.057+03	2022-12-11 19:15:38.057+03	134
274	Диагональ/разрешение	15.6"/1920x1080 пикс.	2022-12-11 19:15:38.058+03	2022-12-11 19:15:38.058+03	134
275	Оперативная память (RAM)	16 ГБ	2022-12-11 19:15:38.059+03	2022-12-11 19:15:38.059+03	134
276	Объем SSD	512 ГБ	2022-12-11 19:15:38.06+03	2022-12-11 19:15:38.06+03	134
277	Операционная система	Windows 10 Домашняя 64	2022-12-11 19:18:11.178+03	2022-12-11 19:18:11.178+03	135
278	Процессор	AMD Ryzen 7 5800H 3.2 ГГц	2022-12-11 19:18:11.18+03	2022-12-11 19:18:11.18+03	135
279	Диагональ/разрешение	15.6"/1920x1080 пикс.	2022-12-11 19:18:11.181+03	2022-12-11 19:18:11.181+03	135
280	Оперативная память (RAM)	16 ГБ	2022-12-11 19:18:11.182+03	2022-12-11 19:18:11.182+03	135
281	Объем SSD	1 ТБ	2022-12-11 19:18:11.183+03	2022-12-11 19:18:11.183+03	135
282	Серия	iPhone 14	2022-12-11 19:55:38.321+03	2022-12-11 19:55:38.321+03	136
283	Экран	6.1"/2532x1170 Пикс	2022-12-11 19:55:38.328+03	2022-12-11 19:55:38.328+03	136
284	Встроенная память (ROM	512 ГБ	2022-12-11 19:55:38.33+03	2022-12-11 19:55:38.33+03	136
285	Цвет	Голубой	2022-12-11 19:55:38.332+03	2022-12-11 19:55:38.332+03	136
286	Серия	iPhone 14	2022-12-11 19:57:48.614+03	2022-12-11 19:57:48.614+03	137
288	Экран	6.1"/2532x1170 Пикс	2022-12-11 19:57:48.62+03	2022-12-11 19:57:48.62+03	137
289	Встроенная память (ROM)	128 ГБ	2022-12-11 19:57:48.621+03	2022-12-11 19:57:48.621+03	137
290	Цвет	Фиолетовый	2022-12-11 19:57:48.623+03	2022-12-11 19:57:48.623+03	137
291	Серия	iPhone 14	2022-12-11 20:00:16.3+03	2022-12-11 20:00:16.3+03	138
292	Экран	6.1"/2532x1170 Пикс	2022-12-11 20:00:16.304+03	2022-12-11 20:00:16.304+03	138
293	Встроенная память (ROM)	256 ГБ	2022-12-11 20:00:16.305+03	2022-12-11 20:00:16.305+03	138
294	Цвет	Темная ночь	2022-12-11 20:00:16.306+03	2022-12-11 20:00:16.306+03	138
295	Серия	iPhone 14 Pro	2022-12-11 20:01:29.879+03	2022-12-11 20:01:29.879+03	139
296	Экран	6.1"/2556x1179 Пикс	2022-12-11 20:01:29.883+03	2022-12-11 20:01:29.883+03	139
297	Встроенная память (ROM)	256 ГБ	2022-12-11 20:01:29.884+03	2022-12-11 20:01:29.884+03	139
298	Цвет	Золотой	2022-12-11 20:01:29.885+03	2022-12-11 20:01:29.885+03	139
299	Серия	iPhone 14 Pro	2022-12-11 20:03:17.595+03	2022-12-11 20:03:17.595+03	141
300	Экран	6.1"/2556x1179 Пикс	2022-12-11 20:03:17.598+03	2022-12-11 20:03:17.598+03	141
301	Встроенная память (ROM)	512 ГБ	2022-12-11 20:03:17.599+03	2022-12-11 20:03:17.599+03	141
302	Цвет	Темно-фиолетовый	2022-12-11 20:03:17.6+03	2022-12-11 20:03:17.6+03	141
303	Серия	iPhone 14 Pro	2022-12-11 20:04:25.306+03	2022-12-11 20:04:25.306+03	142
304	Экран	6.1"/2556x1179 Пикс	2022-12-11 20:04:25.31+03	2022-12-11 20:04:25.31+03	142
305	Встроенная память (ROM)	128 ГБ	2022-12-11 20:04:25.311+03	2022-12-11 20:04:25.311+03	142
306	Цвет	Серебристый	2022-12-11 20:04:25.312+03	2022-12-11 20:04:25.312+03	142
307	Гарантия	1 год	2022-12-11 22:19:55.826+03	2022-12-11 22:19:55.826+03	143
308	Тип подключения наушников	беспроводной	2022-12-11 22:19:55.835+03	2022-12-11 22:19:55.835+03	143
309	Тип наушников	внутриканальные	2022-12-11 22:19:55.837+03	2022-12-11 22:19:55.837+03	143
310	Гарантия	1 год	2022-12-11 22:24:13.198+03	2022-12-11 22:24:13.198+03	144
311	Тип подключения наушников	беспроводной	2022-12-11 22:24:13.201+03	2022-12-11 22:24:13.201+03	144
312	Тип наушников	внутриканальные	2022-12-11 22:25:06.138+03	2022-12-11 22:25:06.138+03	144
313	Гарантия	1 год	2022-12-11 22:26:40.33+03	2022-12-11 22:26:40.33+03	145
314	Тип подключения наушников	беспроводной	2022-12-11 22:26:40.335+03	2022-12-11 22:26:40.335+03	145
315	Тип наушников	внутриканальные	2022-12-11 22:26:40.337+03	2022-12-11 22:26:40.337+03	145
316	Гарантия	1 год	2022-12-11 22:27:43.396+03	2022-12-11 22:27:43.396+03	146
317	Тип подключения наушников	беспроводной	2022-12-11 22:27:43.399+03	2022-12-11 22:27:43.399+03	146
318	Тип наушников	внутриканальные	2022-12-11 22:27:43.401+03	2022-12-11 22:27:43.401+03	146
319	Гарантия	1 год	2022-12-11 22:28:43.942+03	2022-12-11 22:28:43.942+03	147
320	Тип подключения наушников	проводной (Lightning)	2022-12-11 22:28:43.945+03	2022-12-11 22:28:43.945+03	147
321	Тип наушников	внутриканальные	2022-12-11 22:28:43.946+03	2022-12-11 22:28:43.946+03	147
322	Гарантия	1 год	2022-12-11 22:29:34.835+03	2022-12-11 22:29:34.835+03	148
323	Тип подключения наушников	проводной (Jack 3.5)	2022-12-11 22:29:34.839+03	2022-12-11 22:29:34.839+03	148
324	Тип наушников	внутриканальные	2022-12-11 22:29:34.84+03	2022-12-11 22:29:34.84+03	148
325	Гарантия	1 год	2022-12-11 22:30:36.166+03	2022-12-11 22:30:36.166+03	149
326	Тип подключения наушников	беспроводной	2022-12-11 22:30:36.17+03	2022-12-11 22:30:36.17+03	149
327	Тип наушников	вкладыши	2022-12-11 22:30:36.173+03	2022-12-11 22:30:36.173+03	149
328	Гарантия	1 год	2022-12-11 22:31:52.019+03	2022-12-11 22:31:52.019+03	150
329	Тип подключения наушников	беспроводной	2022-12-11 22:31:52.022+03	2022-12-11 22:31:52.022+03	150
330	Тип наушников	внутриканальные	2022-12-11 22:31:52.024+03	2022-12-11 22:31:52.024+03	150
331	Гарантия	1 год	2022-12-11 22:33:01.768+03	2022-12-11 22:33:01.768+03	151
332	Тип подключения наушников	беспроводной	2022-12-11 22:33:01.772+03	2022-12-11 22:33:01.772+03	151
333	Тип наушников	спортивные/ внутриканальные	2022-12-11 22:33:01.774+03	2022-12-11 22:33:01.774+03	151
334	Гарантия	1 год	2022-12-11 22:33:57.359+03	2022-12-11 22:33:57.359+03	152
335	Тип подключения наушников	проводной / беспроводной	2022-12-11 22:33:57.362+03	2022-12-11 22:33:57.362+03	152
336	Тип наушников	накладные	2022-12-11 22:33:57.365+03	2022-12-11 22:33:57.365+03	152
337	Гарантия	1 год	2022-12-11 22:34:37.329+03	2022-12-11 22:34:37.329+03	153
338	Тип подключения наушников	проводной (Jack 3.5)	2022-12-11 22:34:37.333+03	2022-12-11 22:34:37.333+03	153
339	Тип наушников	накладные	2022-12-11 22:34:37.334+03	2022-12-11 22:34:37.334+03	153
340	Срок службы	5 лет	2022-12-11 22:41:08.543+03	2022-12-11 22:41:08.543+03	154
341	Серия	Series 5	2022-12-11 22:41:08.546+03	2022-12-11 22:41:08.546+03	154
342	Экран	32"/1920x1080 Пикс	2022-12-11 22:41:08.548+03	2022-12-11 22:41:08.548+03	154
343	Технология экрана	LED	2022-12-11 22:41:08.55+03	2022-12-11 22:41:08.55+03	154
344	Срок службы	5 лет	2022-12-11 22:42:35.82+03	2022-12-11 22:42:35.82+03	155
345	Серия	QN85A	2022-12-11 22:42:35.823+03	2022-12-11 22:42:35.823+03	155
346	Экран	65"/3840x2160 Пикс	2022-12-11 22:42:35.825+03	2022-12-11 22:42:35.825+03	155
347	Технология экрана	Neo Qled	2022-12-11 22:42:35.826+03	2022-12-11 22:42:35.826+03	155
348	Гарантия	1 год	2022-12-11 23:09:35.932+03	2022-12-11 23:09:35.932+03	156
349	Серия	AU7100	2022-12-11 23:09:35.942+03	2022-12-11 23:09:35.942+03	156
350	Экран	50"/3840x2160 Пикс	2022-12-11 23:09:35.947+03	2022-12-11 23:09:35.947+03	156
351	Технология экрана	LED	2022-12-11 23:09:35.953+03	2022-12-11 23:09:35.953+03	156
352	Гарантия	1 год	2022-12-11 23:10:52.147+03	2022-12-11 23:10:52.147+03	157
353	Серия	Huawei Vision S	2022-12-11 23:10:52.149+03	2022-12-11 23:10:52.149+03	157
354	Экран	55"/3840x2160 Пикс	2022-12-11 23:10:52.151+03	2022-12-11 23:10:52.151+03	157
355	Технология экрана	LED	2022-12-11 23:10:52.152+03	2022-12-11 23:10:52.152+03	157
356	Гарантия	1 год	2022-12-11 23:12:05.818+03	2022-12-11 23:12:05.818+03	158
357	Экран	32"/1366x768 Пикс	2022-12-11 23:12:05.822+03	2022-12-11 23:12:05.822+03	158
358	Технология экрана	LED	2022-12-11 23:12:05.824+03	2022-12-11 23:12:05.824+03	158
359	Гарантия	1 год	2022-12-11 23:13:12.817+03	2022-12-11 23:13:12.817+03	159
360	Серия	QN90A	2022-12-11 23:13:12.821+03	2022-12-11 23:13:12.821+03	159
361	Экран	65"/3840x2160 Пикс	2022-12-11 23:13:12.822+03	2022-12-11 23:13:12.822+03	159
362	Технология экрана	Neo Qled	2022-12-11 23:13:12.822+03	2022-12-11 23:13:12.822+03	159
363	Гарантия	1 год	2022-12-11 23:14:23.443+03	2022-12-11 23:14:23.443+03	160
364	Серия	X81J	2022-12-11 23:14:23.446+03	2022-12-11 23:14:23.446+03	160
365	Экран	75"/3840x2160 Пикс	2022-12-11 23:14:23.447+03	2022-12-11 23:14:23.447+03	160
366	Технология экрана	TRILUMINOS PRO	2022-12-11 23:14:23.448+03	2022-12-11 23:14:23.448+03	160
367	Гарантия	1 год	2022-12-11 23:15:38.837+03	2022-12-11 23:15:38.837+03	161
368	Серия	5	2022-12-11 23:15:38.841+03	2022-12-11 23:15:38.841+03	161
369	Экран	43"/1920x1080 Пикс	2022-12-11 23:15:38.842+03	2022-12-11 23:15:38.842+03	161
370	Гарантия	1 год	2022-12-11 23:16:58.075+03	2022-12-11 23:16:58.075+03	162
371	Серия	Bravia AF-8	2022-12-11 23:16:58.078+03	2022-12-11 23:16:58.078+03	162
372	Экран	55"/3840x2160 Пикс	2022-12-11 23:16:58.079+03	2022-12-11 23:16:58.079+03	162
373	Серия / модель	nova / Y70	2022-12-12 01:53:27.264+03	2022-12-12 01:53:27.264+03	164
374	Экран	6.75"/1600x720 Пикс	2022-12-12 01:53:27.274+03	2022-12-12 01:53:27.274+03	164
375	Встроенная память (ROM)	128 ГБ	2022-12-12 01:53:27.282+03	2022-12-12 01:53:27.282+03	164
376	Цвет	Черный	2022-12-12 01:53:27.289+03	2022-12-12 01:53:27.289+03	164
377	Серия / модель	Mate / Mate 50 Pro	2022-12-12 01:54:51.319+03	2022-12-12 01:54:51.319+03	163
378	Экран	6.74"/2616x1212 Пикс	2022-12-12 01:54:51.331+03	2022-12-12 01:54:51.331+03	163
379	Встроенная память (ROM)	256 ГБ	2022-12-12 01:54:51.337+03	2022-12-12 01:54:51.337+03	163
380	Цвет	Черный	2022-12-12 01:54:51.342+03	2022-12-12 01:54:51.342+03	163
381	Серия / модель	Mate / Mate 50 Pro	2022-12-12 01:56:47.081+03	2022-12-12 01:56:47.081+03	166
382	Экран	6.74"/2616x1212 Пикс	2022-12-12 01:56:47.084+03	2022-12-12 01:56:47.084+03	166
383	Встроенная память (ROM)	512 ГБ	2022-12-12 01:56:47.085+03	2022-12-12 01:56:47.085+03	166
384	Цвет	Оранжевый	2022-12-12 01:56:47.086+03	2022-12-12 01:56:47.086+03	166
385	Серия	P50	2022-12-12 01:58:46.518+03	2022-12-12 01:58:46.518+03	167
386	Модель	BAL-L49	2022-12-12 01:58:46.52+03	2022-12-12 01:58:46.52+03	167
387	Экран	6.9"/2790x1188 Пикс	2022-12-12 01:58:46.523+03	2022-12-12 01:58:46.523+03	167
388	Встроенная память (ROM)	512 ГБ	2022-12-12 01:58:46.524+03	2022-12-12 01:58:46.524+03	167
389	Цвет	Золотистый	2022-12-12 01:58:46.526+03	2022-12-12 01:58:46.526+03	167
390	Быстрая зарядка	Да	2022-12-26 21:07:30.363+03	2022-12-26 21:07:30.363+03	168
391	Выходное напряжение	5 В	2022-12-26 21:07:30.373+03	2022-12-26 21:07:30.373+03	168
392	Мощность	20 Вт	2022-12-26 21:07:30.376+03	2022-12-26 21:07:30.376+03	168
393	Быстрая зарядка	Да	2022-12-26 21:08:33.597+03	2022-12-26 21:08:33.597+03	169
394	Выходное напряжение	5 В	2022-12-26 21:08:33.601+03	2022-12-26 21:08:33.601+03	169
395	Мощность	15 Вт	2022-12-26 21:08:33.602+03	2022-12-26 21:08:33.602+03	169
396	Тип кабеля	USB Type-C	2022-12-26 21:10:48.588+03	2022-12-26 21:10:48.588+03	170
397	Мощность	33 Вт	2022-12-26 21:10:48.592+03	2022-12-26 21:10:48.592+03	170
398	Выходное напряжение	20 В	2022-12-26 21:10:48.594+03	2022-12-26 21:10:48.594+03	170
399	Быстрая зарядка	Да	2022-12-26 21:11:51.955+03	2022-12-26 21:11:51.955+03	171
400	Выходное напряжение	5 В	2022-12-26 21:11:51.959+03	2022-12-26 21:11:51.959+03	171
401	Мощность	20 Вт	2022-12-26 21:11:51.961+03	2022-12-26 21:11:51.961+03	171
402	Тип кабеля	USB Type-C	2022-12-26 21:13:14.338+03	2022-12-26 21:13:14.338+03	172
403	Быстрая зарядка	Да	2022-12-26 21:13:14.342+03	2022-12-26 21:13:14.342+03	172
404	Мощность	65 Вт	2022-12-26 21:13:14.343+03	2022-12-26 21:13:14.343+03	172
405	Выходное напряжение	9 В	2022-12-26 21:13:14.344+03	2022-12-26 21:13:14.344+03	172
406	Емкость аккумулятора	10000 мАч	2022-12-26 21:15:07.152+03	2022-12-26 21:15:07.152+03	173
407	Максимальная нагрузка	2100 мА	2022-12-26 21:15:07.159+03	2022-12-26 21:15:07.159+03	173
408	Порт USB 2.0 тип A	2 шт	2022-12-26 21:15:07.16+03	2022-12-26 21:15:07.16+03	173
409	Порт microUSB 2.0	1 шт	2022-12-26 21:15:07.162+03	2022-12-26 21:15:07.162+03	173
410	Серия	iPad mini (2021)	2022-12-26 21:23:53.787+03	2022-12-26 21:23:53.787+03	174
411	Экран	8.3"/1488x2266 Пикс	2022-12-26 21:23:53.791+03	2022-12-26 21:23:53.791+03	174
412	Встроенная память (ROM)	64 ГБ	2022-12-26 21:23:53.792+03	2022-12-26 21:23:53.792+03	174
413	Операционная система	iPadOS	2022-12-26 21:23:53.793+03	2022-12-26 21:23:53.793+03	174
414	Серия	iPad Pro	2022-12-26 21:25:19.006+03	2022-12-26 21:25:19.006+03	175
415	Экран	12.9"/2048x2732 Пикс	2022-12-26 21:25:19.009+03	2022-12-26 21:25:19.009+03	175
416	Встроенная память (ROM)	256 ГБ	2022-12-26 21:25:19.01+03	2022-12-26 21:25:19.01+03	175
417	Тип процессора	M2	2022-12-26 21:25:19.011+03	2022-12-26 21:25:19.011+03	175
418	Операционная система	iPadOS	2022-12-26 21:25:19.013+03	2022-12-26 21:25:19.013+03	175
419	Серия	iPad mini (2021)	2022-12-26 21:26:25.604+03	2022-12-26 21:26:25.604+03	176
420	Экран	8.3"/1488x2266 Пикс	2022-12-26 21:26:25.607+03	2022-12-26 21:26:25.607+03	176
421	Встроенная память (ROM)	256 ГБ	2022-12-26 21:26:25.608+03	2022-12-26 21:26:25.608+03	176
422	Тип процессора	A15 Bionic	2022-12-26 21:26:25.609+03	2022-12-26 21:26:25.609+03	176
423	Операционная система	iPadOS	2022-12-26 21:26:25.611+03	2022-12-26 21:26:25.611+03	176
424	Серия	iPad Pro	2022-12-26 21:28:25.869+03	2022-12-26 21:28:25.869+03	177
425	Экран	11"/1668x2388 Пикс	2022-12-26 21:28:25.872+03	2022-12-26 21:28:25.872+03	177
426	Встроенная память (ROM)	256 ГБ	2022-12-26 21:28:25.873+03	2022-12-26 21:28:25.873+03	177
427	Тип процессора	M2	2022-12-26 21:28:25.875+03	2022-12-26 21:28:25.875+03	177
428	Операционная система	iPadOS	2022-12-26 21:28:25.876+03	2022-12-26 21:28:25.876+03	177
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, price, rating, image, created_at, updated_at, category_id, brand_id) FROM stdin;
127	HUAWEI MateBook D 15	62999	0	ef14bcbd-54c2-474d-999c-1a4311091b2e.jpeg	2022-12-11 18:57:28.58+03	2022-12-11 18:57:28.58+03	4	19
116	Apple MacBook Air 13	82999	0	ba4bfcae-d864-4076-b41e-7a3bf0f4bcdc.png	2022-03-08 13:09:11.79+03	2022-12-11 18:35:31.128+03	4	3
115	Apple MacBook Air 13 (MGND3)	84999	0	2de2249a-0e22-46a2-8d25-e9826b5e7f47.png	2022-03-08 13:06:39.593+03	2022-12-11 18:37:27.691+03	4	3
118	Apple MacBook Pro 14 (MKGP3)	159999	0	264d6b6d-9067-4cb0-a78b-8a51eac14bfd.png	2022-03-08 13:14:39.045+03	2022-12-11 18:40:30.73+03	4	3
123	Apple MacBook Air 13 (MLXW3)	104999	0	96c6c5df-1327-4a1c-8c8d-d9f7d65f671a.jpeg	2022-12-11 18:35:08.162+03	2022-12-11 18:43:57.737+03	4	3
121	Apple MacBook Air 13 (MLY33)	109999	0	9fb1166e-c4fd-4a5c-a58a-64331bb71804.jpeg	2022-03-08 13:37:58.351+03	2022-12-11 18:44:52.506+03	4	3
124	Apple MacBook Pro 13	104999	0	ffcf733c-3e2f-4ac2-84a3-6c7855b15f3c.png	2022-12-11 18:47:32.563+03	2022-12-11 18:47:32.563+03	4	3
125	Apple MacBook Pro 13 (MNEH3)	124999	0	8d4075d1-4ca6-4c15-a983-09038cee9a39.png	2022-12-11 18:49:50.6+03	2022-12-11 18:49:50.6+03	4	3
126	Apple MacBook Pro 16	159999	0	6b3af07d-5c8b-4c15-bcdf-5ef2e6f7f155.png	2022-12-11 18:51:28.402+03	2022-12-11 18:51:28.402+03	4	3
128	HUAWEI MateBook D 15 2021	52999	0	d7d5c651-18dd-4334-aaa5-e4b9d38f266a.jpeg	2022-12-11 18:58:44.973+03	2022-12-11 18:58:44.973+03	4	19
129	HUAWEI MateBook D 14 2021	56999	0	badef85f-5f73-4b7f-ab9c-17d6f3319bcb.jpeg	2022-12-11 19:00:00.587+03	2022-12-11 19:00:00.587+03	4	19
130	HUAWEI MateBook D 16	86999	0	1120a9b6-1788-4178-8b8b-4c1931778402.jpeg	2022-12-11 19:01:27.623+03	2022-12-11 19:01:27.623+03	4	19
131	HUAWEI MateBook 16S	114999	0	00b9dc8a-6495-4e13-87b4-1fd0e3d84485.jpeg	2022-12-11 19:02:36.09+03	2022-12-11 19:02:36.09+03	4	19
132	Xiaomi Redmi Note 10 Pro	23999	0	30fb0f05-e25c-4be5-9f56-6561e0681110.jpeg	2022-12-11 19:09:43.697+03	2022-12-11 19:09:43.697+03	3	4
133	Xiaomi Redmi 9T	34999	0	fbeb0a2e-708a-4fae-a456-4439087f949c.jpeg	2022-12-11 19:12:06.489+03	2022-12-11 19:12:06.489+03	3	4
134	Ноутбук игровой MSI Katana	104999	0	a07a6903-6ab0-48bb-b6c7-f67d187851fc.jpeg	2022-12-11 19:15:38.008+03	2022-12-11 19:16:24.92+03	4	20
135	Ноутбук игровой MSI Delta	144999	0	2914600e-dc72-4e39-948e-be9638a1aa62.jpeg	2022-12-11 19:18:11.141+03	2022-12-11 19:18:11.141+03	4	20
163	HUAWEI Mate 50 Pro	69999	0	c0a27a52-682b-4d69-8d1c-cf72e0cfeb15.webp	2022-12-11 23:21:42.721+03	2022-12-12 01:54:51.352+03	3	19
137	Apple iPhone 14 128GB	714999	0	b5a6bfe3-c8a1-4662-b1b4-aaac5780c8d5.jpeg	2022-12-11 19:57:48.574+03	2022-12-11 19:58:44.436+03	3	3
166	HUAWEI Mate 50 Pro (DCO-LX9)	79999	0	f818411a-ad6c-47d8-acba-e6f749ae9b73.webp	2022-12-12 01:56:47.041+03	2022-12-12 01:56:47.041+03	3	19
136	Apple iPhone 14 512GB	100999	0	a14a0764-5610-442c-9447-6e833f474364.jpeg	2022-12-11 19:55:38.13+03	2022-12-11 19:59:07.262+03	3	3
138	Apple iPhone 14 256GB	82999	0	61b98899-99c3-4771-951f-3b34928e68ce.jpeg	2022-12-11 20:00:16.237+03	2022-12-11 20:00:16.237+03	3	3
139	Apple iPhone 14 Pro 256GB	119999	0	fd2f91c0-7514-4766-abed-f1a1ad13c871.jpeg	2022-12-11 20:01:29.838+03	2022-12-11 20:01:29.838+03	3	3
141	Apple iPhone 14 Pro 512GB	139999	0	e5c5046a-819b-4618-88de-0c966d3cc9a3.jpeg	2022-12-11 20:03:17.548+03	2022-12-11 20:03:17.548+03	3	3
142	Apple iPhone 14 Pro 128GB	110499	0	fbe90a9d-3910-412d-a174-af68b80e2c1d.jpeg	2022-12-11 20:04:25.262+03	2022-12-11 20:04:25.262+03	3	3
143	Apple AirPods Pro (2nd generation)	24999	0	c5ae03b9-bea5-4584-9602-7a515ba1e23c.webp	2022-12-11 22:19:55.699+03	2022-12-11 22:19:55.699+03	16	3
144	Apple AirPods (3rd generation)	14999	0	0411c464-6b57-49fd-afe7-66cfbb180f91.webp	2022-12-11 22:24:13.141+03	2022-12-11 22:25:06.155+03	16	3
145	True Wireless JBL	7499	0	5732c627-8d06-40c1-9df4-0c3cd4cc8cf8.webp	2022-12-11 22:26:40.237+03	2022-12-11 22:26:40.237+03	16	18
146	True Wireless Xiaomi	1999	0	dc71c990-37bc-4ec5-87ae-b165cfb91f79.webp	2022-12-11 22:27:43.359+03	2022-12-11 22:27:43.359+03	16	4
147	Apple EarPods with Lightning Connector	2699	0	06cea7f8-3774-41c2-85d4-1a6315c504d6.webp	2022-12-11 22:28:43.902+03	2022-12-11 22:28:43.902+03	16	3
148	Apple EarPods with 3.5mm Headphone Plug	2299	0	51ad4d57-862a-4b37-907e-633ef68f6683.webp	2022-12-11 22:29:34.797+03	2022-12-11 22:29:34.797+03	16	3
149	True Wireless HUAWEI FreeBuds Lipstick	8999	0	422f30c8-b583-4159-b517-9eed1069cb89.webp	2022-12-11 22:30:35.994+03	2022-12-11 22:30:35.994+03	16	19
150	Sony WI-C310 Bluetooth	2299	0	10e9eded-6c6b-4370-9c0c-380e470464ec.webp	2022-12-11 22:31:51.979+03	2022-12-11 22:31:51.979+03	16	2
151	JBL T125 Bluetooth	2299	0	25ef2b16-72cf-40ab-b30c-7c614c06516d.webp	2022-12-11 22:33:01.726+03	2022-12-11 22:33:01.726+03	16	18
152	Sony WH-CH710N Bluetooth	9999	0	b003eae8-a734-418a-81f9-0c66e7492c80.webp	2022-12-11 22:33:57.317+03	2022-12-11 22:33:57.317+03	16	2
153	Sony MDR-RF811RKC	6999	0	e4207710-0b34-4e6c-a0aa-ea443a7ec408.webp	2022-12-11 22:34:37.289+03	2022-12-11 22:34:37.289+03	16	2
154	Samsung UE32N5000AU	19999	0	776157eb-eebb-4f97-a5e3-b8269b41441d.webp	2022-12-11 22:41:08.486+03	2022-12-11 22:41:08.486+03	2	1
155	Samsung QE65QN87AAU	189999	0	aedd4872-1cbd-4f57-bad2-2e63afb9a014.webp	2022-12-11 22:42:35.639+03	2022-12-11 22:42:35.639+03	2	1
156	Samsung UE50AU7100U	52999	0	d1c653bc-b835-4a43-bf6b-838149e4b4eb.webp	2022-12-11 23:08:16.176+03	2022-12-11 23:09:35.962+03	2	1
158	Xiaomi Mi P1	16999	0	358414d7-be12-4dbf-8a59-17c6399d19c3.webp	2022-12-11 23:12:05.661+03	2022-12-11 23:12:05.661+03	2	4
159	Samsung QE65QN90AAU	214999	0	52e89066-a999-4d64-b6b0-ec4f53c08109.webp	2022-12-11 23:13:12.779+03	2022-12-11 23:13:12.779+03	2	1
160	Sony KD75X81JCEP	149999	0	7ab933f2-1fd2-4a17-882b-e8c82e4ef90b.webp	2022-12-11 23:14:23.397+03	2022-12-11 23:14:23.397+03	2	2
161	Samsung UE43T5300AU	35999	0	565cf4bc-81b5-4251-82bc-12c442214a84.webp	2022-12-11 23:15:38.797+03	2022-12-11 23:15:38.797+03	2	1
162	Sony KD-55A8	80500	0	f7ff9675-0bb5-4bc8-8f59-9c102135b046.webp	2022-12-11 23:16:58.034+03	2022-12-11 23:16:58.034+03	2	2
164	HUAWEI nova Y70	18999	0	9f128a29-5d03-4791-972a-6f60d39c49e7.webp	2022-12-12 01:51:27.256+03	2022-12-12 01:53:27.304+03	3	19
157	HUAWEI Vision S	59999	0	8e615a8f-d90e-4aa0-9e5a-b1645b981820.webp	2022-12-11 23:10:52.105+03	2022-12-12 01:53:35.835+03	2	19
167	HUAWEI P50 Pocket Premium Gold	99999	0	da87bbd9-2a19-41e2-9df1-e252ce18c1f9.webp	2022-12-12 01:58:46.477+03	2022-12-12 01:58:46.477+03	3	19
169	Apple MagSafe Charger	4999	0	c178b2e6-dfde-478d-9bf7-1cc2ebdf56ed.jpeg	2022-12-26 21:08:33.556+03	2022-12-26 21:08:33.556+03	20	3
168	СЗУ Apple 20W	2999	0	17a41eb5-74ba-484b-ae05-3f2ed96d2c46.jpeg	2022-12-26 21:07:30.292+03	2022-12-26 21:09:35.922+03	20	3
170	СЗУ  Xiaomi 33W	1699	0	8940c338-ca49-4246-80a4-3692a1a1c423.jpeg	2022-12-26 21:10:48.544+03	2022-12-26 21:10:48.544+03	20	4
171	БЗУ  Xiaomi Mi 20W	1890	0	3c07137d-13da-42f0-b6f2-845cd9ea5368.jpeg	2022-12-26 21:11:51.798+03	2022-12-26 21:11:51.798+03	20	4
172	СЗУ с кабелем Xiaomi 65W	2499	0	8a8dc983-02fb-4718-babc-831baa9d4c77.jpeg	2022-12-26 21:13:14.297+03	2022-12-26 21:13:14.297+03	20	4
173	Внешний аккумулятор Xiaomi W5	2300	0	06fe9d8d-40c5-4504-a99a-5ff0348fece2.jpeg	2022-12-26 21:15:07.108+03	2022-12-26 21:16:01.427+03	20	4
174	Apple iPad mini 6th gen.	42299	0	fea0860b-7b21-4e49-a59b-567c0be8ded9.jpeg	2022-12-26 21:23:53.732+03	2022-12-26 21:23:53.732+03	21	3
175	Apple iPad Pro 12.9 2022	119999	0	91b8e59f-5053-4a30-8290-27e6070190e2.jpeg	2022-12-26 21:25:18.968+03	2022-12-26 21:25:18.968+03	21	3
176	Apple iPad mini	66999	0	37684fb2-425e-43d0-adc4-3a5b36a4a3ac.jpeg	2022-12-26 21:26:25.564+03	2022-12-26 21:26:25.564+03	21	3
177	Apple iPad Pro 11 2022	91999	0	aa12e880-447c-498b-85cd-16006f801a2b.jpeg	2022-12-26 21:28:25.83+03	2022-12-26 21:28:25.83+03	21	3
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (rate, created_at, updated_at, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: type_brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_brands (id, "createdAt", "updatedAt", "typeId", "brandId") FROM stdin;
\.


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.types (id, name, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, role, created_at, updated_at) FROM stdin;
3	user@mail.ru	$2b$05$33KYYLYkDqkqlwru0eHev.Wp9t47/176gW0OCdwIndgagn7QU6Lde	USER	2021-12-25 13:56:40.236+03	2021-12-25 13:56:40.236+03
4	admin@mail.ru	$2b$05$3i6B3E6ns0zqXgZsSNDHc.K0W3mnss6lJ0C46P2uaZXb3q2iwhsX6	ADMIN	2021-12-29 13:10:01.557+03	2021-12-29 13:10:01.557+03
6	user2@mail.ru	$2b$05$yWp3WEcYdJB7/DjmycrbBeeQ0hsG6klGQx5BRHDw80eE9KCEZijxq	USER	2021-12-29 13:22:52.966+03	2021-12-29 13:22:52.966+03
5	admin2@mail.ru	$2b$05$o9l/.S2YTcox/yo1/9zlNebDbTkUnz.F83N4rA24HZSLQVYREUtFu	ADMIN	2021-12-29 13:11:01.522+03	2021-12-29 13:11:01.522+03
7	admin3@mail.ru	$2b$05$Zv.uoCilrq8nWgNt.YRYAeXlUHSXo0VsZePRSPhPCxNC3UG/cKPWa	USER	2022-12-12 01:36:39.047+03	2022-12-12 01:36:39.047+03
8	user@mail.com	$2b$05$VTYxBWedbIMU3YWufMSmeeJmD3Px0leg7vb2kj8pF4PMKLaDwPfke	USER	2022-12-12 20:50:20.197+03	2022-12-12 20:50:20.197+03
9	user3@mail.ru	$2b$05$IgUTvyQeBLhSK.G5yRIFQeMzvQEpz2m7fpyG0o5bmMkCJluoVWq4O	USER	2022-12-27 10:53:50.254+03	2022-12-27 10:53:50.254+03
\.


--
-- Name: basket_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basket_devices_id_seq', 1, false);


--
-- Name: baskets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.baskets_id_seq', 48, true);


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_id_seq', 26, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 21, true);


--
-- Name: device_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.device_infos_id_seq', 1, false);


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.devices_id_seq', 1, false);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 12, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 5, true);


--
-- Name: product_props_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_props_id_seq', 428, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 177, true);


--
-- Name: type_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_brands_id_seq', 1, false);


--
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.types_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 9, true);


--
-- Name: basket_devices basket_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT basket_devices_pkey PRIMARY KEY (id);


--
-- Name: basket_products basket_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_pkey PRIMARY KEY (basket_id, product_id);


--
-- Name: baskets baskets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT baskets_pkey PRIMARY KEY (id);


--
-- Name: brands brands_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_name_key UNIQUE (name);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: device_infos device_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_infos
    ADD CONSTRAINT device_infos_pkey PRIMARY KEY (id);


--
-- Name: devices devices_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_name_key UNIQUE (name);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product_props product_props_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props
    ADD CONSTRAINT product_props_pkey PRIMARY KEY (id);


--
-- Name: products products_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (product_id, user_id);


--
-- Name: type_brands type_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT type_brands_pkey PRIMARY KEY (id);


--
-- Name: type_brands type_brands_typeId_brandId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_typeId_brandId_key" UNIQUE ("typeId", "brandId");


--
-- Name: types types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_name_key UNIQUE (name);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: basket_devices basket_devices_basketId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT "basket_devices_basketId_fkey" FOREIGN KEY ("basketId") REFERENCES public.baskets(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: basket_devices basket_devices_deviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT "basket_devices_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: basket_products basket_products_basket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_basket_id_fkey FOREIGN KEY (basket_id) REFERENCES public.baskets(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: basket_products basket_products_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: device_infos device_infos_deviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_infos
    ADD CONSTRAINT "device_infos_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: devices devices_brandId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT "devices_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: devices devices_typeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT "devices_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public.types(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: product_props product_props_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props
    ADD CONSTRAINT product_props_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: products products_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ratings ratings_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ratings ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: type_brands type_brands_brandId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: type_brands type_brands_typeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public.types(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

