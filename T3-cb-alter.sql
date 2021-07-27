--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-cb-alter.sql

--Student ID: 31336825
--Student Name: Xin Li
--Tutorial No: 22

/* Comments for your marker:




*/

/*
Task 3:

Make the listed changes to the "live" database
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- (a)

alter table centre add (centre_total_offspring number(6) default 0);

comment on column centre.centre_total_offspring IS 'The total number of offspring at each centre';

-- (b)
/*
******* Explain here your selected approach and its advantage/s *********
Add a animal_alive to illustrate the state of the animal
update the alive state of animals
use the select statement to know if the animal is alive
*/

alter table animal add 
(animal_alive char(1), 
constraint animal_alive_check check (animal_alive in ('T', 'F')));

comment on column animal.animal_alive IS 'If the animal is alive';

update animal
set animal_alive = 'T';
commit;

select animal_alive from animal where animal_id = 7;

-- (c)

alter table centre add (centre_type varchar(20) default 'Other');

comment on column centre.centre_type IS 'The type of each centre';

update centre
set centre_type = 'Zoo'
where centre_name like '%Zoo%';

update centre
set centre_type = 'Wildlife Park'
where centre_name like '%Park%';

update centre
set centre_type = 'Sanctuary'
where centre_name like '%Sanctuary%';

update centre
set centre_type = 'Nature Reserve'
where centre_name like '%Reserve%';

commit;


