from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)

# Configurações do banco de dados
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'labinfo',
    'database': 'mydb'
}

# Rota para exibir a lista de carros
@app.route('/')
def lista_carros():
    # Conectar ao banco de dados
    connection = mysql.connector.connect(**db_config)
    cursor = connection.cursor()

    # Consulta para obter a lista de carros da tabela "produtos"
    query = "SELECT * FROM produto"
    cursor.execute(query)

    # Obter os resultados da consulta
    carros = cursor.fetchall()

    # Fechar a conexão com o banco de dados
    cursor.close()
    connection.close()

    # Renderizar o template com a lista de carros
    return render_template('paginainicial.html', carros=carros)

if __name__ == '__main__':
    app.run(debug=True)
