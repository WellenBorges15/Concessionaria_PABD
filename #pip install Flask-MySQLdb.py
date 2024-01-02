# Importa a biblioteca Flask para criar a aplicação web e a extensão Flask-MySQLdb para integração com MySQL
from flask import Flask
from flask_mysqldb import MySQL

# Cria uma instância da aplicação Flask
app = Flask(__name__)

# Configurações do banco de dados MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'labinfo'
app.config['MYSQL_DB'] = 'mydb'

# Inicialização da extensão MySQL com a aplicação Flask
mysql = MySQL()
mysql.init_app(app)



# Define uma rota para a URL '/carros'
@app.route('/produto')
def produto():
    # Conecta ao banco de dados
    cursor = mysql.connection.cursor()

    # Executa uma consulta SQL para selecionar todos os carros da tabela 'produto' onde a categoria é 'carro'
    cursor.execute("SELECT * FROM produto")

    # Recupera todos os resultados da consulta
    data = cursor.fetchall()

    # Fecha o cursor após a conclusão da operação
    cursor.close()

    # Retorna os dados obtidos em formato de string
    return str(data)




# Define uma rota para a URL '/clientes'
@app.route('/clientes')
def clientes():
    # Conecta ao banco de dados
    cursor = mysql.connection.cursor()

    # Executa uma consulta SQL para selecionar todos os clientes da tabela 'cliente'
    cursor.execute("SELECT * FROM cliente")

    # Recupera todos os resultados da consulta
    data = cursor.fetchall()

    # Fecha o cursor após a conclusão da operação
    cursor.close()

    # Retorna os dados obtidos em formato de string
    return str(data)

# Pode adicionar mais rotas conforme necessário, para outras tabelas ou consultas específicas

# Executa a aplicação Flask quando o script é executado diretamente
if __name__ == '__main__':
    app.run(debug=True)
