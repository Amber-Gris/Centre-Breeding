--****PLEASE ENTER YOUR DETAILS BELOW****
--T1-cb-schm.sql

--Student ID: 31336825
--Student Name: Xin Li
--Tutorial No: 22

/* Comments for your marker:




*/

/*
Using the model and details supplied, and the supplied T1-cb-schm.sql
file, create an SQL schema file which can be used to create this database in
Oracle.
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

DROP TABLE SPECIES CASCADE CONSTRAINTS PURGE;

CREATE TABLE SPECIES
(
spec_genus VARCHAR(20) NOT NULL,
spec_name VARCHAR(20) NOT NULL,
spec_popular_name VARCHAR(40) NOT NULL,
spec_family VARCHAR(20) NOT NULL,
spec_natural_range VARCHAR(100) NOT NULL,
CONSTRAINT pk_species PRIMARY KEY (spec_genus, spec_name),
CONSTRAINT uq_popular_name UNIQUE (spec_popular_name)
);

COMMENT on column species.spec_genus IS 'Species Genus';
COMMENT on column species.spec_name IS 'Species Name';
COMMENT on column species.spec_popular_name IS 'Species Popular Name';
COMMENT on column species.spec_family IS 'Species Family';
COMMENT on column species.spec_natural_range IS 'Species Natural Range';

DROP TABLE CENTRE CASCADE CONSTRAINTS PURGE;

CREATE TABLE CENTRE
(
centre_id CHAR(6) NOT NULL,
centre_name VARCHAR(40) NOT NULL,
centre_address VARCHAR(100) NOT NULL,
centre_director VARCHAR(30) NOT NULL,
centre_phone_no VARCHAR(20) NOT NULL,
CONSTRAINT pk_centre PRIMARY KEY (centre_id),
CONSTRAINT uq_centre_name UNIQUE (centre_name)
);

COMMENT on column centre.centre_id IS 'Centre ID';
COMMENT on column centre.centre_name IS 'Centre Name';
COMMENT on column centre.centre_address IS 'Centre Address';
COMMENT on column centre.centre_director IS 'Centre Director';
COMMENT on column centre.centre_phone_no IS 'Centre Phone number';

DROP TABLE ANIMAL CASCADE CONSTRAINTS PURGE;

CREATE TABLE ANIMAL
(
animal_id NUMERIC(6) NOT NULL,
animal_sex CHAR(1) NOT NULL,
brevent_id NUMERIC(6),
centre_id CHAR(6) NOT NULL,
spec_genus VARCHAR(20) NOT NULL,
spec_name VARCHAR(20) NOT NULL,
CONSTRAINT pk_animal PRIMARY KEY (animal_id)
);

COMMENT on column animal.animal_id IS 'Animal ID';
COMMENT on column animal.animal_sex IS 'Animal Sex';
COMMENT on column animal.brevent_id IS 'Brevent ID';
COMMENT on column animal.centre_id IS 'Centre ID';
COMMENT on column animal.spec_genus IS 'Species Genus';
COMMENT on column animal.spec_name IS 'Species Name';

DROP TABLE BREEDING_EVENT CASCADE CONSTRAINTS PURGE;

CREATE TABLE BREEDING_EVENT
(
brevent_id NUMERIC(6) NOT NULL,
brevent_date Date NOT NULL,
mother_id NUMERIC(6) NOT NULL,
father_id NUMERIC(6) NOT NULL,
CONSTRAINT pk_breeding_event PRIMARY KEY (brevent_id),
CONSTRAINT fk_breeding_mother FOREIGN KEY (mother_id) REFERENCES animal (animal_id),
CONSTRAINT fk_breeding_father FOREIGN KEY (father_id) REFERENCES animal (animal_id)
);

COMMENT on column breeding_event.brevent_id IS 'Brevent ID';
COMMENT on column breeding_event.brevent_date IS 'Brevent Date';
COMMENT on column breeding_event.mother_id IS 'Mother ID';
COMMENT on column breeding_event.father_id IS 'Father ID';

ALTER TABLE ANIMAL
ADD
(
CONSTRAINT fk_animal_breeding FOREIGN KEY (brevent_id) REFERENCES breeding_event (brevent_id),
CONSTRAINT fk_animal_centre FOREIGN KEY (centre_id) REFERENCES centre (centre_id),
CONSTRAINT fk_animal_species FOREIGN KEY (spec_genus, spec_name) REFERENCES species (spec_genus, spec_name),
CONSTRAINT sex_check CHECK (animal_sex in ('M','F'))
);
