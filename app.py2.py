from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///concessionaria.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False  # Desativa o rastreamento de modificações para evitar warnings
db = SQLAlchemy(app)

class Produto(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(50), nullable=False)
    descricao = db.Column(db.String(200))
    preco = db.Column(db.Float)
    ano_fabricacao = db.Column(db.Integer)

# Rota para exibir produtos
@app.route('/')
def produtos():
    with app.app_context():
        db.create_all()
        lista_produtos = Produto.query.all()
        return render_template('produtos.html', produtos=lista_produtos)

if __name__ == '__main__':
    app.run(debug=True, threaded=False)  # Desativa o uso de threads


    
