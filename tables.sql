CREATE TABLE categories (
    id integer NOT NULL,
    category_name character varying(255),
    description character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE categories_id_seq OWNED BY categories.id;

CREATE TABLE customers (
    id integer NOT NULL,
    company_code character varying(255),
    company_name character varying(255),
    contact_name character varying(255),
    contact_title character varying(255),
    address character varying(255),
    city character varying(255),
    region character varying(255),
    postal_code character varying(255),
    country character varying(255),
    phone character varying(255),
    fax character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE customers_id_seq OWNED BY customers.id;

CREATE TABLE employees (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    title character varying(255),
    title_of_courtesy character varying(255),
    birth_date date,
    hire_date date,
    address character varying(255),
    city character varying(255),
    region character varying(255),
    postal_code character varying(255),
    country character varying(255),
    home_phone character varying(255),
    extension character varying(255),
    notes text,
    reports_to_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE SEQUENCE employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE employees_id_seq OWNED BY employees.id;

CREATE TABLE orders (
    id integer NOT NULL,
    order_date date,
    required_date date,
    shipped_date date,
    ship_via_id integer,
    freight numeric,
    ship_name character varying(255),
    ship_address character varying(255),
    ship_city character varying(255),
    ship_region character varying(255),
    ship_postal_code character varying(255),
    ship_country character varying(255),
    customer_code character varying(255),
    customer_id integer,
    employee_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE orders_id_seq OWNED BY orders.id;

CREATE TABLE products (
    id integer NOT NULL,
    product_name character varying(255),
    quantity_per_unit character varying(255),
    unit_price numeric,
    units_in_stock integer,
    units_on_order integer,
    reorder_level integer,
    discontinued boolean,
    supplier_id integer,
    category_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE products_id_seq OWNED BY products.id;

CREATE TABLE order_details (
    id integer NOT NULL,
    unit_price numeric,
    quantity integer,
    discount numeric,
    order_id integer,
    product_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE SEQUENCE order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE order_details_id_seq OWNED BY order_details.id;

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);
ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);
ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);
ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);
ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);
ALTER TABLE ONLY order_details ALTER COLUMN id SET DEFAULT nextval('order_details_id_seq'::regclass);
