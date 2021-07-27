--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-cb-dm.sql

--Student ID: 31336825
--Student Name: Xin Li
--Tutorial No: 22

/* Comments for your marker:




*/

/*
Task 2 (c):

Complete the listed DML actions
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- (i)
drop sequence animal_seq;
Create sequence animal_seq start with 500 increment by 1;

drop sequence brevent_seq;
Create sequence brevent_seq start with 500 increment by 1;

-- (ii)

update animal
set centre_id = (select centre_id from centre where centre_name = 'Kruger National Park')
where centre_id = (select centre_id from centre where centre_name = 'SanWild Wildlife Sanctuary');
commit;

delete from centre
where centre_name = 'SanWild Wildlife Sanctuary';
commit;

-- (iii)

insert into animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name)
values (animal_seq.nextval, 'F', null, 
(select centre_id from centre where centre_name = 'Australia Zoo'),
(select spec_genus from species where spec_popular_name = 'Tasmanian Devil'),
(select spec_name from species where spec_popular_name = 'Tasmanian Devil'));
commit;

insert into animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name)
values (animal_seq.nextval, 'M', null, 
(select centre_id from centre where centre_name = 'Werribee Open Range Zoo'),
(select spec_genus from species where spec_popular_name = 'Tasmanian Devil'),
(select spec_name from species where spec_popular_name = 'Tasmanian Devil'));
commit;
-- (iv)

insert into breeding_event (brevent_id, brevent_date, mother_id, father_id)
values (brevent_seq.nextval, to_date('10 Feb 2021','dd Mon yyyy'),
(select animal_id from animal
where spec_name = (select spec_name from species where spec_popular_name = 'Tasmanian Devil')
and brevent is null
and centre_id = (select centre_id from centre where centre_name = 'Australia Zoo')
and animal_sex = 'F'),

(select animal_id from animal
where spec_name = (select spec_name from species where spec_popular_name = 'Tasmanian Devil')
and brevent is null
and centre_id = (select centre_id from centre where centre_name = 'Werribee Open Range Zoo')
and animal_sex = 'M'));

insert into animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name)
values (animal_seq.nextval, 'F', 
--select brevent_id
(select brevent_id from brevent 
where brevent_date = to_date('10 Feb 2021','dd Mon yyyy')
and mother_id = (select animal_id from animal
where spec_name = (select spec_name from species where spec_popular_name = 'Tasmanian Devil')
and brevent is null
and centre_id = (select centre_id from centre where centre_name = 'Australia Zoo')
and animal_sex = 'F')
and father_id = (select animal_id from animal
where spec_name = (select spec_name from species where spec_popular_name = 'Tasmanian Devil')
and brevent is null
and centre_id = (select centre_id from centre where centre_name = 'Werribee Open Range Zoo')
and animal_sex = 'M')),
--select centre_id
(select centre_id from centre where centre_name = 'Australia Zoo'),
--select spec_genus
(select spec_genus from species where spec_popular_name = 'Tasmanian Devil'),
--select spec_name
(select spec_name from species where spec_popular_name = 'Tasmanian Devil'));

insert into animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name)
values (animal_seq.nextval, 'M', 
--select brevent_id
(select brevent_id from brevent 
where brevent_date = to_date('10 Feb 2021','dd Mon yyyy')
and mother_id = (select animal_id from animal
where spec_name = (select spec_name from species where spec_popular_name = 'Tasmanian Devil')
and brevent is null
and centre_id = (select centre_id from centre where centre_name = 'Australia Zoo')
and animal_sex = 'F')
and father_id = (select animal_id from animal
where spec_name = (select spec_name from species where spec_popular_name = 'Tasmanian Devil')
and brevent is null
and centre_id = (select centre_id from centre where centre_name = 'Werribee Open Range Zoo')
and animal_sex = 'M')),
--select centre_id
(select centre_id from centre where centre_name = 'Australia Zoo'),
--select spec_genus
(select spec_genus from species where spec_popular_name = 'Tasmanian Devil'),
--select spec_name
(select spec_name from species where spec_popular_name = 'Tasmanian Devil'));

commit;


