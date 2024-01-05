from flask import Flask, request, render_template, redirect, url_for
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'labinfo'
app.config['MYSQL_DB'] = 'mydb'

mysql = MySQL()
mysql.init_app(app)

@app.route('/produto')
def produto():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM produto")
    data = cursor.fetchall()
    cursor.close()
    return str(data)

@app.route('/cliente')
def clientes():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM cliente")
    data = cursor.fetchall()
    cursor.close()
    return str(data)