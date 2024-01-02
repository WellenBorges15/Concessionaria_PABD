from flask import Flask
from flask_mysqldb import MySQL

app = Flask(__name__)

# Configurações do banco de dados
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'labinfo'
app.config['MYSQL_DB'] = 'mydb'

# Inicialização do MySQL
mysql = MySQL()
mysql.init_app(app)

@app.route('/produto')
def produto():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM produto")
    data = cursor.fetchall()
    cursor.close()
    return str(data)

@app.route('/cliente/<name>')
def cliente(name):
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM cliente WHERE nome = %s", (name,))
    data = cursor.fetchall()
    cursor.close()
    return str(data)

if __name__ == '__main__':
    app.run(debug=True)