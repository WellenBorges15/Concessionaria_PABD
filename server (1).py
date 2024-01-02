#pip install Flask-MySQLdb

from flask import Flask
from flask_mysqldb import MySQL

app = Flask(__name__)

# Configurações do banco de dados
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'labinfo'
app.config['MYSQL_DB'] = 'biblioteca'

# Inicialização do MySQL
mysql = MySQL()
mysql.init_app(app)

@app.route('/livro')
def livro():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM livro")
    data = cursor.fetchall()
    cursor.close()
    return str(data)

@app.route('/autor/<name>')
def autor(name):
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM autor WHERE {name}")
    data = cursor.fetchall()
    cursor.close()
    return str(data)

if __name__ == '__main__':
    app.run(debug=True)