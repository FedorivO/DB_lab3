import cx_Oracle
import csv

username = 'user2'
password = 'user2'
database = 'localhost'

connection = cx_Oracle.connect(username,password, database)
cursor = connection.cursor()


tables = ['State', 'City', 'Criminal', 'Person']

for table in tables:
    with open(f'{table}.csv', 'w', newline='') as file:
        writer = csv.writer(file, delimiter=',')

        query = f'SELECT * FROM {table}'
        cursor.execute(query)

        row = cursor.fetchone()
         while row:
            writer.writerow(row)
            row = cursor.fetchone()
        


cursor.close()
connection.close()
