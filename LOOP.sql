DECLARE 

    value_of_iteration INT NOT NULL DEFAULT 1; 

BEGIN

    FOR i IN 1..value_of_iteration LOOP

        INSERT INTO CRIMINAL (city_name, shoot_id, name, date_, manner_of_death, armed, age, gender_name)
            VALUES ('Golden Shores', 2335, 'Drey Krause', '13-02-17',	'shot', 'gun',	53, 'M');
        INSERT INTO Criminal (city_name, shoot_id, name, date_, manner_of_death, armed, age, gender_name)
            VALUES ('Topeka', 377, 'Richard Reed', '10-04-15',	'shot', 'gun',	38, 'M');
        INSERT INTO CRIMINAL (city_name, shoot_id, name, date_, manner_of_death, armed, age, gender_name)
            VALUES ('Topeka', 1344, 'Randall J. Selsor', '07-03-16',	'shot', 'undetermined',	45, 'M');
        INSERT INTO CRIMINAL (city_name, shoot_id, name, date_, manner_of_death, armed, age, gender_name)
            VALUES ('Topeka', 3202, 'Dominique Tyrell White', '28-09-17',	'shot', 'gun',	30,	 'M');

    END LOOP;

END;
