CREATE TABLE State (
    state_name VARCHAR(20) NOT NULL PRIMARY KEY
);





CREATE TABLE City (
  state_name VARCHAR(20) NOT NULL REFERENCES State(state_name),
  city_name VARCHAR(20) NOT NULL PRIMARY KEY
);


CREATE TABLE Criminal (
  city_name VARCHAR(20) NOT NULL REFERENCES City(city_name),
  shoot_id NUMBER(10, 0) NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  date_ timestamp NOT NULL,
  manner_of_death VARCHAR(50),
  armed VARCHAR(50),
  age NUMBER(3, 0) NOT NULL,
  gender_name VARCHAR(6) NOT NULL
);




CREATE TABLE Person (
    name VARCHAR(50) NOT NULL,
    date_ timestamp PRIMARY KEY,
    manner_of_death VARCHAR(50),
    age NUMBER(3, 0) NOT NULL,
    gender_name VARCHAR(6) NOT NULL
);

