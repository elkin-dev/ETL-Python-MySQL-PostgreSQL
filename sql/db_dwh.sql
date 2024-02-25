CREATE DATABASE IF NOT EXISTS db_club_film;
USE db_club_film;
CREATE TABLE
  dim_film (
    id_film INT (11),
    `name` VARCHAR (45),
    category VARCHAR (45),
    PRIMARY KEY (id_film)
  );


CREATE TABLE
  dim_customer (
    id_customer INT (11),
    name_customer VARCHAR (45),
    address_customer VARCHAR (45),
    city_customer VARCHAR (45),
    country_customer VARCHAR (45),
    PRIMARY KEY (id_customer)
  );


CREATE TABLE
  date_sales (
    id_date INT (11),
    `year` VARCHAR (45),
    `month` VARCHAR (45),
    `day` VARCHAR (45),
    PRIMARY KEY (id_date)
  );


CREATE TABLE
  dim_store (
    id_store INT (11),
    address_store VARCHAR (45),
    city_store VARCHAR (45),
    country VARCHAR (45),
    PRIMARY KEY (id_store)
  );


-- DROP TABLE IF EXISTS
--   fact_sales;


CREATE TABLE
  fact_sales (
    sales_amount INT (11),
    dim_film_id INT (11),
    dim_store_id INT (11),
    date_sales_id INT (11),
    dim_customer_id INT (11),
    PRIMARY KEY (
      sales_amount,
      dim_film_id,
      dim_store_id,
      date_sales_id,
      dim_customer_id
    ),
    FOREIGN KEY (dim_film_id) REFERENCES dim_film (id_film),
    FOREIGN KEY (dim_store_id) REFERENCES dim_store (id_store),
    FOREIGN KEY (date_sales_id) REFERENCES date_sales (id_date),
    FOREIGN KEY (dim_customer_id) REFERENCES dim_customer (id_customer)
  );


CREATE TABLE
  date_inventory (
    id_date_inventory INT (11),
    `year` VARCHAR (45),
    `month` VARCHAR (45),
    `day` VARCHAR (45),
    PRIMARY KEY (id_date_inventory)
  );


CREATE TABLE
  fact_inventory (
    price_film INT (11),
    count_film INT (11),
    dim_store_id INT (11),
    date_inventory_id INT (11),
    dim_film_id INT (11),
    PRIMARY KEY (dim_store_id, date_inventory_id, dim_film_id),
    FOREIGN KEY (dim_store_id) REFERENCES dim_store (id_store),
    FOREIGN KEY (date_inventory_id) REFERENCES date_inventory (id_date_inventory),
    FOREIGN KEY (dim_film_id) REFERENCES dim_film (id_film)
  );


CREATE TABLE
  date_rentals (
    id_date INT (11),
    `year` VARCHAR (45),
    `month` VARCHAR (45),
    `day` VARCHAR (45),
    PRIMARY KEY (id_date)
  );


CREATE TABLE
  dim_staff (
    id_staff INT (11),
    `name` VARCHAR (45),
    store VARCHAR (45),
    PRIMARY KEY (id_staff)
  );


CREATE TABLE
  fact_rentals (
    count_returns INT (11),
    count_rental INT (11),
    dim_film_id INT (11),
    dim_customer_id INT (11),
    dim_staff_id INT (11),
    dim_store_id INT (11),
    date_rental_id INT (11),
    PRIMARY KEY (
      dim_film_id,
      dim_customer_id,
      dim_staff_id,
      dim_store_id,
      date_rental_id
    ),
    FOREIGN KEY (dim_film_id) REFERENCES dim_film (id_film),
    FOREIGN KEY (dim_customer_id) REFERENCES dim_customer (id_customer),
    FOREIGN KEY (dim_staff_id) REFERENCES dim_staff (id_staff),
    FOREIGN KEY (dim_store_id) REFERENCES dim_store (id_store),
    FOREIGN KEY (date_rental_id) REFERENCES date_rentals (id_date)
  );
