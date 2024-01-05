from flask import Flask, request, render_template, redirect, url_for
from flask_mysqldb import MySQL
from flask_sqlalchemy import SQLAlchemy


app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'labinfo'
app.config['MYSQL_DB'] = 'mydb'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///products.db'

db = SQLAlchemy(app)

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

@app.route('/form', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        nome = request.form['nome']
        ano = request.form['ano']
        marca = request.form['marca']
        cor = request.form['cor']
        categoria = request.form['categoria']
        preco = request.form['preco']
        descricao = request.form['descricao']
        estoque = request.form['estoque']

        cursor = mysql.connection.cursor()
        cursor.execute('''
            INSERT INTO produto (nome, ano, marca, cor, categoria, preco, descricao, estoque)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        ''', (nome, ano, marca, cor, categoria, preco, descricao, estoque))
        mysql.connection.commit()
        cursor.close()

        return redirect(url_for('index'))

    return render_template('form.html')

class Product(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.String(200))
    price = db.Column(db.Float, nullable=False)


@app.route('/consulta', methods=['GET', 'POST'])
def consulta():
    results = [] 
    if request.method == 'POST':
        nome_produto = request.form['nome']
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM produto WHERE nome LIKE %s", ['%' + nome_produto + '%'])
        results = cursor.fetchall()
        cursor.close()
    return render_template('consulta.html', results=results)

if __name__ == '__main__':
    app.run(debug=True)