delimiter //

create procedure getLanguage()
begin
	select * from sakila.language;
end //

delimiter ;

call getLanguage();

delimiter //

create procedure WhileLoop()
BEGIN
	DECLARE i INT DEFAULT 1;
    WHILE i < 6 DO
		SELECT POW(i, i);
        SET i = i + 1;
	END WHILE;
END //

delimiter ;

call WhileLoop();

delimiter //

create procedure ConcatName(FirstName VARCHAR(100), LastName VARCHAR(100))
BEGIN
	DECLARE FullName VARCHAR(200);
    SET FullName = concat(FirstName, LastName);
    SELECT FullName;
END //

delimiter ;

call ConcatName('Latish', ' Pavan');

use sakila;

delimiter //

create procedure InsertValue( NameofLang VARCHAR( 200 ) )
BEGIN

	INSERT into sakila.language( name, last_update )
    VALUES( NameofLang, NOW() );

	SELECT LAST_INSERT_ID();
END //

delimiter ;

CALL InsertValue( "English" );