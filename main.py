import cx_Oracle
import chart_studio


chart_studio.tools.set_credentials_file(username='olyf', api_key='OHHMaCCyz9Odepd3ZKI2')


import plotly.graph_objects as go
import chart_studio.plotly as py


username = 'user2'
password = 'user2'
database = 'localhost'


connection = cx_Oracle.connect(username,password, database)
cursor = connection.cursor()



#query1
print("1.Вивести місто та загальну кількість випадків вбивст під час затримання в ньому. Місто - кількість випадків.\n")
names = []
values = []
query = """
SELECT city_name,
    COUNT(DISTINCT shoot_id) as number_of_incidents
FROM criminal_city
GROUP BY city_name
"""


cursor.execute(query) 


for row in cursor.fetchall():
    names.append (row[0])
    values.append(row[1]) 
bar = go.Bar (x = names, y = values)
py.plot([bar],auto_open = True)


#query2
print("2.Вивести місто та відсоток вбивст під час затримання відносно випадків в інших містах. Місто - відсоток від загальної кількості.\n")
names = []
values = []
query = """
SELECT city_name,
    ROUND(COUNT( DISTINCT shoot_id)*100/(SELECT COUNT(city_name) from criminal_city ), 1) as percent_of_incidents
FROM criminal_city
GROUP BY city_name
ORDER BY city_name
"""

cursor.execute(query)

for row in cursor.fetchall():
    names.append (row[0])
    values.append(row[1]) 
pie = go.Pie (labels = names, values = values)
py.plot([pie],auto_open = True)


#query3
print("3.Вивести динаміку зміни кількості вбивст під час затримання залежно від дати. Рік- кількість вбивств.\n")
names = []
values = []
query = """
SELECT EXTRACT(YEAR FROM date_),COUNT( DISTINCT city_name)
FROM criminal_city
GROUP BY  EXTRACT(YEAR FROM date_)
ORDER BY EXTRACT(YEAR FROM date_)
"""

cursor.execute(query) 
for row in cursor.fetchall():
    names.append (row[0])
    values.append(row[1]) 
scatter = go.Scatter (x = names, y = values)
py.plot([scatter],auto_open = True)


cursor.close()
connection.close()
