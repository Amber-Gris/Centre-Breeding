--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-cb-insert.sql

--Student ID: 31336825
--Student Name: Xin Li
--Tutorial No: 22

/* Comments for your marker:




*/

/*
Task 2 (b):

Load the ANIMAL and BREEDING_EVENT tables with your own test data using the 
supplied T2-cb-insert.sql file script file, and SQL commands which will  
insert as a minimum, the following sample data -
 - 12 animals, some of which must have been captured from the wild, i.e. 
      are not the offspring from a breeding event, and
- 4 breeding events
Your inserted rows must meet the assignment specification requirements
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

insert into animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name)
values (1, 'F', null, 'SAF10', 'Equus','zebra');
commit;
insert into animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name)
values (2, 'M', null, 'SAF10', 'Equus','zebra');
commit;
insert into breeding_event (brevent_id, brevent_date, mother_id, father_id)
values (1, to_date('13-Jan-2020', 'dd-Mon-yyyy'), 1, 2);
commit;
insert into animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name)
values (3, 'F', 1, 'SAF10', 'Equus','zebra');
commit;
insert into animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name)
values (4, 'F', null, 'AUS40', 'Panthera','leo');
commit;
insert into animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name)
values (5, 'M', null, 'AUS30', 'Panthera','leo');
commit;
insert into breeding_event (brevent_id, brevent_date, mother_id, father_id)
values (2, to_date('27-Jan-2020', 'dd-Mon-yyyy'), 4, 5);
commit;
insert into animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name)
values (6, 'M', 2, 'AUS40', 'Panthera','leo');
commit;
insert into animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name)
values (7, 'F', null, 'AUS30', 'Panthera','leo');
commit;
insert into breeding_event (brevent_id, brevent_date, mother_id, father_id)
values (3, to_date('15-Mar-2020', 'dd-Mon-yyyy'), 7, 5);
commit;
insert into animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name)
values (8, 'F', 3, 'AUS30', 'Panthera','leo');
commit;
insert into animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name)
values (9, 'M', 3, 'AUS30', 'Panthera','leo');
commit;
insert into animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name)
values (10, 'M', null, 'SAF20', 'Equus','zebra');
commit;
insert into breeding_event (brevent_id, brevent_date, mother_id, father_id)
values (4, to_date('23-Jan-2021', 'dd-Mon-yyyy'), 1, 10);
commit;
insert into animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name)
values (11, 'M', 4, 'SAF10', 'Equus','zebra');
commit;
insert into animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name)
values (12, 'F', 4, 'SAF10', 'Equus','zebra');
commit;

