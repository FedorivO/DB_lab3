

DECLARE
    TYPE NUMBERS IS VARRAY(15) OF criminal.shoot_id%TYPE;
    TYPE CHARS IS VARRAY(15) OF criminal.city_name%TYPE;
    TYPE timestamp IS VARRAY(15) OF criminal.date_%TYPE;
    
    city_name CHARS;
    shoot_id NUMBERS;
    name CHARS;
    date_ timestamp;
    manner_of_death CHARS;
    armed CHARS;
    age NUMBERS;
    gender_name CHARS;
BEGIN
    city_name := CHARS('Golden Shores', 'Topeka', 'Topeka','Topeka');
    shoot_id := NUMBERS(2335, 377, 1344, 3202);
    name := CHARS('Drey Krause', 'Richard Reed','Randall J. Selsor','Dominique Tyrell White') ;
    date_ := timestamp('13-02-17', '10-04-15', '07-03-16', '28-09-17');
    manner_of_death := CHARS('shot', 'shot', 'shot', 'shot');
    armed := CHARS('gun', 'gun', 'undetermined', 'gun');
    age := NUMBERS(53, 38,45, 30);
    gender_name := CHARS('M', 'M', 'M', 'M');

    FOR i IN 1 .. shoot_id.count
    LOOP
        INSERT INTO criminal (city_name, shoot_id, name, date_, manner_of_death, armed, age, gender_name) VALUES (city_name(i), shoot_id(i), name(i), date_(i), manner_of_death(i), armed(i), age(i), gender_name(i));
        COMMIT;
    END LOOP;
END;







--
--також працює, але ітератор і не використовується в циклі, по суті тут є loop но не застосовується  толком
--DECLARE 
--
--    value_of_iteration INT NOT NULL DEFAULT 1; 
--
--BEGIN
--
--    FOR i IN 1..value_of_iteration LOOP
--
--        INSERT INTO CRIMINAL (city_name, shoot_id, name, date_, manner_of_death, armed, age, gender_name)
--            VALUES ('Golden Shores', 2335, 'Drey Krause', '13-02-17',	'shot', 'gun',	53, 'M');
--        INSERT INTO Criminal (city_name, shoot_id, name, date_, manner_of_death, armed, age, gender_name)
--            VALUES ('Topeka', 377, 'Richard Reed', '10-04-15',	'shot', 'gun',	38, 'M');
--        INSERT INTO CRIMINAL (city_name, shoot_id, name, date_, manner_of_death, armed, age, gender_name)
--            VALUES ('Topeka', 1344, 'Randall J. Selsor', '07-03-16',	'shot', 'undetermined',	45, 'M');
--        INSERT INTO CRIMINAL (city_name, shoot_id, name, date_, manner_of_death, armed, age, gender_name)
--            VALUES ('Topeka', 3202, 'Dominique Tyrell White', '28-09-17', 'shot', 'gun', 30, 'M');
--
--    END LOOP;
--
--END;




