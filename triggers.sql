drop trigger if exists language_before_insert;

delimiter //

create trigger language_before_insert
before insert on language
for each row
begin
	set new.name = concat( upper(substring(new.name, 1, 1)), lower(substring(new.name from 2)));

end //

delimiter ;

insert into language(name)
values('SPANISH');

create table audit_language
( language_id tinyint(3), name char(20),
	last_update timestamp, rowvalue char(20) );

delimiter //

create trigger language_after_update
after update on language
for each row
begin

	INSERT into audit_language
    values ( old.language_id, old.name, old.last_update, 'Before Update' );
    INSERT into audit_language 
    values( new.language_id, new.name, new.last_update, 'After Update' );

end //

delimiter ;

update language
set name = "Spanish-new"
where language_id = 10;