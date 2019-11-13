DROP DATABASE IF EXISTS jvdb;
CREATE DATABASE jvdb
    WITH OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;
\connect jvdb

CREATE TABLE public.language (
  id SERIAL,
  name VARCHAR(25) NOT NULL,
  PRIMARY KEY (id));

CREATE TYPE rating AS ENUM ('G', 'PG', 'PG-13', 'R', 'NC-17', 'Not Rated');
CREATE TYPE mediatype AS ENUM ('DVD', 'VIDEO');
CREATE TYPE mediacondition 
AS ENUM ('NEW', 'GOOD', 'FAIR', 'REFURB', 'DAMAGED');

CREATE TABLE public.address (
  id SERIAL,
  street VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state_province VARCHAR(50) NOT NULL,
  postal_code VARCHAR(10) NULL,
  phone VARCHAR(20) NOT NULL,
  PRIMARY KEY (id));

CREATE TABLE public.movie (
  id SERIAL,
  title VARCHAR(255) NOT NULL,
  description TEXT NULL,
  release_year INT NULL,
  length SMALLINT NULL,
  rating rating NULL,
  language_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_movie_language1
    FOREIGN KEY (language_id)
    REFERENCES public.language (id)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION);
  
CREATE TABLE public.director (
  id SERIAL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (id));

CREATE TABLE public.actor (
  id SERIAL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (id));

CREATE TABLE public.movie_has_actor (
  movie_id INT NOT NULL,
  actor_id INT NOT NULL,
  PRIMARY KEY (movie_id, actor_id),
  CONSTRAINT fk_movie_has_actor_movie
    FOREIGN KEY (movie_id)
    REFERENCES public.movie (id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT fk_movie_has_actor_actor1
    FOREIGN KEY (actor_id)
    REFERENCES public.actor (id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);
CREATE TABLE public.movie_has_director (
  movie_id INT NOT NULL,
  director_id INT NOT NULL,
  PRIMARY KEY (movie_id, director_id),
  CONSTRAINT fk_movie_has_director_movie1
    FOREIGN KEY (movie_id)
    REFERENCES public.movie (id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT fk_movie_has_director_director1
    FOREIGN KEY (director_id)
    REFERENCES public.director (id)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION);

CREATE TABLE public.category (
  id SERIAL,
  name VARCHAR(25) NULL,
  PRIMARY KEY (id));
  
CREATE TABLE public.movie_has_category (
  movie_id INT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (movie_id, category_id),
  CONSTRAINT fk_movie_has_category_movie1
    FOREIGN KEY (movie_id)
    REFERENCES public.movie (id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT fk_movie_has_category_category1
    FOREIGN KEY (category_id)
    REFERENCES public.category (id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);

CREATE TABLE public.distributor (
  id SERIAL,
  name VARCHAR(255) NOT NULL,
  established_date TIMESTAMP NOT NULL,
  address_id INT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_distributor_address1
    FOREIGN KEY (address_id)
    REFERENCES public.address (id)
    ON DELETE SET NULL
    ON UPDATE NO ACTION);

CREATE TABLE public.catalog_item (
  id SERIAL,
  distributor_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  serial_number INT NOT NULL,
  wholesale_cost NUMERIC(5,2) NOT NULL,
  movie_id INT NULL,
  create_date TIMESTAMP NOT NULL,
  media_type mediatype NOT NULL,
  update_date TIMESTAMP NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_distributor_item_distributor1
    FOREIGN KEY (distributor_id)
    REFERENCES public.distributor (id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT fk_distributor_item_movie1
    FOREIGN KEY (movie_id)
    REFERENCES public.movie (id)
    ON DELETE SET NULL
    ON UPDATE NO ACTION);
CREATE TABLE public.inventory_item (
  id SERIAL,
  movie_id INT NULL,
  rental_rate NUMERIC(5,2) NOT NULL,
  rental_duration VARCHAR(45) NOT NULL,
  replacement_cost NUMERIC(4,2) NOT NULL,
  media_type mediatype NOT NULL,
  media_condition mediacondition NULL,
  create_date TIMESTAMP NOT NULL,
  update_date TIMESTAMP NULL,
  distributor_catalog_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_inventory_item_movie1
    FOREIGN KEY (movie_id)
    REFERENCES public.movie (id)
    ON DELETE SET NULL
    ON UPDATE NO ACTION,
  CONSTRAINT fk_inventory_item_distributor_item1
    FOREIGN KEY (distributor_catalog_id)
    REFERENCES public.catalog_item (id)
    ON DELETE SET NULL
    ON UPDATE NO ACTION);

CREATE TABLE public.customer (
  id SERIAL,
  account_number CHAR(7),
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(50) NULL,
  active SMALLINT NULL,
  create_date TIMESTAMP NOT NULL,
  update_date TIMESTAMP NULL,
  address_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_customer_address1
    FOREIGN KEY (address_id)
    REFERENCES public.address (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE public.staff (
  id SERIAL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(50) NULL,
  active SMALLINT NOT NULL,
  username VARCHAR(16) NOT NULL,
  password VARCHAR(40) NULL,
  address_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_staff_address1
    FOREIGN KEY (address_id)
    REFERENCES public.address (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);






CREATE TABLE public.academy_award (
  id SERIAL,
  award_category VARCHAR(50) NOT NULL,
  PRIMARY KEY (id));

CREATE TABLE public.rental (
  id SERIAL,
  inventory_id INT NULL,
  rental_date TIMESTAMP NOT NULL,
  rental_tax NUMERIC(4,2) NOT NULL,
  customer_id INT NULL,
  return_date TIMESTAMP NULL,
  staff_id INT NULL,
  late_fee NUMERIC(5,2) NULL,
  damage_fee NUMERIC(4,2) NULL,
  rewind_fee NUMERIC(4,2) NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_rental_inventory_item1
    FOREIGN KEY (inventory_id)
    REFERENCES public.inventory_item (id)
    ON DELETE SET NULL
    ON UPDATE NO ACTION,
  CONSTRAINT fk_rental_customer1
    FOREIGN KEY (customer_id)
    REFERENCES public.customer (id)
    ON DELETE SET NULL
    ON UPDATE NO ACTION,
  CONSTRAINT fk_rental_staff1
    FOREIGN KEY (staff_id)
    REFERENCES public.staff (id)
    ON DELETE SET NULL
    ON UPDATE NO ACTION);

CREATE TABLE public.payment (
  id SERIAL,
  rental_id INT NULL,
  amount NUMERIC(5,2) NOT NULL,
  payment_date TIMESTAMP NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_payment_rental1
    FOREIGN KEY (rental_id)
    REFERENCES public.rental (id)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION);

CREATE TABLE public.movie_has_academy_award (
  movie_id INT NOT NULL,
  academy_award_id INT NOT NULL,
  PRIMARY KEY (movie_id, academy_award_id),
  CONSTRAINT fk_movie_has_academy_award_movie1
    FOREIGN KEY (movie_id)
    REFERENCES public.movie (id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT fk_movie_has_academy_award_academy_award1
    FOREIGN KEY (academy_award_id)
    REFERENCES public.academy_award (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO public.language VALUES (1, 'English');
INSERT INTO public.language VALUES (2, 'Japanese');
INSERT INTO public.language VALUES (3, 'French');
INSERT INTO public.language VALUES (4, 'Italian');
INSERT INTO public.language VALUES (5, 'German');
INSERT INTO public.movie VALUES (1, 'ANTITRUST TEEN', 'A Brilliant Epistle of a Composer And a Database Administrator', 1988, 150, 'PG', 1);
INSERT INTO public.movie VALUES (2, 'APOLLO TOMATOES', 'A Intrepid Documentary of a Boat And a Crocodile', 2005, 50, 'G', 1);
INSERT INTO public.movie VALUES (3, 'BARABELLA LIBERTY', 'A Amazing Documentary of a Secret Agent And a Astronaut', 2003, 86, 'NC-17', 1);
INSERT INTO public.movie VALUES (4, 'BIRD WHISPERER', 'A Fateful Yarn of a Mad Cow And a Waitress', 2018, 150, 'PG-13', 1);
INSERT INTO public.movie VALUES (5, 'CARIBBEAN INDEPENDENCE', 'A Unbelieveable Epistle of a Robot And a Husband', 1995, 94, 'R', 3);
INSERT INTO public.director VALUES (1, 'Sandra', 'Streep');
INSERT INTO public.director VALUES (2, 'Elvis', 'Davis');
INSERT INTO public.director VALUES (3, 'Lucille', 'Fawcett');
INSERT INTO public.director VALUES (4, 'Joseph', 'Paltrow');
INSERT INTO public.director VALUES (5, 'Jennifer', 'Marx');
INSERT INTO public.actor VALUES (1, 'Woody', 'Costner');
INSERT INTO public.actor VALUES (2, 'Scarlett', 'Hudson');
INSERT INTO public.actor VALUES (3, 'Cate', 'Streep');
INSERT INTO public.actor VALUES (4, 'Morgan', 'Bridges');
INSERT INTO public.actor VALUES (5, 'Angela', 'Keitel');
INSERT INTO public.movie_has_actor VALUES (1, 1);
INSERT INTO public.movie_has_actor VALUES (1, 2);
INSERT INTO public.movie_has_actor VALUES (1, 3);
INSERT INTO public.movie_has_actor VALUES (2, 1);
INSERT INTO public.movie_has_actor VALUES (2, 2);
INSERT INTO public.movie_has_actor VALUES (2, 3);
INSERT INTO public.movie_has_actor VALUES (2, 4);
INSERT INTO public.movie_has_actor VALUES (3, 4);
INSERT INTO public.movie_has_actor VALUES (3, 5);
INSERT INTO public.movie_has_actor VALUES (3, 3);
INSERT INTO public.movie_has_actor VALUES (4, 5);
INSERT INTO public.movie_has_actor VALUES (4, 2);
INSERT INTO public.movie_has_actor VALUES (4, 1);
INSERT INTO public.movie_has_actor VALUES (4, 4);
INSERT INTO public.movie_has_actor VALUES (5, 4);
INSERT INTO public.movie_has_actor VALUES (5, 1);
INSERT INTO public.movie_has_director VALUES (1, 2);
INSERT INTO public.movie_has_director VALUES (1, 4);
INSERT INTO public.movie_has_director VALUES (2, 5);
INSERT INTO public.movie_has_director VALUES (3, 1);
INSERT INTO public.movie_has_director VALUES (4, 2);
INSERT INTO public.movie_has_director VALUES (5, 3);
INSERT INTO public.category VALUES (1, 'Action');
INSERT INTO public.category VALUES (2, 'Sci-Fi');
INSERT INTO public.category VALUES (3, 'Drama');
INSERT INTO public.category VALUES (4, 'Documentary');
INSERT INTO public.category VALUES (5, 'Horror');
INSERT INTO public.movie_has_category VALUES (1, 3);
INSERT INTO public.movie_has_category VALUES (1, 1);
INSERT INTO public.movie_has_category VALUES (1, 2);
INSERT INTO public.movie_has_category VALUES (2, 1);
INSERT INTO public.movie_has_category VALUES (2, 4);
INSERT INTO public.movie_has_category VALUES (3, 5);
INSERT INTO public.movie_has_category VALUES (4, 1);
INSERT INTO public.movie_has_category VALUES (5, 3);
INSERT INTO public.address VALUES (1, '1111 Loja Avenue', 'Shawnee', 'Kansas', '79388', '440512153169');
INSERT INTO public.address VALUES (2, '28 MySQL Boulevard', 'Mission', 'Kansas', '72878', '665356572025');
INSERT INTO public.address VALUES (3, '1795 Santiago de Compostela Way', 'Merriam', 'Kansas', '94399', '648856936185');
INSERT INTO public.address VALUES (4, '33 Gorontalo Way', 'Overland Park', 'Missouri', '76022', '680768868518');
INSERT INTO public.address VALUES (5, '7710 Bydgosz Avenue', 'Kansas City', 'Kansas', '23616', '177727722820');
INSERT INTO public.address VALUES (6, '1718 Valencia Street', 'Shawnee Mission', 'Kansas', '53628', '378318851631');
INSERT INTO public.address VALUES (7, '1997 Halifax Drive', 'Turner', 'Missouri', '18746', '912257250465');
INSERT INTO public.address VALUES (8, '1717 Guadalajara Lane', 'North Kansas City', 'Kansas', '18743', '705800322606');
INSERT INTO public.address VALUES (9, '1150 Kimchon Manor', 'Garden City', 'Kansas', '17886', '262076994845');
INSERT INTO public.address VALUES (10, '1668 Saint Louis Place', 'Olathe', 'Kansas', '83579', '171822533480');
INSERT INTO public.address VALUES (11, '1213 Ranchi Parkway', 'Hamilton', 'Missouri', '45844', '347487831378');
INSERT INTO public.address VALUES (12, '1557 Ktahya Boulevard', 'Parkville', 'Missouri', '42399', '697760867968');
INSERT INTO public.address VALUES (13, '1926 El Alto Avenue', 'Grandview', 'Missouri', '83579', '333489324603');
INSERT INTO public.address VALUES (14, '733 Mandaluyong Place', 'North Kansas City', 'Missouri', '17886', '107137400143');
INSERT INTO public.address VALUES (15, '1386 Yangor Avenue', 'Parkville', 'Missouri', '65599', '255800440636');
INSERT INTO public.distributor VALUES (1, 'El Camino Young Films', '2015-08-29 00:00:00', 1);
INSERT INTO public.distributor VALUES (2, 'North Milwuake Movie Company', '2007-09-15 00:00:00', 6);
INSERT INTO public.distributor VALUES (3, 'Bingham Young Pictures', '2012-08-16 00:00:00', 7);
INSERT INTO public.distributor VALUES (4, 'Sunset Studios', '2003-08-16 00:00:00', 8);
INSERT INTO public.distributor VALUES (5, 'Annoying Productions', '2014-07-30 00:00:00', 9);
INSERT INTO public.catalog_item VALUES (1, 1, 'ANTITRUST TEEN', 123456, 13.99, 1, '2018-10-25 14:48:20', 'DVD', '2019-11-18 14:48:20');
INSERT INTO public.catalog_item VALUES (2, 2, 'APOLLO TOMATOES', 456123, 16.99, 2, '2017-12-15 14:48:20', 'DVD', '2018-10-25 14:48:20');
INSERT INTO public.catalog_item VALUES (3, 3, 'BARABELLA LIBERTY', 789456, 17.50, 3, '2019-11-18 14:48:20', 'DVD', '2019-11-18 14:48:20');
INSERT INTO public.catalog_item VALUES (4, 4, 'BIRD WHISPERER', 987654, 19.20, 4, '2016-09-22 14:48:20', 'VIDEO', '2017-08-16 14:48:20');
INSERT INTO public.catalog_item VALUES (5, 5, 'CARIBBEAN LIBERTY', 321654, 15.25, 5, '2017-08-16 14:48:20', 'VIDEO', '2016-09-22 14:48:20');
INSERT INTO public.inventory_item VALUES (1, 5, 3.99, '5', 21.99, 'VIDEO', 'NEW', '2015-10-29 14:48:20', NULL, 4);
INSERT INTO public.inventory_item VALUES (2, 4, 4.99, '5', 18.99, 'VIDEO', 'GOOD', '2015-10-29 14:48:20', NULL, 5);
INSERT INTO public.inventory_item VALUES (3, 3, 5.99, '3', 17.99, 'DVD', 'FAIR', '2015-10-29 14:48:20', NULL, 3);
INSERT INTO public.inventory_item VALUES (4, 2, 7.99, '3', 22.99, 'DVD', 'REFURB', '2015-10-29 14:48:20', NULL, 2);
INSERT INTO public.inventory_item VALUES (5, 1, 1.99, '3', 39.99, 'DVD', 'DAMAGED', '2015-10-29 14:48:20', NULL, 1);
INSERT INTO public.customer VALUES (1, 'HW12451', 'Helen', 'Willson', 'helen.willson@jdvidcustomer.org', 1, '2019-05-27 17:07:36', '2019-10-27 17:07:36', 7);
INSERT INTO public.customer VALUES (2, 'BB34521', 'Betty', 'Brown', 'betty.brown@jdvidcustomer.org', 1, '2019-10-25 08:30:16', '2019-10-29 14:30:16', 9);
INSERT INTO public.customer VALUES (3, 'NJ34512', 'Nancy', 'Jones', 'nancy.jones@jdvidcustomer.org', 1, '2019-08-25 10:30:16', '2019-09-25 10:34:45', 12);
INSERT INTO public.customer VALUES (4, 'KM87152', 'Karen', 'Moore', 'karen.moore@jdvidcustomer.org', 1, '2019-06-18 20:51:07', '2019-07-06 18:35:25', 3);
INSERT INTO public.customer VALUES (5, 'LT45381', 'Lisa', 'Taylor', 'lisa.taylor@jdvidcustomer.org', 1, '2019-06-21 13:51:07', '2019-08-21 11:25:40', 1);
INSERT INTO public.staff VALUES (1, 'Susan', 'Reik', 'sreik@jdvidstaff.org', 1, 'sreik', 'encryptedtext', 6);
INSERT INTO public.staff VALUES (2, 'Michael', 'Christensen', 'mchristensen@jdvidstaff.org', 1, 'mchristensen', 'encryptedtext', 4);
INSERT INTO public.staff VALUES (3, 'Brenda', 'Turner', 'bturner@jdvidstaff.org', 1, 'bturner', 'encryptedtext', 2);
INSERT INTO public.staff VALUES (4, 'Greg', 'Welch', 'gwelch@jdvidstaff.org', 1, 'gwelch', 'encryptedtext', 12);
INSERT INTO public.staff VALUES (5, 'Diane', 'Oswatamie', 'doswatamie@jdvidstaff.org', 1, 'doswatamie', 'encryptedtext', 11);
INSERT INTO public.rental VALUES (1, 5, '2019-10-12 14:45:20', 1.25, 5, '2019-10-16 10:45:20', 2, 1.75, NULL, NULL);
INSERT INTO public.rental VALUES (2, 4, '2019-10-30 13:44:10', 1.25, 3, NULL, 2, NULL, NULL, NULL);
INSERT INTO public.rental VALUES (3, 3, '2019-10-09 12:55:15', 1.25, 4, '2019-10-15 10:45:20', 2, 2.50, NULL, NULL);
INSERT INTO public.rental VALUES (4, 2, '2019-10-18 11:22:44', 1.25, 1, '2019-10-23 20:31:44', 4, NULL, 5.00, NULL);
INSERT INTO public.rental VALUES (5, 3, '2019-10-13 09:48:22', 1.25, 2, '2019-10-16 19:17:36', 4, NULL, NULL, NULL);
INSERT INTO public.rental VALUES (6, 2, '2019-10-07 11:48:17', 1.25, 3, '2019-10-16 11:25:18', 4, 5.50, NULL, 2.50);
INSERT INTO public.rental VALUES (7, 3, '2019-10-21 15:33:17', 1.25, 1, '2019-10-24 14:15:01', 4, NULL, NULL, NULL);
INSERT INTO public.rental VALUES (8, 1, '2019-10-20 17:45:59', 1.25, 3, '2019-10-25 14:35:19', 4, NULL, NULL, 2.50);
INSERT INTO public.rental VALUES (9, 2, '2019-10-15 19:38:20', 1.25, 5, '2019-10-20 18:45:21', 4, NULL, 5.00, NULL);
INSERT INTO public.payment VALUES (1, 5, 2.99, '2015-10-29 20:48:20');
INSERT INTO public.payment VALUES (2, 4, 5.99, '2015-10-29 11:22:20');
INSERT INTO public.payment VALUES (3, 3, 0.99, '2015-10-29 12:55:20');
INSERT INTO public.payment VALUES (4, 2, 4.99, '2015-10-29 13:35:20');
INSERT INTO public.payment VALUES (5, 1, 7.99, '2015-10-29 14:45:20');
INSERT INTO public.academy_award VALUES (1, 'BEST ACTOR');
INSERT INTO public.academy_award VALUES (2, 'BEST PICTURE');
INSERT INTO public.academy_award VALUES (3, 'BEST ACTRESS');
INSERT INTO public.academy_award VALUES (4, 'BEST DIRECTOR');
INSERT INTO public.academy_award VALUES (5, 'BEST STORY');
INSERT INTO public.movie_has_academy_award VALUES (1, 5);
INSERT INTO public.movie_has_academy_award VALUES (1, 4);
INSERT INTO public.movie_has_academy_award VALUES (2, 4);
INSERT INTO public.movie_has_academy_award VALUES (2, 2);
INSERT INTO public.movie_has_academy_award VALUES (3, 3);
INSERT INTO public.movie_has_academy_award VALUES (4, 2);
INSERT INTO public.movie_has_academy_award VALUES (5, 1);
