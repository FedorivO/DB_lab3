import cx_Oracle
import csv

username = 'user2'
password = 'user2'
database = 'localhost'

row_num = 1
states = []

  
connection = cx_Oracle.connect(username,password, database)
cursor = connection.cursor()

filename = "fatal-police-shootings-data.csv"


file = open('fatal-police-shootings-data.csv', errors='ignore')
reader = csv.DictReader(file, delimiter=',')
  

try:
    for row in reader:
        
        shoot_id = row_num
        row_num += 1
        name = row['name']
        city_name = row['city']
        date_ = (row['date'])
        manner_of_death = (row['manner_of_death'])
        armed = (row['armed'])
        age = int(row['age'])
        gender_name = row['gender']
        
        state = row['state']
        if state not in states:
            states_query = "INSERT INTO State (state_name) VALUES (:state_name)"
            cursor.execute(states_query, state=state)
            states.append(state)


        
        insert_query = """INSERT INTO Criminal(city_name, shoot_id, name, date_, manner_of_death, armed, age, gender_name)
            VALUES (:city_name, :shoot_id, :name, TO_DATE(:date_,'yyyy-mm-dd'), :manner_of_death, :armed, :age, :gender_name)"""
        cursor.execute(insert_query, city_name=city_name, shoot_id=shoot_id, name=name, date_=date_, manner_of_death=manner_of_death, armed=armed, age=age, gender_name=gender_name)	

        insert_query = """INSERT INTO City(state_name, city_name)
            VALUES (:state_name, :city_name)"""
        cursor.execute(insert_query, state_name=state_name, city_name=city_name)		

        insert_query = """INSERT INTO Person(name, date_,manner_of_death,age,gender_name)
            VALUES (:name, :TO_DATE(:date_,'yyyy-mm-dd'), :manner_of_death, :age, :gender_name)"""
        cursor.execute(name=name, date_=date_ , manner_of_death=manner_of_death, age=age, gender_name=gender_name)


  
except Exception as e:
    print(f'An error on line {row_num} - {e}')  
raise
    
file.close()
connection.commit()   
cursor.close()
connection.close()
    
        
