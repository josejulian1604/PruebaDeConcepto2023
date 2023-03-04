"""
The flask application package.
"""

from flask import Flask
app = Flask(__name__)

import Prueba.views
import Prueba.database

"""import pyodbc

# Set up connection details
server = 'DESKTOP-LHKIQDK'
database = 'Tarea1_2023'
username = 'sa'
password = 'CowardlySpice16'

# Create a connection to the database
conn = pyodbc.connect('DRIVER={SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)

# Create a cursor object to execute SQL statements
cursor = conn.cursor()"""



"""# Execute the stored procedure
cursor.execute('EXEC OrdenarArticulos')

# Fetch all rows returned by the stored procedure
rows = cursor.fetchall()

# Print the results
for row in rows:
    print(row)"""
