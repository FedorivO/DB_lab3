CREATE VIEW criminal_city AS
    SELECT
       city.city_name,
       criminal.shoot_id,
       criminal.date_
    FROM
        criminal
        JOIN city ON criminal.city_name = city.city_name;