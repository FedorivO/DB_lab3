CREATE TABLE State (
    state_name VARCHAR(20) NOT NULL PRIMARY KEY
);
ALTER TABLE State
    ADD CONSTRAINT state_name_pk PRIMARY KEY(state_name);



CREATE TABLE City (
  state_name VARCHAR(20) NOT NULL,
  city_name VARCHAR(20) NOT NULL 
);
ALTER TABLE City
    ADD CONSTRAINT city_name_pk PRIMARY KEY(city_name); 
ALTER TABLE City
    ADD CONSTRAINT state_name_fk FOREIGN KEY(state_name) REFERENCES State(state_name);



CREATE TABLE Person (
    name VARCHAR(50) NOT NULL,
    date_ timestamp,
    manner_of_death VARCHAR(50),
    age NUMBER(3, 0) NOT NULL,
    gender_name VARCHAR(6) NOT NULL
);
ALTER TABLE Person
    ADD CONSTRAINT date__pk PRIMARY KEY(date_);
    
    
    

CREATE TABLE Criminal (
  city_name VARCHAR(20) NOT NULL,
  shoot_id NUMBER(10, 0) NOT NULL,
  name VARCHAR(40) NOT NULL,
  date_ TIMESTAMP NOT NULL,
  manner_of_death VARCHAR(30),
  armed VARCHAR(30),
  age NUMBER(3, 0) NOT NULL,
  gender_name VARCHAR(6) NOT NULL
);
ALTER TABLE Criminal
    ADD CONSTRAINT shoot_id_pk PRIMARY KEY(shoot_id);
ALTER TABLE Criminal
    ADD CONSTRAINT city_name_fk FOREIGN KEY(city_name) REFERENCES City(city_name);
ALTER TABLE Criminal
    ADD CONSTRAINT date__fk FOREIGN KEY(date_) REFERENCES Person(date_);
