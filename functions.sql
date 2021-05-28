use sakila;

delimiter //

create function GetLanguage(lang_id INT)
RETURNS VARCHAR(100)
BEGIN

DECLARE LangName varchar(100);

select name
into LangName
from language
where language_id = lang_id;

return(LangName);

END //

delimiter ;

select GetLanguage(2);

select title, language_id, GetLanguage(language_id) as language
from film;