DECLARE 

    value_of_iteration INT NOT NULL DEFAULT 1; 

BEGIN

    FOR i IN 1..value_of_iteration LOOP

        INSERT INTO CRIMINAL (city_name, shoot_id, name, date_, manner_of_death, armed, age, city_id, gender_name)
            VALUES ('Golden Shores', 2335, 'Drey Krause', '13-02-17',	'shot', 'gun',	53,	'-114.474145	34.786267', 'M');
        INSERT INTO Criminal (city_name, shoot_id, name, date_, manner_of_death, armed, age, city_id, gender_name)
            VALUES ('Topeka', 377, 'Richard Reed', '10-04-15',	'shot', 'gun',	38,	'-95.677556	39.049011', 'M');
        INSERT INTO CRIMINAL (city_name, shoot_id, name, date_, manner_of_death, armed, age, city_id, gender_name)
            VALUES ('Topeka', 1344, 'Randall J. Selsor', '07-03-16',	'shot', 'undetermined',	45,	'-95.677556	39.049011', 'M');
        INSERT INTO CRIMINAL (city_name, shoot_id, name, date_, manner_of_death, armed, age, city_id, gender_name)
            VALUES ('Topeka', 3202, 'Dominique Tyrell White', '28-09-17',	'shot', 'gun',	30,	'-95.677556	39.049011', 'M');

    END LOOP;

END;